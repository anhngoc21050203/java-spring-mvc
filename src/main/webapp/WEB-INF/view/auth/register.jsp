<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <jsp:include page="/WEB-INF/view/auth/layout/header.jsp" />

            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth">
                    <div class="row flex-grow">
                        <div class="col-lg-5 mx-auto">
                            <div class="auth-form-light text-center p-5 shadow-lg rounded">
                                <div class="brand-logo mb-4">
                                    <img src="../../assets/images/logo.svg" alt="Logo" class="img-fluid">
                                </div>
                                <h4>Create Your Account</h4>
                                <p class="font-weight-light text-muted">Sign up to get started!</p>
                                <form:form class="pt-3" method="POST" action="/register" modelAttribute="registerDTO">
                                    <div class="row">
                                        <div class="form-group col-md-6 mb-3">
                                            <c:set var="firstNameError">
                                                <form:errors path="firstName" />
                                            </c:set>
                                            <form:input type="text"
                                                class="form-control ${not empty firstNameError ? 'is-invalid' : ''} form-control-lg"
                                                path="firstName" placeholder="First Name" required="true" />
                                            <form:errors path="firstName" cssClass="invalid-feedback" />
                                        </div>
                                        <div class="form-group col-md-6 mb-3">
                                            <c:set var="lastNameError">
                                                <form:errors path="lastName" />
                                            </c:set>
                                            <form:input type="text"
                                                class="form-control ${not empty lastNameError ? 'is-invalid' : ''} form-control-lg"
                                                path="lastName" placeholder="Last Name" required="true" />
                                            <form:errors path="lastName" cssClass="invalid-feedback" />
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <c:set var="emailError">
                                            <form:errors path="email" />
                                        </c:set>
                                        <form:input type="email" path="email"
                                            class="form-control ${not empty emailError ? 'is-invalid' : ''}" id="email"
                                            placeholder="Email" required="true" />
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <form:input type="password" class="form-control form-control-lg" path="password"
                                            placeholder="Password" required="true" />
                                    </div>
                                    <div class="form-group mb-4">
                                        <c:set var="confirmPasswordError">
                                            <form:errors path="confirmPassword" />
                                        </c:set>
                                        <form:input type="password"
                                            class="form-control ${not empty confirmPasswordError ? 'is-invalid' : ''} form-control-lg"
                                            path="confirmPassword" placeholder="Confirm Password" required="true" />
                                        <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                    </div>
                                    <button type="submit"
                                        class="btn btn-gradient-primary btn-lg w-100">Register</button>
                                    <p class="text-center mt-4">Already have an account? <a href="/login"
                                            class="text-primary">Sign In</a></p>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/auth/layout/footer.jsp" />