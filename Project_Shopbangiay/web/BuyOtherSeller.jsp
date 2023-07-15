
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
                            <h2>Product of ${acc.user}</h2>
                        </div>
                        <div class="col-sm-6">

                            <a href="managerProduct"  class="btn btn-success" ><span>Back</span></a>  						
                        </div>
                    </div>
                </div>
                <form action="" name="f" method="post">
                    Enter quantity to buy:
                    <input type="number" name="num" value="1"/> 
                    <input type="hidden" name="sid" value="${sellid}"/> 
                    <table class="table table-striped table-hover">
                        <thead>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Buy</th>
                        </tr>
                        </thead>
                        <tbody>


                            <c:forEach items="${listP}" var="o">

                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.image}">
                                    </td>
                                    <td>${o.price} $</td>
                                    <td>${o.quantity}</td>
                                    <td class="align-middle">
                                        <input type="button" onclick="buy('${o.id}')" value="Buy"/>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </form>
                <script type="text/javascript">
                    function buy(id){
                        var n= document.f.num.value;
                        var sid= document.f.sid.value;
                        document.f.action="buyotherseller?pid="+id+"&num="+n+"&id="+sid;
                        document.f.submit();
                    }
                </script>
                <script src="js/manager.js" type="text/javascript"></script>
                </body>
                </html>