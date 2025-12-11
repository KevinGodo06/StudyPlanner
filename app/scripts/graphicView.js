let myChart, ultimoVoto, labels, arrayVoti;
graficoVoti();

$(".elemento-lista-materie").click(function () {
    const datiPerGrafico = [];
    $(".elemento-lista-materie.activeSubject").removeClass("activeSubject");
    $(this).addClass("activeSubject");

    graficoVoti();

    let media = Number($(this).find('div.media-materia').html());
    
    let idMateria = $(this).find('span.id-materia').text().trim();
    let nomeMateria = $(this).find('p.nome-materia').text().trim();
    $('#fk_id_materia').val(idMateria);
    $('#materia-nome-obiettivo').html(nomeMateria);
    $('#materia-valore-obiettivo').html($(this).find('div.media-materia').text().trim());
    $('#div-title-materia-voto').html(nomeMateria + '<hr class="hr-calendario">');
    $('#fk_id_materia_obiettivo').val(idMateria);
    $('#inputBoxVotoObiettivo').val($(this).find('span.obiettivo-materia').text().trim());


    let RequestAJAX = new XMLHttpRequest();
    RequestAJAX.open("GET", "scripts/getVotiMaterie.php?fk_id_materia=" + idMateria);
    RequestAJAX.send();

    RequestAJAX.onload = function() {
        const response = JSON.parse(RequestAJAX.responseText);

        const scrollBar = document.querySelector('#scroll-bar-voti');

        scrollBar.innerHTML = '<div class="filler"></div>';

        response.forEach(verifica => {
            const votoElem = document.createElement('div');
            votoElem.className = 'elemento-lista-voti';
            dataVerifica = formattaData(verifica.dataVerifica);

            votoElem.innerHTML = `
                <span class="id-voto">${verifica.ID}</span>
                <span class="id-materia">${verifica.fk_id_materia}</span>
                <p class="nome-voto">${verifica.nome}</p>
                <div class="voto">${verifica.voto}</div>
                <p class="data-voto">${dataVerifica}</p>
                <div>${verifica.peso}%</div>
            `;

            scrollBar.insertBefore(votoElem, scrollBar.querySelector('.filler'));

            datiPerGrafico.push({
                data: dataVerifica,
                voto: verifica.voto
            });
            
            ultimoVoto = $('.elemento-lista-voti').last().find('.voto').html();
        });

        graficoVoti(datiPerGrafico);

        if(ultimoVoto > media){
            $('#andamento-materia-crescita').html("<img src='images/main icons/crescita.jpg' height='25px' alt=''> In crescita");
        } else if(ultimoVoto < media){
            $('#andamento-materia-crescita').html("<img src='images/main icons/decrescita.jpg' height='25px' alt=''> In decrescita");
        } else {
            $('#andamento-materia-crescita').html("<img src='images/main icons/stabile.jpg' height='25px' alt=''> Stabile");
        }
    }
});

$(document).on('click', '.elemento-lista-voti', function () {
    const nome = $(this).find('p.nome-voto').text().trim();
    const data = $(this).find('p.data-voto').text().trim();
    const voto = $(this).find('div.voto').text().trim();
    const peso = $(this).find('div').last().text().trim().replace("%", "");
    const idVoto = $(this).find('span.id-voto').text().trim();
    const idMateria = $(this).find('span.id-materia').text().trim();

    $(".container-aggiungi-voto").fadeIn(500);
    $(".container-aggiungi-impegno-background").fadeIn(500);
    $("#inputBoxVoto").val(voto);
    $("#inputBoxPeso").val(peso);
    $("#inputBoxDataLezione").val(formattaDataInverse(data));
    $("#inputBoxNomeVoto").val(nome);
    $("#idVoto").val(idVoto);
    $("#fk_id_materia").val(idMateria);
    $("#aggiungi-voto-button").val("Modifica");
});

$("#elimina-voto-button").click(function() {
    const idVoto = $("#idVoto").val();
    const RequestAJAX = new XMLHttpRequest();
    RequestAJAX.open("GET", "scripts/deleteVoto.php?idVoto=" + idVoto);
    RequestAJAX.send();
    RequestAJAX.onload = function() {
        location.reload();
    }
});

$('#dettagli-obiettivo').on('click', function () {
    $('.container-dettagli-obiettivo').fadeIn(500);
    $('.container-aggiungi-impegno-background').fadeIn(500);
    const attivo = $('.elemento-lista-materie.activeSubject');

    if (attivo.length === 0) {
        alert("Nessuna materia selezionata!");
        return;
    }

    const nome = attivo.find('.nome-materia').text().trim();
    const media = attivo.find('.media-materia').text().trim();
    const obiettivo = attivo.find('.obiettivo-materia').text().trim();
    const numeroVoti = labels.length;

    $('.voto-obiettivo').html(obiettivo);
    $('.materia-obiettivo').html(nome);

    if(media >= obiettivo){
        $('.result-dettagli-obiettivo').html("Obiettivo raggiunto!");
    } else {
        $('.result-dettagli-obiettivo').html('<span id="voto1"></span>x1 oppure <span id="voto2"></span>x2 oppure <span id="voto3"></span>x3');
        const votiNumerici = arrayVoti.map(v => parseFloat(v));
        const somma = votiNumerici.reduce((acc, v) => acc + v, 0);
        const media = somma / numeroVoti;

        const obiettivo1Voto = arrotondaPerEccessoMezzoVoto((obiettivo * (numeroVoti + 1) - media * numeroVoti) / 1);
        const obiettivo2Voti = arrotondaPerEccessoMezzoVoto((obiettivo * (numeroVoti + 2) - media * numeroVoti) / 2);
        const obiettivo3Voti = arrotondaPerEccessoMezzoVoto((obiettivo * (numeroVoti + 3) - media * numeroVoti) / 3);

        if(obiettivo1Voto > 10){
            $('#voto1').html('>10');
        } else {
            $('#voto1').html(obiettivo1Voto);
        }
        if(obiettivo2Voti > 10){
            $('#voto2').html('>10');
        } else {
            $('#voto2').html(obiettivo2Voti);
        }
        if(obiettivo3Voti > 10){
            $('#voto3').html('>10');
        } else {
            $('#voto3').html(obiettivo3Voti);
        }
    }
});
        
function arrotondaPerEccessoMezzoVoto(x) {
    return Math.ceil(x * 2 - 1e-10) / 2;
}

function formattaData(dataISO) {
    const [anno, mese, giorno] = dataISO.split("-");
    return `${giorno}/${mese}/${anno}`;
}

function formattaDataInverse(dataISO) {
    const [giorno, mese, anno] = dataISO.split("/");
    return `${anno}-${mese}-${giorno}`;
}

function graficoVoti(oggettiVoti) {
    if(oggettiVoti){
        labels = oggettiVoti.map(v => v.data); // array di date
        arrayVoti = oggettiVoti.map(v => v.voto); // array di voti

        const ctx = document.getElementById('lineChart').getContext('2d');

        if (myChart) {
            myChart.destroy();
        }

        myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Voti',
                    data: arrayVoti,
                    fill: false,
                    borderColor: '#185ee0',
                    tension: 0,
                    pointBackgroundColor: '#185ee0',
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        min: 2,
                        max: 10.5,
                        ticks: {
                            stepSize: 0.5
                        }
                    }
                }
            }
        });
    }
}