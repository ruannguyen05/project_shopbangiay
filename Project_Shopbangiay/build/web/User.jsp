
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
                            <h2>User <b>Manager</b></h2>
                        </div>
                        <c:if test="${acc.isSell==0}">
                            <div class="col-sm-6">
                                <a href="usermanager?dangky=1"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Đăng ký Seller</span></a>					
                            </div>
                        </c:if>
                    </div>
                </div>

                <form action="" name="f" method="post">
                    Enter quantity to buy:
                    <input type="number" name="num" value="1"/> 
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>TotalMoney</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listO}" var="o">
                                <tr>
                                    <td>
                                        <img src="${o.product.image}">
                                    </td>
                                    <td><a href="detail?pid=${o.product.id}" title="View Product">${o.product.name}</a></td>
                                    <td>${o.quantity}</td>
                                    <td>${o.totalMoney}</td>
                                    <td>${o.date}</td>
                                    <td class="align-middle">
                                        <input type="button" onclick="buy('${o.product.id}')" value="Buy again"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>




                <div class="clearfix">
                    <a href="home"><button type="button" class="btn btn-primary">Back to home</button>
                </div>
                <script type="text/javascript">
                    function buy(id) {
                        var n = document.f.num.value;
                        document.f.action = "buy?id=" + id + "&quantity=" + n;
                        document.f.submit();
                    }
                </script>
                <script src="js/manager.js" type="text/javascript"></script>
                </body>
                </html>