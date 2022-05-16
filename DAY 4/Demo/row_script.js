$(document).ready(function () {
    var Row = 0;

    //button to add a row
    $('#addBtn').on('click', function () {

        // Adding a row inside the tbody.
        $('#tbody').append(`<tr id="R${++Row}">
           <td class="row-index text-center">
           <p>Row ${Row}</p>
           </td>
            <td class="text-center">
              <button class="btn btn-danger remove" type="button" id="remBtn">Remove</button>
              </td>
            </tr>`);
    });

    //button to remove a row.
    $('#tbody').on('click', '.remove', function () {

        var child = $(this).closest('tr').nextAll();

        child.each(function () {

            // Getting <tr> id.
            var id = $(this).attr('id');
            var idx = $(this).children('.row-index').children('p');

            // Gets the row number from <tr> id.
            var dig = parseInt(id.substring(1));

            // Modifying row index.
            idx.html(`Row ${dig - 1}`);

            // Modifying row id.
            $(this).attr('id', `R${dig - 1}`);
            $('id').on('click', function () {
                $('idx').css('color', 'blue');
            })
        });

        // Removing the current row.
        $(this).closest('tr').remove();

        // Decreasing total number of rows by 1.
        alert("Do you want to delete selected row?");
        Row--;

    });
});