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
    })
});