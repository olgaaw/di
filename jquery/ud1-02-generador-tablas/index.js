$(document).ready(function() {

    $(document).on("click", "#btn-add-row", function() {
        $("#tabla").append("<tr><td>Fila<button class='btn-delete-row'>Eliminar</button></td></tr>")

    });

    $(document).on("click", "#btn-add-col", function() {
        $("#tabla tr").append("<td>Columna</td>");

    });

    $(document).on("click", ".btn-delete-row", function() {
        $(this).closest("tr").remove();

    });

    $(document).on("click", "#btn-delete-col", function () {
        $("#tabla tr").each(function() {
            $(this).children().last().remove();
        });
    });



});