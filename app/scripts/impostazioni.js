$(document).ready(function () {
    $('#importa-orario-button').click(function () {
        $('#fileInput').click();
    });

    $("#elimina-orario-button").click(function() {
        $("#alertOverlay-orario").fadeIn(500);
    });

    $("#confirmBtn-orario").click(function() {
        $("#alertOverlay-orario").fadeOut(500);

        giorniMappa = {
            0: "Lunedì",
            1: "Martedì",
            2: "Mercoledì",
            3: "Giovedì",
            4: "Venerdì",
            5: "Sabato"
        };

        for(var i = 0; i < 6; i++) {
            for(var j = 0; j < 7; j++) {
                orarioDELETE(j, giorniMappa[i]);
            }
        }
    });
});