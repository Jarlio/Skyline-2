// add or update avatar with just 1 button press
$('#avatar_input').on('change', function () {
    $('#avatar_submit').click();
})

$('button#avatar_button').click(function () {
    $('#avatar_input').click()
})

// add or update background
$('#background_input').on('change', function () {
    $('#background_submit').click();
})

$('button#background_button').click(function () {
    $('#background_input').click()
})

// 