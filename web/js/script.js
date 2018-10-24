/**
 * Created by Eliket-Grp on 16/07/2018.
 */
window.onload = function () {

    /*
    script ajout de tableau de listage
     */

    var admin = {
        init: function () {
            _.forEach(admin.events, function (callback, eventSpec) {
                var parts = _.split(eventSpec, ' ');
                $(document).on(parts[0], _.join(_.slice(parts, 1), ' '), callback);
            });
            $('#document-list').DataTable({
                'language' : admin.language
            });
        },
        language: {
            "decimal":        "",
            "emptyTable":     "Aucune donnée disponible",
            "info":           "Afficher _START_ à _END_ des entrées _TOTAL_",
            "infoEmpty":      "Afficher 0 à 0 de 0 entrées",
            "infoFiltered":   "(filtré à partir des entrées totales _MAX_)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "Afficher les entrées _MENU_",
            "loadingRecords": "Chargement...",
            "processing":     "En traitement...",
            "search":         "Rechercher:",
            "zeroRecords":    "Aucun enregistrements correspondants trouvés",
            "paginate": {
                "first":      "Premier",
                "last":       "Dernier",
                "next":       "Suivant",
                "previous":   "Précedent"
            },
            "aria": {
                "sortAscending":  ": activer pour trier la colonne en croissant",
                "sortDescending": ": activer pour trier la colonne décroissante"
            }
        },
        events: {
            'click #left-menu > li a': function (e) {
                var parent = $(e.currentTarget).parent();
                var child = parent.find('ul');
                console.log(parent);
                if(child.length){
                    e.preventDefault();
                    child.slideToggle();
                    $('#left-menu').find('a').removeClass('drop-open');
                    $(e.currentTarget).addClass('drop-open');
                    parent.siblings().find('ul').slideUp();
                }
            }
        }
    };
    admin.init();
    /*
    fin du tableau
     */

    $(function () {
        $('.datepicker').datetimepicker({
            locale: 'fr',
            format: 'D MM YYYY'
        });
        $('.select-container').find('select').addClass('form-control');
        $('textarea:not(.widen)').trumbowyg({
            lang: 'fr',
            resetCss: true
        });
        $('.document-line > div > div').addClass('ligne-widget');
        var $collectionHolder;

        // setup an "add a tag" link
        var $addLigneButton = $('<button type="button" class="add_ligne_link btn btn-info">Ajouter une nouvelle ligne</button>');
        var $newLinkLi = $('<li></li>').append($addLigneButton);

        // Get the ul that holds the collection of tags
        $collectionHolder = $('ul.lignes');

        // add the "add a tag" anchor and li to the tags ul
        $collectionHolder.append($newLinkLi);

        // count the current form inputs we have (e.g. 2), use that as the new
        // index when inserting a new item (e.g. 2)
        $collectionHolder.data('index', $collectionHolder.find(':input').length);

        $addLigneButton.on('click', function(e) {
            // add a new tag form (see next code block)
            addLigneForm($collectionHolder, $newLinkLi);
        });
        $addLigneButton.click();
        $(document).on('change', '.qte, .tva, .pu', function (e) {
            var line = $(e.currentTarget).parents('.document-line');
            updateTtc(line);
        });
        $('.document-line').each(function () {
            updateTtc($(this));
        });
        function updateTtc(line) {
            var qte = parseFloat( line.find('.qte').val()) || 0,
                tva = parseFloat( line.find('.tva option:selected').text()) || 0,
                pu = parseFloat( line.find('.pu').val()) || 0,
                totalElement = line.find('.total-ttc'),
                total = 0;

            if(qte !== 0 && pu !== 0){
                var totalHt = pu * qte;
                line.attr('data-ht', totalHt);
                total = totalHt + (totalHt * tva / 100);
            }
            totalElement.val(total);
            var lines = line.parent().children('.document-line'),
                totauxHT = 0,
                totauxTTC = 0;
            lines.each(function () {
                var totalHt = parseFloat($(this).attr('data-ht')) || 0;
                totauxHT += totalHt;
                var totalTTC = parseFloat( $(this).find('.total-ttc').val()) || 0;
                totauxTTC += totalTTC;
            });
            $('.totaux-ht-value').text(totauxHT);
            $('.totaux-ttc-value').text(totauxTTC);
        }
        $(document).on('click', '.remove-document-line', function (e) {
            var button = $(e.currentTarget);
            button.parents('.document-line').remove();
        });
    });
    function addLigneForm($collectionHolder, $newLinkLi) {
        // Get the data-prototype explained earlier
        var prototype = $collectionHolder.data('prototype');

        // get the new index
        var index = $collectionHolder.data('index');

        var newForm = prototype;
        // You need this only if you didn't set 'label' => false in your tags field in TaskType
        // Replace '__name__label__' in the prototype's HTML to
        // instead be a number based on how many items we have
        // newForm = newForm.replace(/__name__label__/g, index);

        // Replace '__name__' in the prototype's HTML to
        // instead be a number based on how many items we have
        newForm = newForm.replace(/__name__/g, index);

        // increase the index with one for the next item
        $collectionHolder.data('index', index + 1);

        // Display the form in the page in an li, before the "Add a tag" link li
        var $newFormLi = $('<li  class="document-line"></li>').append(newForm);
        var button = $('<button type="button" title="Supprimer cette ligne" class="btn btn-danger remove-document-line" aria-label="Close"><span aria-hidden="true">&times;</span> </button>');
        $newFormLi.append(button);
        $newFormLi.children('div').addClass('ligne-widget');
        $newLinkLi.before($newFormLi);
    }
    var catalogue = {
        'isInitiated': false,
        'page': 1,
        'q': '',
        'trigger': null,
        'changed': false,
        'container': $("#catalogue"),
        'load': function () {
            if(catalogue.isInitiated && catalogue.changed === false){
                return;
            }
            var url = Routing.generate('catalogue_modal');
            url += '/' + catalogue.page;
            if(catalogue.q.length){
                url += '/' + catalogue.q
            }
            $.get(url, function (data) {
                if(catalogue.page = 1){
                    catalogue.container.html(data);
                }else{
                    catalogue.append($(data));
                }
                catalogue.isInitiated = true;
                catalogue.page++;
                catalogue.changed = false;
            });
        }
    };
    $(document).on('click', '.choose-article', function () {
        catalogue.load();
        catalogue.trigger = $(this);
    });
    $(document).on('keyup', '.filter-catalogue', function (e) {
        var target = $(e.currentTarget),
            value = $.trim(target.val());
        if(value.length < 3 ){
            return;
        }
        catalogue.q = value;
        catalogue.page = 1;
        catalogue.changed = true;
        catalogue.load();
    });
    $(document).on('click', '.add-product-in-modal', function (e) {
        var trigger = catalogue.trigger,
            target = $(e.currentTarget),
            line = trigger.parents('.ligne-widget');
        line.find('.reference-input').val(target.attr('data-reference'));
        line.find('.designation-input').val(target.attr('data-designation'));
        line.find('.pu-input').val(target.attr('data-pu'));
        $('#article-modal').modal('hide');
    });

};


