document.addEventListener("DOMContentLoaded", function() {
    const nextPageButton = document.getElementById("next-page");
    const prevPageButton = document.getElementById("prev-page");

    if (nextPageButton) {
        nextPageButton.addEventListener("click", function() {
            window.location.href = "isi_peferensi_kucing.html";
        });
    }

    if (prevPageButton) {
        prevPageButton.addEventListener("click", function() {
            window.location.href = "Isi_data_user.html";
        });
    }
})
