// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// $('div#article-control-panel').hide("fast", function () {
//     $('div#article-control-panel').show()
// })
$('button#paragraph-btn').click(function () {
    $('div#article-control-panel').hide("fast", function () {
        $('div#new-paragraph').show();
    });
});

$('button#cancel-para-btn').click(function () {
    $('div#new-paragraph').hide("fast", function () {
        $('div#article-control-panel').show();
    });
})
;
