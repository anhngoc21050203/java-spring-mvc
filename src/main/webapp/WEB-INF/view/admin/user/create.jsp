<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />

            <div class="main-panel">
                <div class="page-header">
                    <h3 class="page-title">Add New User</h3>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/admin">Admin</a></li>
                            <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Add New User</li>
                        </ol>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Add New User</h4>
                                <!-- Đảm bảo rằng bạn đã định nghĩa "newUser" trong Controller -->
                                <form:form class="forms-user" action="/admin/user/store" method="post"
                                    enctype="multipart/form-data" modelAttribute="newUser">
                                    <div class="row">
                                        <!-- Email -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email">Email:</label>
                                                <form:input type="email" path="email" class="form-control" id="email"
                                                    placeholder="Email" required="true" />
                                            </div>
                                        </div>

                                        <!-- Password -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="password">Password:</label>
                                                <form:password path="password" class="form-control" id="password"
                                                    placeholder="Password" required="true" />
                                            </div>
                                        </div>

                                        <!-- Phone -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="phone">Phone:</label>
                                                <form:input path="phone" class="form-control" id="phone"
                                                    placeholder="Phone" required="true" />
                                            </div>
                                        </div>

                                        <!-- Full Name -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="fullname">Full Name:</label>
                                                <form:input path="fullName" class="form-control" id="fullname"
                                                    placeholder="Full Name" required="true" />
                                            </div>
                                        </div>

                                        <!-- Address -->
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="address">Address:</label>
                                                <form:input path="address" class="form-control" id="address"
                                                    placeholder="Address" required="true" />
                                            </div>
                                        </div>

                                        <!-- Image Upload -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="image_url">Profile Image:</label>
                                                <input type="file" class="form-control" id="image_url" name="image"
                                                    accept=".png, .jpg, .jpeg" />
                                                <div id="image_preview" class="mt-3"></div>
                                            </div>
                                        </div>

                                        <!-- Role Selection -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="role_id">Role:</label>
                                                <form:select path="role.name" class="form-select" id="role_id">
                                                    <form:option value="">Select Role</form:option>
                                                    <form:option value="ADMIN">ADMIN</form:option>
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>
                                            </div>
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
                <script>
                    $(document).ready(function () {
                        // Xem trước hình ảnh
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
                                        style: 'max-width: 150px;'
                                    });
                                    previewContainer.append(img);
                                };
                                reader.readAsDataURL(files[0]);
                            }
                        });
                    });
                </script>

                <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />