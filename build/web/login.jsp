<%-- 
    Document   : login
    Created on : May 11, 2026, 6:22:21 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <title>Admin Login</title>

        <style>

            body{

                font-family: Arial;

                background:#f4f4f4;

                display:flex;

                justify-content:center;

                align-items:center;

                height:100vh;
            }

            .login-box{

                background:white;

                padding:30px;

                width:350px;

                border-radius:12px;

                box-shadow:0 0 10px rgba(0,0,0,0.2);
            }

            h2{

                text-align:center;

                margin-bottom:20px;
            }

            input{

                width:100%;

                padding:12px;

                margin-top:10px;

                border:1px solid #ccc;

                border-radius:6px;
            }

            button{

                width:100%;

                padding:12px;

                margin-top:20px;

                background:#2c7be5;

                color:white;

                border:none;

                border-radius:6px;

                cursor:pointer;
            }

            button:hover{

                background:#145cc0;
            }

            .error{

                color:red;

                text-align:center;

                margin-top:10px;
            }

        </style>

    </head>

    <body>

        <div class="login-box">

            <h2>
                Urban Cleanliness Admin
            </h2>

            <form action="login"
                  method="post">

                <input type="text"
                       name="username"
                       placeholder="Username"
                       required>

                <input type="password"
                       name="password"
                       placeholder="Password"
                       required>

                <button type="submit">

                    Login

                </button>

            </form>

            <%

                String error
                        = request.getParameter(
                                "error");

                if (error != null) {

            %>

            <div class="error">

                Invalid Username or Password

            </div>

            <%    }
            %>

        </div>

    </body>

</html>
