<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Product</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Favicon -->
                <link href="img/favicon.ico" rel="icon">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                <link href="/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/admin/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/admin/css/style.css" rel="stylesheet">
            </head>

            <body>
                <div class="container-fluid position-relative bg-white d-flex p-0">
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Sidebar Start -->
                    <jsp:include page="../layout/sidebar.jsp" />
                    <!-- Sidebar End -->


                    <!-- Content Start -->
                    <div class="content">
                        <!-- Navbar Start -->
                        <jsp:include page="../layout/header.jsp" />
                        <!-- Navbar End -->

                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Manage Product</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Products</li>
                            </ol>
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Update product</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/product/update"
                                            modelAttribute="updateProduct" class="row" enctype="multipart/form-data">
                                            <div class="mb-3" style="display: none;">
                                                <label class="form-label">Id:</label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">

                                                <label class="form-label">Name:</label>
                                                <form:input type="text" class="form-control" path="name"
                                                    disabled="${true}" />


                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Price:</label>
                                                <form:input type="number"
                                                    class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                    path="price" />
                                                ${errorPrice}
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorPriceSale">
                                                    <form:errors path="salePrice" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Price Sale:</label>
                                                <form:input type="number"
                                                    class="form-control ${not empty errorPriceSale ? 'is-invalid' : ''}"
                                                    path="salePrice" />
                                                ${errorPriceSale}
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Detail_Short:</label>
                                                <form:input type="text" class="form-control" path="shortDesc" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Detai:</label>
                                                <form:input type="text" class="form-control" path="detailDesc" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Quantity:</label>
                                                <form:input type="number"
                                                    class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                    path="quantity" />
                                                ${errorQuantity}
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Chọn danh mục:</label>
                                                <br>
                                                <c:forEach var="category" items="${categories}">
                                                    <c:set var="isChecked" value="false" />

                                                    <c:forEach var="selectedCategory"
                                                        items="${updateProduct.categories}">
                                                        <c:if test="${selectedCategory.id eq category.id}">
                                                            <c:set var="isChecked" value="true" />
                                                        </c:if>
                                                    </c:forEach>

                                                    <input type="checkbox" name="categories" value="${category.id}"
                                                        ${isChecked ? 'checked' : '' }>
                                                    ${category.name} <br>
                                                </c:forEach>

                                            </div>
                                            <label class="form-label">Update Image:</label>
                                            <div style="display: flex; gap: 10px; flex-wrap: wrap;">

                                                <c:forEach var="image" items="${productImages}">
                                                    <div style="text-align: center;">
                                                        <img src="/products/${image.imageUrl}" width="100" height="100"
                                                            style="border: 1px solid #ccc;">
                                                        <br>
                                                        <input type="file" name="newImage_${image.id}">
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="col-12 mb-5 pt-3">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </form:form>

                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Footer Start -->
                        <jsp:include page="../layout/footer.jsp" />
                        <!-- Footer End -->
                    </div>
                    <!-- Content End -->


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                            class="bi bi-arrow-up"></i></a>
                </div>

                <!-- JavaScript Libraries -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/admin/lib/chart/chart.min.js"></script>
                <script src="/admin/lib/easing/easing.min.js"></script>
                <script src="/admin/lib/waypoints/waypoints.min.js"></script>
                <script src="/admin/lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/moment.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
                <script src="/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

                <!-- Template Javascript -->
                <script src="/admin/js/main.js"></script>
            </body>

            </html>