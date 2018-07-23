function search_by_tag() {
    $.getJSON("/search_articles_by_tags?name=" + $("#search_input").val(), function (data) {
        $('#jar-search-results').html("");
        if (data.length === 0) {
            var result = $('<div class="uk-container jar-result"><div class="search-description" >Data not found!</div></div>');
            $('#jar-search-results').append(result);

            $('#jar-search-results').show();
        } else {
            $.each(data, function (key, value) {

                var intro_text;
                if (value.intro.length > 200)
                    intro_text = value.intro.substr(0, 200) + '...';
                else
                    intro_text = value.intro;

                var result = $('<div class="uk-container jar-result"></div>');
                var link = $('<a href="/articles/' + value.id + '"></a>');
                var title = $('<h4 class="search-title">' + value.title + '</h4>');
                var intro = $('<p class="search-description">' + intro_text + '</p>');

                link.append(title);
                result.append(link);
                result.append(intro);
                $('#jar-search-results').append(result)
            })

            $('#jar-search-results').show();
        }
    });

};

function search_by_title() {
    $.getJSON("/search_articles_by_title?title=" + $("#search_input").val(), function (data) {
        $('#jar-search-results').html("");
        if (data.length === 0) {
            var result = $('<div class="uk-container jar-result"><div class="search-description" >Data not found!</div></div>');
            $('#jar-search-results').append(result);

            $('#jar-search-results').show();
        } else {
            $.each(data, function (key, value) {

                var intro_text;
                if (value.intro.length > 200)
                    intro_text = value.intro.substr(0, 200) + '...';
                else
                    intro_text = value.intro;

                var result = $('<div class="uk-container jar-result"></div>');

                var link = $('<a href="/articles/' + value.id + '"></a>');
                var title = $('<h4 class="search-title">' + value.title + '</h4>')
                var intro = $('<p class="search-description">' + intro_text + '</p>')

                link.append(title);
                result.append(link);
                result.append(intro);
                $('#jar-search-results').append(result)
            })

            $('#jar-search-results').show();
        }
    });
}

function search_user() {
    $.getJSON("/search_user?name=" + $("#search_input").val(), function (data) {
        $('#jar-search-results').html("");
        if (data.length === 0) {
            var result = $('<div class="uk-container jar-result"><div class="search-description" >Data not found!</div></div>');
            $('#jar-search-results').append(result);

            $('#jar-search-results').show();
        } else {
            $.each(data, function (key, value) {

                var intro_text;
                if (value.description === null)
                    intro_text = 'no description';
                else if (value.description.length > 200)
                    intro_text = value.description.substr(0, 200) + '...';
                else
                    intro_text = value.description;

                var result = $('<div class="uk-container jar-result"></div>');

                var link = $('<a href="/user/' + value.username + '"></a>')
                var username = $('<h4 class="search-title">' + value.name + '</h4>')
                var intro = $('<p class="search-description">' + intro_text + '</p>')
                link.append(username);
                result.append(link);
                result.append(intro);
                $('#jar-search-results').append(result)
            })

            $('#jar-search-results').show();
        }
    });
}

$("#search_input").keyup(function () {
    if ($("#search_input").val().length > 2) {
        if ($('#search-options').val() == "tags")
            search_by_tag();
        if ($('#search-options').val() == "titles")
            search_by_title();
        if ($('#search-options').val() == "users")
            search_user();
    }
    else {
        $('#jar-search-results').hide();
    }
})