<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
            <div class="container-fluid">
                <!-- Logo -->
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo" href="index.html"><img src="assets/images/logo.svg"
                            alt="logo" /></a>
                    <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo-mini.svg"
                            alt="logo" /></a>
                </div>

                <!-- Toggle Button for Mobile -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Main Menu -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a href="index.html" class="nav-link active text-primary fw-bold">Home</a>
                        </li>
                        <li class="nav-item">
                            <a href="shop.html" class="nav-link">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a href="shop-detail.html" class="nav-link">Shop Detail</a>
                        </li>
                        <!-- Dropdown Menu -->
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" id="pagesDropdown" data-bs-toggle="dropdown"
                                aria-expanded="false">Pages</a>
                            <ul class="dropdown-menu" aria-labelledby="pagesDropdown">
                                <li><a href="cart.html" class="dropdown-item">Cart</a></li>
                                <li><a href="checkout.html" class="dropdown-item">Checkout</a></li>
                                <li><a href="testimonial.html" class="dropdown-item">Testimonial</a></li>
                                <li><a href="404.html" class="dropdown-item">404 Page</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="contact.html" class="nav-link">Contact</a>
                        </li>
                    </ul>

                    <!-- Right Side Icons -->
                    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-end">
                        <!-- Search Icon -->
                        <button class="btn btn-outline-primary me-3 rounded-circle p-2" data-bs-toggle="modal"
                            data-bs-target="#searchModal">
                            <i class="fas fa-search text-primary"></i>
                        </button>

                        <!-- Shopping Cart Icon -->
                        <a href="#" class="position-relative me-3 text-success">
                            <i class="fas fa-shopping-bag fa-2x fa-lg"></i>
                            <span
                                class="position-absolute top-0 start-100 translate-middle badge rounded-circle bg-danger text-white">
                                3
                            </span>
                        </a>

                        <!-- User Icon -->
                        <a href="#" class="text-warning">
                            <i class="fas fa-2x fa-user fa-lg"></i>
                        </a>
                    </div>

                </div>
            </div>
        </nav>