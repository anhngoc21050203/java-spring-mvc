<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />

            <div class="main-panel">
                <div class="page-header">
                    <h3 class="page-title">${title_page}</h3>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/admin">Admin</a></li>
                            <li class="breadcrumb-item active" aria-current="page">List Products</li>
                        </ol>
                    </nav>
                </div>

                <!-- Thông báo (nếu có) -->
                <c:if test="${not empty message}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-3">
                                    <h4 class="card-title">Products List</h4>
                                    <a href="/admin/product/create" class="btn btn-primary">
                                        <i class="bi bi-plus-circle"></i> Add New Product
                                    </a>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-striped table-hover align-middle">
                                        <thead class="table-dark">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Name</th>
                                                <th scope="col" class="text-center">Image</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col" class="text-center">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${products}" var="product">
                                                <tr>
                                                    <td>${product.id}</td>
                                                    <td class="text-truncate" style="max-width: 150px;">
                                                        ${product.name}
                                                    </td>
                                                    <td class="text-center">
                                                        <img src="${product.image}" alt="${product.name}"
                                                            class="img-thumbnail" style="width: 100px; height: auto;">
                                                    </td>
                                                    <td>${product.price}</td>
                                                    <td>${product.quantity}</td>
                                                    <td class="text-center">
                                                        <a href="/admin/product/${product.id}/edit"
                                                            class="btn btn-sm btn-outline-warning me-2">
                                                            <i class="mdi mdi-border-color mt-10"></i> Edit
                                                        </a>
                                                        <a href="/admin/product/${product.id}/delete"
                                                            class="btn btn-sm btn-outline-danger"
                                                            onclick="return confirm('Are you sure you want to delete this product?');">
                                                            <i class="mdi mdi-archive"></i> Delete
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <nav aria-label="Page navigation" class="mt-4">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />