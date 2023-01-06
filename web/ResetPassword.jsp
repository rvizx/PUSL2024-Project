<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Page</title>
    </head>
    <body>
        <table>
            <form method="post" action="ResetPw">
                <p>${message}</p>
                <tr>
                    <td>Enter Password</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="con_password"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="submitBtn"></td>
                </tr>
            </form>
    </body>
</html>
