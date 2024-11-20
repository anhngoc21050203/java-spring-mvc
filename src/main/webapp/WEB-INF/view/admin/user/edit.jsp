<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />

            <div class="main-panel">
                <div class="page-header">
                    <h3 class="page-title">Update User</h3>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/admin">Admin</a></li>
                            <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Update User</li>
                        </ol>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-lg-10 mx-auto grid-margin stretch-card">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h4 class="card-title">Update User Information</h4>

                                <!-- Form cập nhật thông tin người dùng -->
                                <form:form class="forms-user needs-validation" action="/admin/user/update" method="post"
                                    enctype="multipart/form-data" modelAttribute="user">
                                    <form:input type="hidden" class="form-control" path="id" />

                                    <div class="row g-3">
                                        <!-- Email -->
                                        <div class="col-md-6">
                                            <label for="email" class="form-label">Email:</label>
                                            <form:input type="email" path="email" class="form-control" id="email" />
                                        </div>

                                        <!-- Phone -->
                                        <div class="col-md-6">
                                            <label for="phone" class="form-label">Phone:</label>
                                            <form:input path="phone" class="form-control" id="phone" />
                                        </div>

                                        <!-- Full Name -->
                                        <div class="col-md-6">
                                            <label for="fullname" class="form-label">Full Name:</label>
                                            <form:input path="fullName" class="form-control" id="fullname" />
                                        </div>

                                        <!-- Address -->
                                        <div class="col-md-6">
                                            <label for="address" class="form-label">Address:</label>
                                            <form:input path="address" class="form-control" id="address" />
                                        </div>

                                        <!-- Image Upload -->
                                        <!-- Image Upload with Preview -->
                                        <div class="col-md-6">
                                            <label for="image_url" class="form-label">Profile Image:</label>
                                            <input type="file" class="form-control" id="image_url" name="image"
                                                accept=".png, .jpg, .jpeg" />

                                            <!-- Hiển thị ảnh cũ nếu có -->
                                            <c:if test="${not empty user.avatar}">
                                                <div id="image_preview" class="mt-3">
                                                    <img src="${user.avatar}" class="img-thumbnail"
                                                        style="max-width: 150px; max-height: 150px;" alt="User Avatar">
                                                </div>
                                            </c:if>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="role_id" class="form-label">Role:</label>
                                            <form:select path="role.name" class="form-select" id="role_id">
                                                <form:option value="">Select Role</form:option>
                                                <form:option value="ADMIN">ADMIN</form:option>
                                                <form:option value="USER">USER</form:option>
                                            </form:select>
                                        </div>

                                    </div>

                                    <!-- Submit Button -->
                                    <div class="mt-4">
                                        <button type="submit" id="submit-user" class="btn btn-primary">
                                            <i class="bi bi-save"></i> Save Changes
                                        </button>
                                        <a href="/admin/user" class="btn btn-secondary ms-2">Cancel</a>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- jQuery Script -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/assets/js/jquery-3.1.1.min.js"></script>
                <script>
                    $(document).ready(function () {
                        // Xem trước hình ảnh khi upload
                        $('#image_url').change(function (event) {
                            let files = event.target.files;
                            let previewContainer = $('#image_preview');
                            previewContainer.empty();

                            if (files.length > 0 && files[0].type.startsWith('image/')) {
                                let reader = new FileReader();
                                reader.onload = function (e) {
                                    let img = $('<img>', {
                                        src: e.target.result,
                                        class: 'img-thumbnail',
                                        style: 'max-width: 150px; max-height: 150px;'
                                    });
                                    previewContainer.append(img);
                                };
                                reader.readAsDataURL(files[0]);
                            }
                        });

                        // Bootstrap form validation
                        (function () {
                            'use strict';
                            const forms = document.querySelectorAll('.needs-validation');
                            Array.from(forms).forEach(form => {
                                form.addEventListener('submit', event => {
                                    if (!form.checkValidity()) {
                                        event.preventDefault();
                                        event.stopPropagation();
                                    }
                                    form.classList.add('was-validated');
                                }, false);
                            });
                        })();
                    });
                </script>

                <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />