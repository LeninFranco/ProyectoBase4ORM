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
                    <h2 class="text-center">Articulo</h2>
                </div>
                <div class="mb-3">
                    <a class="btn btn-dark w-100" href="ArticuloServlet?accion=nuevo">Añadir Articulo</a>
                </div>
                <div class="mb-3">
                    <a class="btn btn-dark w-100" href="ArticuloServlet?accion=reportar">Generar Reporte</a>
                </div>
                <table class="table table-dark table-striped">
                    <tr>
                        <th>ID Articulo</th>
                        <th>Nombre Articulo</th>
                        <th>Descripción Articulo</th>
                        <th>Precio Unitario</th>
                        <th>Existencias</th>
                        <th>Stock Minimo</th>
                        <th>Stock Maximo</th>
                        <th>ID Categoria</th>
                        <th>Eliminar</th>
                        <th>Actualizar</th>
                    </tr>
                    <c:forEach items="${articulos}" var="articulo">
                        <tr>
                            <td>
                                <a class="btn btn-secondary" href="ArticuloServlet?accion=ver&id=${articulo.entidad.idArticulo}"><c:out value="${articulo.entidad.idArticulo}"/></a>
                            </td>
                            <td>
                                <c:out value="${articulo.entidad.nombreArticulo}"/>
                            </td>
                            <td>
                                <c:out value="${articulo.entidad.descripcionArticulo}"/>
                            </td>
                            <td>
                                <c:out value="${articulo.entidad.precioUnitario}"/>
                            </td>
                            <td>
                                <c:out value="${articulo.entidad.exitencias}"/>
                            </td>
                            <td>
                                <c:out value="${articulo.entidad.stockMinimo}"/>
                            </td>
                            <td>
                                <c:out value="${articulo.entidad.stockMaximo}"/>
                            </td>
                            <td>
                                <c:out value="${articulo.entidad.idCategoria}"/>
                            </td>
                            <td>
                                <a class="btn btn-danger" href="ArticuloServlet?accion=eliminar&id=${articulo.entidad.idArticulo}"><i class="fa-solid fa-trash-can"></i></a>
                            </td>
                            <td>
                                <a class="btn btn-success" href="ArticuloServlet?accion=editar&id=${articulo.entidad.idArticulo}"><i class="fa-solid fa-pen"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
