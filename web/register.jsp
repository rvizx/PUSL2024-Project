<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form method="post" action="register">
            <table>
                <p>${message}</p>
                
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="r_fname"></td>
                </tr>
                
                 <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="r_lname"></td>
                </tr>
                
                <tr>
                    <td>Mobile</td>
                    <td><input type="text" name="r_mobile"></td>
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="r_email"></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="r_password"></td>
                </tr>
                
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="r_conpassword"></td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="Submit"></td>
                    <td><input type="reset" name="Clear" value="Clear"></td>
                </tr>
                
            </table>
        </form>
    </body>
</html>
