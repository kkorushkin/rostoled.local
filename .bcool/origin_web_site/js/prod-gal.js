/**
 * Created by MI on 06.02.2017.
 */
$(document).ready(function () {

    $.each($('.gallery'), function() {
        var itemGal = $(this);

        $.each(itemGal.find('.gal-prev'), function() {
            var demo = itemGal.find('.gal-demo-img'),
                srs = $(this).find('.gal_img').attr('src');

            $(this).on('click', function (e) {

                demo.attr('src', srs);
                e.preventDefault();
            });
        });
    });
});
