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
                    <p>${message1}</p>
                    <td>Username</td>
                    <td><input type="text" name="username"></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"></td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="Submit"></td>
                    <td><input type="reset" name="Clear" value="Clear"></td>
                </tr>
                
            </table>
        </form>
    </body>
</html>

