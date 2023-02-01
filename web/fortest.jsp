<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <title>ABC Cinema</title>


        <link rel="stylesheet" href="css/style.css">
        <link href="table.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/film.png" />
        <style>
            table.table th:nth-child(4) {
                width: 140px;
            }
            table.table th:nth-child(1) {
                width: 65px;
            }
            table.table th:nth-child(8) {
                width: 80px;
            }
            table.table th:nth-child(7) {
                width: 120px;


            }

            .table-wrapper {
                width: 1600px;
                margin: 1px auto;
                background: #fff;
                padding: 1px;	
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            table.table th:nth-child(6) {
                width: 170px;
            }
        </style>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                var actions = $("table td:last-child").jsp();
                $(".add-new").click(function () {
                    $(this).attr("disabled", "disabled");
                    var index = $("table tbody tr:last-child").index();
                    var row = '<tr>' +
                            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
                            '<td><input type="text" class="form-control" name="department" id="department"></td>' +
                            '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
                            '<td>' + actions + '</td>' +
                            '</tr>';
                    $("table").append(row);
                    $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                    $('[data-toggle="tooltip"]').tooltip();
                });
                $(document).on("click", ".add", function () {
                    var empty = false;
                    var input = $(this).parents("tr").find('input[type="text"]');
                    input.each(function () {
                        if (!$(this).val()) {
                            $(this).addClass("error");
                            empty = true;
                        } else {
                            $(this).removeClass("error");
                        }
                    });
                    $(this).parents("tr").find(".error").first().focus();
                    if (!empty) {
                        input.each(function () {
                            $(this).parent("td").jsp($(this).val());
                        });
                        $(this).parents("tr").find(".add, .edit").toggle();
                        $(".add-new").removeAttr("disabled");
                    }
                });
                $(document).on("click", ".edit", function () {
                    $(this).parents("tr").find("td:not(:last-child ,:nth-child(4))").each(function () {
                        $(this).jsp('<input type="text" class="form-control" value="' + $(this).text() + '">');
                    });
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").attr("disabled", "disabled");
                });
                // Delete row on delete button click
                $(document).on("click", ".delete", function () {
                    $(this).parents("tr").remove();
                    $(".add-new").removeAttr("disabled");
                });
            });


        </script>
    </head>
    <body>

<form method="post" action="/updatemoviestatus">
        <%
            String id = request.getParameter("userId");
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "abc_cinema";
            String userId = "pmauser";
            String password = "123NxUok4IL4pW9GvkJF8gO1C6MyRFed";

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>

        
            <select>
                <option value="0">Select a Movie </option>
                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                        statement = connection.createStatement();
                        String sql = "SELECT * FROM movie";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>

                <option><%=resultSet.getString("m_name")%></option>

                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            <select>

                    </body>

                    </html>