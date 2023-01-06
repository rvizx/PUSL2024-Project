<!DOCTYPE html>

<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <p>${message}</p>
        
       <form method="post" action="config">
            <table>
                <tr>
                    <td><p>${message1}</p>
                    <a href="register.jsp">Register Now</a></td>
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="l_email"></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="l_password"></td>
                </tr>
                
                <tr>
                    <td><a href="ForgotPw.jsp">Forgot Password</a></td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="Submit"></td>
                    <td><input type="reset" name="Clear" value="Clear"></td>
                </tr>
                
            </table>
        </form>
    </body>
</html>

