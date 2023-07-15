
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="checkdangkyseller"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span> Xem Đăng Ký Seller</span></a>					
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>UserName</th>
                            <th>IsSeller</th>
                            <th>View Order</th>
                            <th>View Cart</th>
                            <th>Manager Product</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listA}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.user}</td>
                                <td>
                                    <form action="manageraccount" method="post">
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="isSeller" ${o.isSell==1?"checked":""}>
                                            <label for="checkbox1"></label>
                                            <input type="hidden" name="id" value="${o.id}"/>
                                            <input type="submit" value="save">
                                        </span>
                                    </form>
                                </td>
                                <td>                              
                                    <a href="usermanager?id=${o.id}" class="btn" ><span>view order</span></a>
                                </td>
                                <td>                              
                                    <a href="show?user=${o.user}" class="btn" ><span>view cart</span></a>
                                </td>
                                <td> 
                                    <c:if test="${o.isSell==1}">
                                        <a href="managerProduct?id=${o.id}" class="btn" > manager product</a>
                                    </c:if>
                                </td>

                                <td>                              
                                    <a href="manageraccount?id=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="clearfix">
                    <a href="home"><button type="button" class="btn btn-primary">Back to home</button>
                </div>

                <script src="js/manager.js" type="text/javascript"></script>
                </body>
                </html>