/**
 * Created by Stefann on 13/11/2018.
 */

$(function () {
    $(document).on('click', '.action-choice-trigger', function (e) {
        e.preventDefault();
        var target = $(e.currentTarget),
            choiceTarget = target.attr('data-target'),
            choices = $('.action-choice');
        choices.fadeOut('fast');
        $(choiceTarget).fadeIn('fast');
    });
    var step = 1;
    var displayStep = function () {
        $('.steps .step').removeClass('active');
        var current = $('.steps .step[data-index="'+step+'"]');
        current.addClass('active');
        current.find('.next-line .btn').removeClass('disabled');
        $('.step-indicators .step-indicator').removeClass('active');
        for(var i = 1; i <= step; i++ ){
            var current = $('.step-indicators .step-indicator[data-index="'+i+'"]');
            current.addClass('active');
        }
    };
    $(document).on('click','.next-line .btn:not(.disabled)', function (e) {
        e.preventDefault();
        $(this).addClass('disabled');
        if($(this).hasClass('next-btn')){
            step++;
        }else{
            step--;
        }
        displayStep();
    });
    var $collectionHolder;
    var $addButton = $('<button type="button" class="add_adress_link btn btn-info">Ajouter</button>');
    var $newLink = $('<div></div>').append($addButton);
    $collectionHolder = $('#appbundle_societe_adresseSocietes');
    $collectionHolder.append($newLink);
    $collectionHolder.data('index', $collectionHolder.find(':input').length);
    $addButton.on('click', function(e) {
        // add a new tag form (see next code block)
        addForm($collectionHolder, $newLink);
    });
    function addForm($collectionHolder, $newLink) {
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
        var form = $(newForm);
        // increase the index with one for the next item
        $collectionHolder.data('index', index + 1);

        $newLink.before(form);
        var fields = form.find('.nested-field');
        console.log(fields);
        var line = fields.parent().parent().children();
        console.log(line);
        line.addClass('form-line');
    }

});