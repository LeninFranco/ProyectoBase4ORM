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
                    <div class="card-header">Añadir Articulo</div>
                    <div class="card-body">
                        <form action="ArticuloServlet?accion=actualizar" method="POST">
                            <div class="mb-3"><label>ID Articulo</label></div>
                            <div class="mb-3"><input class="form-control" type="text" name="idarticulo" value="${articulo.entidad.idArticulo}" readonly></div>
                            <div class="mb-3"><label>Nombre del Articulo</label></div>
                            <div class="mb-3"><input class="form-control" type="text" name="articulo" value="${articulo.entidad.nombreArticulo}" required></div>
                            <div class="mb-3"><label>Descripcion del Articulo</label></div>
                            <div class="mb-3"><input class="form-control" type="text" name="descripcion" value="${articulo.entidad.descripcionArticulo}" required></div>
                            <div class="mb-3"><label>Precio del Articulo</label></div>
                            <div class="mb-3"><input class="form-control" type="number" min="0.00" step="0.01" name="precio" value="${articulo.entidad.precioUnitario}" required></div>
                            <div class="mb-3"><label>Existencias</label></div>
                            <div class="mb-3"><input class="form-control" type="number" min="0" step="1" name="existencia" value="${articulo.entidad.exitencias}" required></div>
                            <div class="mb-3"><label>Stock Minimo</label></div>
                            <div class="mb-3"><input class="form-control" type="number" min="0" step="1" name="sMinimo" value="${articulo.entidad.stockMinimo}" required></div>
                            <div class="mb-3"><label>Stock Máximo</label></div>
                            <div class="mb-3"><input class="form-control" type="number" min="0" step="1" name="sMaximo" value="${articulo.entidad.stockMaximo}" required></div>
                            <div class="mb-3"><label>ID Categoria</label></div>
                            <div class="mb-3"><input class="form-control" type="text" name="idcategoria" value="${articulo.entidad.idCategoria}" required></div>
                            <div class="mb-3"><button class="btn btn-secondary w-100" type="submit">Guardar</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>