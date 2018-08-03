// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('button#gallery-btn').click(function () {
    $('div#article-control-panel').hide("fast", function () {
        $('div#new-gallery').show();
    });
});

$('button#cancel-gal-btn').click(function () {
    $('div#new-gallery').hide("fast", function () {
        $('div#article-control-panel').show();
    });
});
