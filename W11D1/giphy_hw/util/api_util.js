export const fetchSearchGiphys = searchTerm => (
    $.ajax ({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=9nFESzXMKfwm9HJom07FVXmWYW9FNaQP&limit=2`
    })
)