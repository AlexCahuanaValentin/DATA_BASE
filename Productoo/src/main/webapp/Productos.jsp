<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="CSS/style.css">

<title>producto</title>
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>

	<div class="ajustar">

		<!-- BUSQUEDA DEL CLIENTE -->
		<div class="card-body">
			<form method="post" action="#" class="credit-card-div">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div class="col-md-3 col-sm-3 col-xs-3">
								<span class="help-block text-muted small-font">Nombre</span> <input
									type="text" class="form-control" id="ctrlNombre" />
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<span class="help-block text-muted small-font">Descricion</span>
								<input type="text" class="form-control" id="ctrlDescrip" />
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<br />
								<button type="button" class="btn btn-primary mb-3"
									id="btnBuscar" name="btnBuscar">Buscar</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<br>
		<!-- LISTAR LOS CLIENTES -->
		<div class="card" style="display: none;" id="divResultado">
			<div class="card-header">LISTA DE PRODUCTOS</div>
			<div class="card-body">

				<table class="table table-bordered">
					<thead class="table-primary">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">NOMBRE</th>
							<th scope="col">DESCRIPCION</th>
							<th scope="col">PUNTOS</th>
							<th scope="col">ACCION</th>
						</tr>
					</thead>
					<tbody id="detalleTabla">

					</tbody>
				</table>

			</div>
		</div>
		<div>
			<button type="button" class="btn btn-primary mb-3" id="btnNuevo"
				name="btnNuevo">Nuevo</button>
		</div>

	</div>
	<br>
	<!-- Formulario de edición de registro -->
	<div class="ajustar" style="position: relative;">
		<div class="card" id="divRegistro" style="position: absolute; top: 50px; left: 10%; z-index: 999; display: none;">
			<div class="card-header" id="tituloRegistro">{accion} EMPLEADO</div>
			<div class="card-body">
				<form>
					<input type="hidden" id="accion" name="accion">
					<div class="row mb-3">
						<label for="frmId" class="col-sm-2 col-form-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmId">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmnombre" class="col-sm-2 col-form-label">nombre</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmnombre">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmdescrip" class="col-sm-2 col-form-label">Descrip</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmdescrip">
						</div>
					</div>
					<div class="row mb-3">
						<label for="frmpuntos" class="col-sm-2 col-form-label">Puntos</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="frmpuntos">
						</div>
					</div>
					<button type="button" class="btn btn-primary" id="btnProcesar">Procesar</button>
				</form>
			</div>
		</div>
	</div>



	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script>
		// Constantes del CRUD
		const ACCION_NUEVO = "NUEVO";
		const ACCION_EDITAR = "EDITAR";
		const ACCION_ELIMINAR = "ELIMINAR";

		// Arreglo de registros
		let arreglo = [];

		// Acceder a los controles
		let btnBuscar = document.getElementById("btnBuscar");
		let btnNuevo = document.getElementById("btnNuevo");
		let btnProcesar = document.getElementById("btnProcesar");

		// Programar los controles
		btnBuscar.addEventListener("click", fnBtnBuscar);
		btnNuevo.addEventListener("click", fnBtnNuevo); // Agregamos el evento click para el botón "Nuevo"
		btnProcesar.addEventListener("click", fnBtnProcesar);

		// Campos del formulario
		let accion = document.getElementById('accion');
		let frmId = document.getElementById('frmId');
		let frmnombre = document.getElementById('frmnombre')
		let frmdescrip = document.getElementById('frmdescrip')
		let frmpuntos = document.getElementById('frmpuntos');

		// Programar los controles
		btnBuscar.addEventListener("click", fnBtnBuscar);
		btnNuevo.addEventListener("click", fnBtnNuevo);
		btnProcesar.addEventListener("click", fnBtnProcesar);

		// Funcion fnEditar
		function fnEditar(id) {
			// Preparando el formulario
			document.getElementById("tituloRegistro").innerHTML = ACCION_EDITAR
					+ " REGISTRO";
			document.getElementById("accion").value = ACCION_EDITAR;
			fnCargarForm(id);
			fnEstadoFormulario(ACCION_EDITAR)
			// Mostrar formulario
		    document.getElementById("divResultado").style.display = "block"; // Mostrar la tabla
		    document.getElementById("divRegistro").style.display = "block"; // Mostrar el formulario
		    document.getElementById("divRegistro").style.position = "absolute";
		    document.getElementById("divRegistro").style.top = "100px";
		    document.getElementById("divRegistro").style.left = "350px";
		}

		// Funcion fnEliminar
		function fnEliminar(id) {
			// Preparando el formulario

			document.getElementById("accion").value = ACCION_ELIMINAR;
			fnCargarForm(id);
			fnBtnProcesar();
			fnBtnBuscar();
		}

		// Funcion fnBtnProcesar
		function fnBtnProcesar() {
			// Validar
			if (!fnValidar()) {
				return;
			}
			// Preparar los datos
			let datos = "accion=" + document.getElementById("accion").value;
			datos += "&id=" + document.getElementById("frmId").value;
			datos += "&nombre=" + document.getElementById("frmnombre").value;
			datos += "&descrip=" + document.getElementById("frmdescrip").value;
			datos += "&puntos=" + document.getElementById("frmpuntos").value;
			// El envio con AJAX
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "ClienteProcesar", true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					// La solicitud se completó correctamente
					console.log(xhr.responseText);
					alert(xhr.responseText);
				}
			};
			xhr.send(datos);
		}

		// Funcion fnBtnNuevo
		function fnBtnNuevo() {
			// Preparando el formulario
			document.getElementById("tituloRegistro").innerHTML = ACCION_NUEVO
					+ " REGISTRO";
			document.getElementById("accion").value = ACCION_NUEVO;
			fnEstadoFormulario(ACCION_NUEVO);

			// Mostrar formulario
		    document.getElementById("divResultado").style.display = "block"; // Mostrar la tabla
		    document.getElementById("divRegistro").style.display = "block"; // Mostrar el formulario
		    document.getElementById("divRegistro").style.position = "absolute";
		    document.getElementById("divRegistro").style.top = "100px";
		    document.getElementById("divRegistro").style.left = "350px";
		}
		document.addEventListener("DOMContentLoaded", function() {
			// Mostrar la lista de clientes al cargar la página
			fnBtnBuscar();
		});
		// Función fnBtnBuscar
		function fnBtnBuscar() {
			// Datos
			let ctrlNombre = document.getElementById("ctrlNombre").value;
			let ctrlDescrip = document.getElementById("ctrlDescrip").value;

			let url = "btnBuscar?nombre=" + ctrlNombre;
			url += "&descrip=" + ctrlDescrip;
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let detalleTabla = "";
					arreglo.forEach(function(item) {
						detalleTabla += "<tr>";
						detalleTabla += "<th scope='row'>" + item.id + "</th>";
						detalleTabla += "<td>" + item.nombre + "</td>";
						detalleTabla += "<td>" + item.descrip + "</td>";
						detalleTabla += "<td>" + item.puntos + "</td>";
						detalleTabla += "<td>";
						detalleTabla += "<a href='javascript:fnEditar("
								+ item.id + ");'>Editar</a> ";
						detalleTabla += "<a href='javascript:fnEliminar("
								+ item.id + ");'>Eliminar</a>";
						detalleTabla += "</td>";
						detalleTabla += "</tr>";
					});
					document.getElementById("detalleTabla").innerHTML = detalleTabla;
					// Mostrar formulario
					document.getElementById("divResultado").style.display = "block";
					document.getElementById("divRegistro").style.display = "none";
					document.getElementById("divRegistro").style.position = "absolute";
					document.getElementById("divRegistro").style.top = "50px";
					document.getElementById("divRegistro").style.left = "10%";
					document.getElementById("divRegistro").style.zIndex = "999";
				}
			};
			xhttp.send();
		}

		function fnCargarForm(id) {
			arreglo.forEach(function(item) {
				if (item.id == id) {
					frmId.value = item.id;
					frmnombre.value = item.nombre;
					frmdescrip.value = item.descrip;
					frmpuntos = item.puntos;
					return true;
				}
			});
		}

		function fnEstadoFormulario(estado) {
			frmnombre.disabled = (estado == ACCION_ELIMINAR)
			frmdescrip.disabled = (estado == ACCION_ELIMINAR)
			frmpuntos = (estado == ACCION_ELIMINAR)
			if (estado == ACCION_NUEVO) {
				frmId.value = "";
				frmnombre.value = "";
				frmdescrip.value = "";
				frmpuntos = "";
			}
		}

		function fnValidar() {

			return true;
		}
	</script>

</body>
</html>