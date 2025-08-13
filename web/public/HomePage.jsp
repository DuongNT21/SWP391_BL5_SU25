<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Product" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Laptop Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="icon" href="${pageContext.request.contextPath}/asset/Image/Favicon/icon2.gif" type="image/gif">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/CSS/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/CSS/footer.css"/>
        <style>
            .toggle-sidebar-btn {
                display: none;
            }

            .hero {
                width: 100%;
                height: 100vh;
                overflow: hidden;
            }

            .swiper {
                width: 100%;
                height: 100%;
            }

            .swiper-slide img{
                background-size: cover;
                background-position: center;
                width: 100%;
                height: 100%; /* Ensures the image takes the full height */
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 24px;
                color: #fff;
            }

            .swiper-button-prev, .swiper-button-next {
                color: #e74c3c;
                font-size: 20px;
            }

            .swiper-pagination-bullet-active {
                background-color: #e74c3c !important;
            }

            .product-list {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 20px;
                margin-top: 30px;
            }

            .product {
                background-color: #fff;
                padding: 15px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s;
                text-align: center;
            }

            .product:hover {
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            }

            .product img {
                width: 100%;
                height: auto;
            }

            .product h3 {
                font-size: 18px;
                margin: 15px 0;
            }

            .product p {
                font-size: 14px;
                color: white;
            }

            .product .price {
                font-size: 16px;
                color: #e74c3c;
            }

            body {
                font-family: 'Open Sans', sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h1, h2, h3, h4, h5, h6 {
                margin: 0;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 15px;
            }

            a {
                text-decoration: none;
                color: inherit;
            }

            a:hover {
                color: #e74c3c;
            }

            button {
                background-color: #e74c3c;
                color: #fff;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #c0392b;
            }

            @media (max-width: 768px) {
                .product-list {
                    grid-template-columns: repeat(2, 1fr);
                }

                .hero {
                    height: 300px;
                }

                .navbar {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }

            @media (max-width: 480px) {
                .product-list {
                    grid-template-columns: 1fr;
                }

                .hero {
                    height: 200px;
                }
            }

            .slider-container {
                width: 100%;
                overflow: hidden;
                display: flex;
                margin-top: 10px;
                margin-bottom: 10px;
                box-shadow: inset 0 0 10px black;
                padding-left: 10px;
                padding-right: 10px;
            }

            .text-slider {
                display: flex;
                white-space: nowrap;
                animation: slide 20s linear infinite;
            }

            .text-slider span {
                font-size: 2.5rem;
                font-weight: bold;
                color: #fff;
                padding: 0 50px;
                letter-spacing: 5px;
            }

            @keyframes slide {
                0% {
                    transform: translateX(0);
                }
                100% {
                    transform: translateX(-100%);
                }
            }

            .product-content {
                transition: transform 0.3s ease-in-out, background-color 0.3s ease-in-out;
            }

            .product-content .card {
                transition: transform 0.3s ease-in-out, background-color 0.3s ease-in-out;
            }

            .product-content:hover .card {
                transform: scale(1.05);
                z-index: 1;
            }

            .product-content .card .card-text {
                transition: color 0.3s ease-in-out;
                color: black;
                white-space: nowrap;       /* Prevents text from wrapping to a new line */
                overflow: hidden;          /* Hides overflow text */
                text-overflow: ellipsis;   /* Displays "..." for truncated text */
            }

            .product-content:hover .card .card-text {
                color: green;
            }

            .feedback-section {
                display: flex;
                align-items: center;
                justify-content: space-between;
                align-content: center;
                margin-top: 20px;
            }

            .sold p {
                margin: 0;
                padding: 0;
                color: #999999;
            }

            .pro {
                margin-top: 20px;
            }
        </style>
    </head>
    <body style="background-image: url('${pageContext.request.contextPath}/asset/Image/1119015.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
        <jsp:include page="../base-component/header.jsp" />

        <!-- Slider Section -->
        <div class="hero">
            <div class="swiper">
                <div class="swiper-wrapper">
                    <!-- Temporarily hidden model data -->
                    <!-- <c:forEach items="${requestScope.listS}" var="s">
                        <div class="swiper-slide">
                            <a href="${s.backLink}" style="display: block; width: 100%; height: 100%;"><img src="${s.link}"></a>
                        </div>
                    </c:forEach> -->
                    
                    <!-- Placeholder slides -->
                    <div class="swiper-slide">
                        <div style="background-color: #ccc; width: 100%; height: 100%; display: flex; align-items: center; justify-content: center; color: #666; font-size: 24px;">
                            Slider Image 1
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div style="background-color: #ddd; width: 100%; height: 100%; display: flex; align-items: center; justify-content: center; color: #666; font-size: 24px;">
                            Slider Image 2
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>

        <!-- Main Content Section -->
        <div class="container">
            <div class="slider-container">
                <div class="text-slider">
                    <a href="newcollection?type=new&content=New%20Arrivals">
                        <span>NEW ARRIVALS</span>
                        <span>NEW ARRIVALS</span>
                        <span>NEW ARRIVALS</span>
                    </a>
                </div>
                <div class="text-slider">
                    <a href="newcollection?type=new&content=New%20Arrivals">
                        <span>NEW ARRIVALS</span>
                        <span>NEW ARRIVALS</span>
                        <span>NEW ARRIVALS</span>
                    </a>
                </div>
            </div>

            <div class="pro row justify-content-center">
                <!-- Temporarily hidden model data -->
                <!-- <c:if test="${not empty latest}">
                    <c:forEach items="${latest}" var="l">
                        <div class="col-12 col-md-4 col-lg-3 mb-3 product-content">
                            <a href="productdetail?productId=${l.productId}">
                                <div class="card h-100" style="padding: 10px; box-shadow: 0 0 20px #999999;">
                                    <img class="card-img-top" src="${l.productThumb}" alt="Product Image" style="height: 150px; object-fit: cover;">
                                    <div class="card-body d-flex flex-column">
                                        <h3 class="text-center card-text mb-2" style="font-size: 1.1rem;">${l.productName}</h3>
                                        <p class="card-text text-muted text-center" style="font-size: 1.3rem;"><fmt:formatNumber value="${l.productPrice}" pattern="###,###,###VND" /></p>
                                        <div class="tag-section text-center">
                                            <div class="main-badge">
                                                <c:forEach items="${l.tagList}" var="tag">
                                                    <span class="badge" style="background-color: #e74c3c;">${tag.name}</span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="feedback-section">
                                            <div class="mt-auto">
                                                <i class="fa-solid fa-star" style="color: #FFD43B;"> ${l.star} ( ${l.countFeedBack} )</i>
                                            </div>
                                            <div class="sold">
                                                <p>Sold: ${l.soldItem}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </c:if> -->

                <!-- Placeholder products -->
                <div class="col-12 col-md-4 col-lg-3 mb-3 product-content">
                    <div class="card h-100" style="padding: 10px; box-shadow: 0 0 20px #999999;">
                        <div class="card-img-top" style="height: 150px; background-color: #ccc; display: flex; align-items: center; justify-content: center; color: #666;">
                            Product Image
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h3 class="text-center card-text mb-2" style="font-size: 1.1rem;">Sample Product 1</h3>
                            <p class="card-text text-muted text-center" style="font-size: 1.3rem;">1,500,000 VND</p>
                            <div class="tag-section text-center">
                                <div class="main-badge">
                                    <span class="badge" style="background-color: #e74c3c;">New</span>
                                </div>
                            </div>
                            <div class="feedback-section">
                                <div class="mt-auto">
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"> 4.5 ( 25 )</i>
                                </div>
                                <div class="sold">
                                    <p>Sold: 150</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-4 col-lg-3 mb-3 product-content">
                    <div class="card h-100" style="padding: 10px; box-shadow: 0 0 20px #999999;">
                        <div class="card-img-top" style="height: 150px; background-color: #ddd; display: flex; align-items: center; justify-content: center; color: #666;">
                            Product Image
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h3 class="text-center card-text mb-2" style="font-size: 1.1rem;">Sample Product 2</h3>
                            <p class="card-text text-muted text-center" style="font-size: 1.3rem;">2,300,000 VND</p>
                            <div class="tag-section text-center">
                                <div class="main-badge">
                                    <span class="badge" style="background-color: #e74c3c;">Hot</span>
                                </div>
                            </div>
                            <div class="feedback-section">
                                <div class="mt-auto">
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"> 4.8 ( 42 )</i>
                                </div>
                                <div class="sold">
                                    <p>Sold: 89</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="slider-container">
                <div class="text-slider">
                    <a href="newcollection?type=feature&content=Feature%20Products">
                        <span>FEATURE PRODUCTS</span>
                        <span>FEATURE PRODUCTS</span>
                        <span>FEATURE PRODUCTS</span>
                    </a>
                </div>
                <div class="text-slider">
                    <a href="newcollection?type=feature&content=Feature%20Products">
                        <span>FEATURE PRODUCTS</span>
                        <span>FEATURE PRODUCTS</span>
                        <span>FEATURE PRODUCTS</span>
                    </a>
                </div>
            </div>
            <div class="pro row justify-content-center">
                <!-- Temporarily hidden model data -->
                <!-- <c:if test="${not empty listP}">
                    <c:forEach items="${listP}" var="o">
                        <div class="col-12 col-md-4 col-lg-3 mb-3 product-content">
                            <a href="productdetail?productId=${o.productId}">
                                <div class="card h-100" style="padding: 10px; box-shadow: 0 0 20px #999999;">
                                    <img class="card-img-top" src="${o.productThumb}" alt="Product Image" style="height: 150px; object-fit: cover;">
                                    <div class="card-body d-flex flex-column">
                                        <h3 class="card-text text-center mb-2" style="font-size: 1.1rem;">${o.productName}</h3>
                                        <p class="card-text text-muted text-center" style="font-size: 1.3rem;"><fmt:formatNumber value="${o.productPrice}" pattern="###,###,###VND" /></p>
                                        <div class="tag-section text-center">
                                            <div class="main-badge">
                                                <c:forEach items="${o.tagList}" var="tag">
                                                    <span class="badge" style="background-color: #c0392b;">${tag.name}</span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="feedback-section">
                                            <div class="mt-auto">
                                                <i class="fa-solid fa-star" style="color: #FFD43B;"> ${o.star} ( ${o.countFeedBack} )</i>
                                            </div>
                                            <div class="sold">
                                                <p>Sold: ${o.soldItem}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </c:if> -->

                <!-- Placeholder feature products -->
                <div class="col-12 col-md-4 col-lg-3 mb-3 product-content">
                    <div class="card h-100" style="padding: 10px; box-shadow: 0 0 20px #999999;">
                        <div class="card-img-top" style="height: 150px; background-color: #eee; display: flex; align-items: center; justify-content: center; color: #666;">
                            Product Image
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h3 class="card-text text-center mb-2" style="font-size: 1.1rem;">Feature Product 1</h3>
                            <p class="card-text text-muted text-center" style="font-size: 1.3rem;">3,200,000 VND</p>
                            <div class="tag-section text-center">
                                <div class="main-badge">
                                    <span class="badge" style="background-color: #c0392b;">Featured</span>
                                </div>
                            </div>
                            <div class="feedback-section">
                                <div class="mt-auto">
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"> 4.9 ( 67 )</i>
                                </div>
                                <div class="sold">
                                    <p>Sold: 234</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-4 col-lg-3 mb-3 product-content">
                    <div class="card h-100" style="padding: 10px; box-shadow: 0 0 20px #999999;">
                        <div class="card-img-top" style="height: 150px; background-color: #f0f0f0; display: flex; align-items: center; justify-content: center; color: #666;">
                            Product Image
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h3 class="card-text text-center mb-2" style="font-size: 1.1rem;">Feature Product 2</h3>
                            <p class="card-text text-muted text-center" style="font-size: 1.3rem;">4,500,000 VND</p>
                            <div class="tag-section text-center">
                                <div class="main-badge">
                                    <span class="badge" style="background-color: #c0392b;">Premium</span>
                                </div>
                            </div>
                            <div class="feedback-section">
                                <div class="mt-auto">
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"> 4.7 ( 38 )</i>
                                </div>
                                <div class="sold">
                                    <p>Sold: 76</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-4 col-lg-3 mb-3 product-content">
                    <div class="card h-100" style="padding: 10px; box-shadow: 0 0 20px #999999;">
                        <div class="card-img-top" style="height: 150px; background-color: #e0e0e0; display: flex; align-items: center; justify-content: center; color: #666;">
                            Product Image
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h3 class="card-text text-center mb-2" style="font-size: 1.1rem;">Feature Product 3</h3>
                            <p class="card-text text-muted text-center" style="font-size: 1.3rem;">1,800,000 VND</p>
                            <div class="tag-section text-center">
                                <div class="main-badge">
                                    <span class="badge" style="background-color: #c0392b;">Popular</span>
                                </div>
                            </div>
                            <div class="feedback-section">
                                <div class="mt-auto">
                                    <i class="fa-solid fa-star" style="color: #FFD43B;"> 4.6 ( 53 )</i>
                                </div>
                                <div class="sold">
                                    <p>Sold: 187</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Footer import section -->
        <jsp:include page="../base-component/footer.jsp" />

        <!-- Include the new JavaScript file -->
        <script src="${pageContext.request.contextPath}/asset/JS/HomePage.js"></script>
    </body>
</html>
