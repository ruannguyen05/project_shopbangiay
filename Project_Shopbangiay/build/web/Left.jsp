

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${listC}" var="o">
                <li class="list-group-item text-white ${tag == o.cid ? "active":""}"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Best Seller</div>
        <div class="card-body">
            <c:set var="o" value="${bestP}"/>
            <img class="card-img-top" src="${o.image}" alt="Card image cap">
            <div class="card-body">
                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                <p class="card-text show_txt">${o.title}</p>
                <div class="row">
                    <div class="col">
                        <p class="btn btn-danger btn-block">${o.price} $</p>
                    </div>
                    <div class="col">
                        <a href="addtocart?quantity=1&id=${o.id}" class="btn btn-success btn-block">Add to cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>