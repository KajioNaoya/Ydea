document.addEventListener('turbolinks:load', function () {
    document.querySelectorAll('.fav').forEach(function (b) {
        b.addEventListener('ajax:success', function () {
            const idea_id = b.id.replace(/[^0-9]/g, '');
            let toFav = document.getElementById('fav' + idea_id);
            let cancelFav = document.getElementById('cancel_fav' + idea_id);
            let countFavText = document.getElementById('fav-count' + idea_id);
            console.log(countFavText.textContent);
            let countFav = Number(countFavText.textContent);

            if (toFav.style.display == 'none'){ //いいね取り消し
                toFav.style.display = 'inline';
                cancelFav.style.display = 'none';
                countFavText.textContent = countFav -1;

            } else if (toFav.style.display == 'inline'){ //いいね
                toFav.style.display = 'none';
                cancelFav.style.display = 'inline';
                countFavText.textContent = countFav +1;
            }
        });
    });
});