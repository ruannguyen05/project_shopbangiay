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
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            .gradient-custom { /* fallback for old browsers */
                background: #4facfe; /* Chrome 10-25,
                Safari 5.1-6 */
                background: -webkit-linear-gradient(to bottom right, rgba(79, 172, 254,
                    1), rgba(0, 242, 254, 1)); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+,
                    Safari 7+ */
                background: linear-gradient(to bottom right, rgba(79, 172, 254, 1), rgba(0,
                    242, 254, 1))
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                                <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> <a href="#"><img src="${requestScope.detail.image}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${requestScope.detail.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">US $</span><span class="num">${requestScope.detail.price}</span>
                                            </span> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>
                                                    ${requestScope.detail.description}
                                                </p></dd>
                                        </dl>

                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <dl class="param param-inline">
                                                    <dt>Quantity: </dt>
                                                    <dd>
                                                        <div class="align-middle">
                                                            <form action="detail" method="post">
                                                                <input value="${detail.id}" name="pid" type="hidden">
                                                                <input type="submit" name="add" value="-" class="btnSub" ${quantity==1?"disabled":""}>
                                                                <input value="${quantity}" name="quantity" type="hidden">${quantity}
                                                                <input type="submit" name="add" value="+" class="btnAdd" ${quantity==detail.quantity?"disabled":""}>
                                                            </form>
                                                        </div>
                                                    </dd>
                                                </dl>  <!-- item-property .// -->
                                            </div> <!-- col.// -->

                                        </div> <!-- row.// -->
                                        <hr>
                                        <a href="buy?id=${detail.id}&quantity=${quantity}" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                        <a href="addtocart?id=${detail.id}&quantity=${quantity}" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->

                        <section class="gradient-custom">
                            <div class="container my-5 py-5">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-12 col-lg-10 col-xl-8">
                                        <div class="card">
                                            <div class="card-body p-4">
                                                <h4 class="text-center mb-4 pb-2">Comment</h4>
                                                <form action="comment" method="post">
                                                    <div class="form-outline mb-4">
                                                        <input type="hidden" name="pid" value="${detail.id}"/>
                                                        <input type="text" name="comment" class="form-control" placeholder="Type comment..." />
                                                        <input type="submit" value="Save"/>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="d-flex flex-start">
                                                            <div class="flex-grow-1 flex-shrink-1">
                                                                <c:if test="${not empty listComment}">
                                                                    <c:forEach items="${listComment}" var="o">
                                                                        <div>
                                                                            <div class="d-flex justify-content-between align-items-center">
                                                                                <p class="mb-1">
                                                                                    ${o.account.user}<span class="small"> - ${o.date}</span>
                                                                                </p>
                                                                                <a href="detail?pid=${detail.id}&commentid=${o.id}"></i><span class="small">see reply</span></a>
                                                                            </div>
                                                                            <p class="small mb-0">
                                                                                ${o.comment}
                                                                            </p>
                                                                        </div>
                                                                        <c:if test="${aid==sellID}">
                                                                            <form action="reply" method="post">
                                                                                <div class="small">
                                                                                    <input type="hidden" name="pid" value="${detail.id}"/>
                                                                                    <input type="hidden" name="commentid" value="${o.id}"/>
                                                                                    <input type="text" name="reply" class="form-control" placeholder="Reply comment..." />
                                                                                    <input type="submit" value="Send"/>
                                                                                </div>
                                                                            </form>
                                                                        </c:if>


                                                                        <c:if test="${not empty listReply}">
                                                                            <c:forEach items="${listReply}" var="rep">
                                                                                <c:if test="${rep.commentid == o.id}">
                                                                                    <div class="d-flex flex-start mt-4">
                                                                                        <img class="rounded-circle shadow-1-strong"
                                                                                             src="${detail.image}" alt="avatar"
                                                                                             width="65" height="65" />

                                                                                        <div class="flex-grow-1 flex-shrink-1">
                                                                                            <div>
                                                                                                <div class="d-flex justify-content-between align-items-center">
                                                                                                    <p class="mb-1">
                                                                                                        <span class="small"> ${rep.date}</span>
                                                                                                    </p>
                                                                                                </div>
                                                                                                <p class="small mb-0">
                                                                                                    ${rep.reply}
                                                                                                </p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </c:if>


                                                                    </c:forEach>
                                                                </c:if>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
