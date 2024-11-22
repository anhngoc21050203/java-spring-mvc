<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="/WEB-INF/view/auth/layout/header.jsp" />

        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth">
                <div class="row flex-grow">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light text-center p-5 shadow-lg rounded">
                            <div class="brand-logo mb-4">
                                <img src="../../assets/images/logo.svg" alt="Logo" class="img-fluid">
                            </div>
                            <h4>Welcome Back!</h4>
                            <p class="font-weight-light text-muted">Sign in to continue.</p>
                            <c:if test="${param.error != null}">
                                <div class="my-2" style="color: red;">Invalid email or password.</div>
                            </c:if>

                            <form class="pt-3" method="POST" action="/login">

                                <div class="form-group mb-3">
                                    <input type="username" class="form-control form-control-lg" name="username"
                                        placeholder="Email" required>
                                </div>
                                <div class="form-group mb-4">
                                    <input type="password" class="form-control form-control-lg" name="password"
                                        placeholder="Password" required>
                                </div>
                                <!-- <div class="form-check text-start mb-3">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember">
                                    <label class="form-check-label" for="remember">Keep me signed in</label>
                                </div> -->
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-gradient-primary btn-lg w-100">Sign In</button>
                                <div class="my-3">
                                    <a href="#" class="auth-link text-muted">Forgot password?</a>
                                </div>
                                <div class="d-flex justify-content-center mt-3">
                                    <button type="button" class="btn btn-facebook btn-lg w-100">
                                        <i class="mdi mdi-facebook me-2"></i> Connect using Facebook
                                    </button>
                                </div>
                                <p class="text-center mt-4">Don't have an account? <a href="/register"
                                        class="text-primary">Register</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/view/auth/layout/footer.jsp" />