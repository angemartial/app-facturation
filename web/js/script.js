/**
 * Created by Eliket-Grp on 16/07/2018.
 */
window.onload = function () {
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
};