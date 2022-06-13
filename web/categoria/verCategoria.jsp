<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Practica Cuatro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="bg-secondary text-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Tiendita Web</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CategoriaServlet?accion=listarCategorias">Lista de Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ArticuloServlet?accion=listarArticulos">Lista de Articulos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row pt-2">
                <div class="card text-white bg-dark">
                    <div class="card-header">Categoria Seleccionada</div>
                    <div class="card-body">
                        <h3>ID Categoria: <c:out value="${categoria.entidad.idCategoria}"/></h3>
                        <h3>Nombre Categoria: <c:out value="${categoria.entidad.nombreCategoria}"/></h3>
                        <h3>Descripcion Categoria: <c:out value="${categoria.entidad.descripcionCategoria}"/></h3>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
