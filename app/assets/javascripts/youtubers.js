document.addEventListener('turbolinks:load', function () {
    document.querySelectorAll('.fav').forEach(function (b) {
        b.addEventListener('ajax:success', function () {
            console.log(b.id);
            const idea_id = b.id.replace(/[^0-9]/g, '');
            console.log(idea_id);
            let toFav = document.getElementById('fav' + idea_id);
            let cancelFav = document.getElementById('cancel_fav' + idea_id);

            if (toFav.style.display == 'none'){
                toFav.style.display = 'inline';
                cancelFav.style.display = 'none';
            } else if (toFav.style.display == 'inline'){
                toFav.style.display = 'none';
                cancelFav.style.display = 'inline';
            }
        });
    });
});