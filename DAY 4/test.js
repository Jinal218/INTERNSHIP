var emptyRow = "<tr><td colspan='5' class='text-center'> No Records Available</td></tr>";

        $(document).ready(function () {
            $("#tblData tbody").append(emptyRow); // adding empty row on page load

            $("#btnAdd").click(function () {
                var name = $("#txtName").val().trim();
                var title = $("#txtTitle").val().trim();

                if (name != "" && title != "" ) { // validation
                    if ($("#tblData tbody").children().children().length == 1) {
                        $("#tblData tbody").html("");
                    }
                    var srNo = $("#tblData tbody").children().length + 1;
                    // creating dynamic html string
                    var dynamicTr = "<tr><td>" + srNo + "</td><td>" + name + "</td><td>" + title + "</td><td> <button class='btn btn-danger btn-sm' > Delete </button> </td></tr>";

                    $("#tblData tbody").append(dynamicTr); // appending dynamic string to table tbody
                    $("#txtName").val("");
                    $("#txtTitle").val("");
                    $(".btn-sm").click(function () { // registering function for delete button
                      
                        $(this).parent().parent().remove();
                        if ($("#tblData tbody").children().children().length == 0) {
                            $("#tblData tbody").append(emptyRow);
                        }
                    });
                } else {
                    alert("Please provide values");
                }
            });

            $("#btnEdit").click(function (){
                
            })

        });