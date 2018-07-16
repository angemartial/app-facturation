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