var rowIdx = 0;

$("form").submit(function (e) {
    e.preventDefault();
    var name = $("input[name='name']").val();
    var title = $("input[name='title']").val();

    $(".data-table tbody").append(`<tr data-no="R${++rowIdx}" data-name="${name}" data-title="${title}">
		<td class="row-index"><p>${rowIdx}</p></td>
		<td>${name}</td>
		<td>${title}</td>
		<td>
			<button class='btn-edit  btn btn-primary' id='edBtn'>Edit</button>
			<button class='btn-delete btn btn-danger' id='delBtn'>Delete</button>
		</td>
	</tr>`);

    $("input[name='name']").val(''); 
    $("input[name='title']").val('');
});

$("body").on("click", ".btn-delete", function () {
    if (confirm("Are you sure you want to delete") == true) {
        var child = $(this).closest('tr').nextAll();
        child.each(function () {
            var id = $(this).attr('data-no');
            var idx = $(this).children('.row-index').children('p');
            var dig = parseInt(id.substring(1));
            idx.html(`${dig - 1}`);
            $(this).attr('data-no', `R${dig - 1}`);
        });
        alert("Deleted");
        $(this).closest('tr').remove();
        rowIdx--;
    }else{
        alert("Cancelled");
    }

});

$("body").on("click", ".btn-edit", function () 
{
    var name = $(this).parents("tr").attr('data-name');
    var title = $(this).parents("tr").attr('data-title');

    $(this).parents("tr").find("td:eq(1)").html('<input name="edit_name" value="' + name + '">');
    $(this).parents("tr").find("td:eq(2)").html('<input name="edit_email" value="' + title + '">');
    $(this).parents("tr").find("td:eq(3)").prepend(`<button class='btn-update btn btn-info' id='updBtn'>Update</button>
	<button class='btn-cancel btn btn-warning' id='canBtn'>Cancel</button>`)
    $(this).hide();
});

$("body").on("click", ".btn-cancel", function () {
    var name = $(this).parents("tr").attr('data-name');
    var title = $(this).parents("tr").attr('data-title');

    $(this).parents("tr").find("td:eq(1)").text(name);
    $(this).parents("tr").find("td:eq(2)").text(title);

    $(this).parents("tr").find(".btn-edit").show();
    $(this).parents("tr").find(".btn-update").remove();
    $(this).parents("tr").find(".btn-cancel").remove();
});

$("body").on("click", ".btn-update", function () {
    var name = $(this).parents("tr").find("input[name='edit_name']").val();
    var title = $(this).parents("tr").find("input[name='edit_title']").val();

    $(this).parents("tr").find("td:eq(1)").text(name);
    $(this).parents("tr").find("td:eq(2)").text(title);

    $(this).parents("tr").attr('data-name', name);
    $(this).parents("tr").attr('data-title', title);

    $(this).parents("tr").find(".btn-edit").show();
    $(this).parents("tr").find(".btn-cancel").remove();
    $(this).parents("tr").find(".btn-update").remove();
});