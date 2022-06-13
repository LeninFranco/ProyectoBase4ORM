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
            <c:if test="${msg != null}">
            <div class="row pt-2">
                <div class="alert alert-<c:out value="${tipo}"/> alert-dismissible fade show" role="alert">
                    <c:out value="${msg}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
            </c:if>  
            <div class="row pt-2">
                <div class="mb-3">
                    <h2 class="text-center">Categoria</h2>
                </div>
                <div class="mb-3">
                    <a class="btn btn-dark w-100" href="CategoriaServlet?accion=nuevo">Añadir Categoria</a>
                </div>
                <div class="mb-3">
                    <a class="btn btn-dark w-100" href="CategoriaServlet?accion=contar">Ver Numero de Articulos por Categoria</a>
                </div>
                <div class="mb-3">
                    <a class="btn btn-dark w-100" href="CategoriaServlet?accion=reportar">Generar Reporte</a>
                </div>
                <div class="mb-3">
                    <a class="btn btn-dark w-100" href="CategoriaServlet?accion=graficar">Generar Grafica</a>
                </div>
                <table class="table table-dark table-striped">
                    <tr>
                        <th>ID Categoria</th>
                        <th>Nombre Categoria</th>
                        <th>Descripción Categoria</th>
                        <th>Eliminar</th>
                        <th>Actualizar</th>
                    </tr>
                    <c:forEach items="${categorias}" var="categoria">
                        <tr>
                            <td>
                                <a class="btn btn-secondary" href="CategoriaServlet?accion=ver&id=${categoria.entidad.idCategoria}"><c:out value="${categoria.entidad.idCategoria}"/></a>
                            </td>
                            <td>
                                <c:out value="${categoria.entidad.nombreCategoria}"/>
                            </td>
                            <td>
                                <c:out value="${categoria.entidad.descripcionCategoria}"/>
                            </td>
                            <td>
                                <a class="btn btn-danger" href="CategoriaServlet?accion=eliminar&id=${categoria.entidad.idCategoria}"><i class="fa-solid fa-trash-can"></i></a>
                            </td>
                            <td>
                                <a class="btn btn-success" href="CategoriaServlet?accion=editar&id=${categoria.entidad.idCategoria}"><i class="fa-solid fa-pen"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
