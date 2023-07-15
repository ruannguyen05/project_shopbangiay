<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .jumbotron.text-center {
                height: 17em;
            }

            input.form-control.col-md-6 {
                width: 50%;
                margin-right: 1em;
                display: inline;
            }

            div#notes {
                margin-top: 2%;
                width: 98%;
                margin-left: 1%;
            }

            @media (min-width: 991px) {
                .col-md-9.col-sm-12 {
                    margin-left: 12%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- Instructions -->
            <div class="row">
                <div class="alert alert-success col-md-12" role="alert" id="notes">
                    <h4>NOTES</h4>
                    <ul>
                        <li>You will recieve a verification code on your mail after you registered. Enter that code below.</li>
                        <li>If somehow, you did not recieve the verification email then <a href="#">resend the verification email</a></li>
                    </ul>
                </div>
            </div>
            <!-- Verification Entry Jumbotron -->
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron text-center">
                        <h2>Enter the verification code</h2>
                        <form method="post" action="confirm" role="form">
                            <div class="col-md-9 col-sm-12">
                                <div class="form-group form-group-lg">
                                    <input type="text" class="form-control col-md-6 col-sm-6 col-sm-offset-2" name="verifyCode" required>
                                    <input class="btn btn-primary btn-lg col-md-2 col-sm-2" type="submit" value="Verify">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
