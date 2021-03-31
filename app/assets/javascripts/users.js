window.onload = function () {
    document.querySelector('.edit-button').addEventListener('click', function(e) {
        const show_name_form = document.querySelector('.show-name-form');
        const edit_name_form = document.querySelector('.edit-name-form');
        show_name_form.style.display = "none";
        edit_name_form.style.display = "flex";
        console.log("呼ばれた");
    });
};