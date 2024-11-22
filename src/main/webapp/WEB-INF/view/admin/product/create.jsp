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
                            <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${title_page}</li>
                        </ol>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">${title_page}</h4>
                                <!-- Đảm bảo rằng bạn đã định nghĩa "newUser" trong Controller -->
                                <form:form class="forms-user" action="/admin/product/store" method="post"
                                    enctype="multipart/form-data" modelAttribute="newProduct">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">Name:</label>
                                                <c:set var="nameErrors">
                                                    <form:errors path="name" />
                                                </c:set>
                                                <form:input type="name" path="name"
                                                    class="form-control ${not empty nameErrors ? 'is-invalid' : ''}"
                                                    id="name" placeholder="Name" required="true" />
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label for="price">Price:</label>
                                                <c:set var="priceErrors">
                                                    <form:errors path="price" />
                                                </c:set>
                                                <form:input type="number" path="price"
                                                    class="form-control ${not empty priceErrors ? 'is-invalid' : ''}"
                                                    id="price" placeholder="Price" required="true" />
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label for="shortDescription">Short Description:</label>
                                                <c:set var="shortDescriptionErrors">
                                                    <form:errors path="shortDescription" />
                                                </c:set>
                                                <form:input path="shortDescription"
                                                    class="form-control ${not empty shortDescriptionErrors ? 'is-invalid' : ''}"
                                                    id="Short Description:" placeholder="shortDescription"
                                                    required="true" />
                                                <form:errors path="shortDescription" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="quantity">Quantity:</label>
                                                <c:set var="quantityErrors">
                                                    <form:errors path="quantity" />
                                                </c:set>
                                                <form:input type="number" path="quantity"
                                                    class="form-control ${not empty quantityErrors ? 'is-invalid' : ''}"
                                                    id="quantity" placeholder="Quantity" required="true" />
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="image_url">Profile Image:</label>
                                                <input type="file" class="form-control" id="image_url" name="image_pr"
                                                    accept=".png, .jpg, .jpeg" />
                                                <form:errors path="image" cssClass="invalid-feedback" />
                                                <div id="image_preview" class="mt-3"></div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group"></div>
                                            <label for="description">Description:</label>
                                            <c:set var="descriptionErrors">
                                                <form:errors path="description" />
                                            </c:set>
                                            <form:textarea id="description" path="description" rows="5" cols="40"
                                                cssStyle="font-style:italic"
                                                class="form-control ${not empty descriptionErrors ? 'is-invalid' : ''}" />
                                            <form:errors path="description" cssClass="invalid-feedback" />
                                        </div>

                                        <!-- Role Selection -->
                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label">Factory:</label>
                                            <form:select class="form-select" path="factory">
                                                <form:option value="Báo Hoa Học Trò">Báo Sinh Viên VN -
                                                    Hoa Học Trò</form:option>
                                                <form:option value="ASUS">Asus</form:option>
                                                <form:option value="LENOVO">Lenovo</form:option>
                                                <form:option value="DELL">Dell</form:option>
                                                <form:option value="LG">LG</form:option>
                                                <form:option value="ACER">Acer</form:option>
                                            </form:select>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label">Target:</label>
                                            <form:select class="form-select" path="target">
                                                <form:option value="Bìa Mềm">Bìa Mềm</form:option>
                                                <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng
                                                </form:option>
                                                <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                </form:option>
                                                <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                            </form:select>
                                        </div>
                                    </div>

                                    <button type="submit" id="submit-user"
                                        class="btn btn-gradient-primary">Submit</button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- jQuery Script -->
                <script src="/assets/js/jquery-3.1.1.min.js"></script>

                <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />