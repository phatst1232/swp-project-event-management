$j(document).ready(function () {
    if (localStorage.getItem('popState') != 'shown') {
        $j('#popup').delay(2000).fadeIn();
        localStorage.setItem('popState', 'shown')
    }

    $j('#popupokay, #popup').click(function ()
    {
        $j('#popup').fadeOut();
    });
});

