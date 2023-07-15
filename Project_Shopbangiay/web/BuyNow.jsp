
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container px-3 my-5 clearfix">
                <!-- Shopping cart table -->
                <div class="table-responsive">
                    <h2>${mes}</h2>
                <div class="py-2 text-uppercase"></div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" class="border-0 bg-light">
                                <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase">Đơn Giá</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">

                                <div class="py-2 text-uppercase">Số Lượng</div>

                            </th>
                            <th scope="col" class="border-0 bg-light">

                                <div class="py-2 text-uppercase">Thành Tiền</div>
                            </th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">
                                <div class="p-2">
                                    <img src="${buyP.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                    <div class="ml-3 d-inline-block align-middle">
                                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${buyP.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                    </div>
                                </div>
                            </th>
                            <td class="align-middle"><strong>${buyP.price}</strong></td>
                            <td class="align-middle"><strong>${quantity}</strong></td>
                            <td class="align-middle"><strong>${buyP.price*quantity}</strong></td>   
                        </tr> 
                    </tbody>
                </table>
            </div>
            <!-- / Shopping cart table -->
            <div class="row py-5 p-4 bg-white rounded shadow-sm">
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                    <div class="p-4">
                        <div class="input-group mb-4 border rounded-pill p-2">
                            <input type="text" placeholder="Nhập Voucher" aria-describedby="button-addon3" class="form-control border-0">
                            <div class="input-group-append border-0">
                                <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Sử dụng</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thanh Toán</div>
                    <div class="p-4">
                        <ul class="list-unstyled mb-4">

                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong>${buyP.price*quantity}</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>${buyP.price*quantity*0.05}</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                <h5 class="font-weight-bold">${buyP.price*quantity + buyP.price*quantity*0.05}</h5>
                            </li>
                        </ul>
                        <div class="float-right">
                            <form action="buy" method="post">
                                <a href="home" class="btn btn-lg btn-success md-btn-flat mt-2 mr-3">Trở về trang chủ</a>
                                <input type="hidden" name="quantity" value="${quantity}"/>
                                <input type="hidden" name="id" value="${buyP.id}"/> 
                                <input type="submit" value="Checkout" class="btn btn-lg btn-primary mt-2"/>
                            </form>
                                
                        </div>
                    </div>
                </div>


            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
