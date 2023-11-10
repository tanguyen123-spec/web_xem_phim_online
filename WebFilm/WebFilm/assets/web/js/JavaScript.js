jQuery(function ($) {
    $('#movie-background').change(function () {
        $('body').css({ 'background-color': $(this).val() });
       
    });
    $('#movie-color').change(function () {
        $('body').css({ 'color': $(this).val() });

    });
});
