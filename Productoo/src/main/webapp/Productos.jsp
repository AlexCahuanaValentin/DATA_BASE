<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Favicon -->
<link rel="icon" type="image/png" href="img/Claro.svg.png">

<title>CLARO</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</head>

<body>

	<div class="container-fluid p-0">

		<div class="row">

			<!-- MENU LATERAL -->
			<div class="col">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			
			
			<!-- MENU SUPERIOR DE HORA -->
			<nav
				class="navbar navbar-expand-lg navbar-danger bg-danger navbar-with-datetime">
				<div class="container-fluid">
					<div
						class="d-flex justify-content-center align-items-center flex-grow-1">
						<span id="currentDateTime"
							class="nav-link text-white text-center w-100"> <span
							id="currentTime" style="font-size: 34px;"></span> - <span
							id="currentDate"></span>
						</span>
					</div>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle text-white" href="#"
								id="logoutDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> Cerrar sesion </a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="logoutDropdown">
									<li>
										<div class="d-flex flex-column align-items-center p-3">
											<img src="img\Claro.svg.png" alt="Logo CASSIATEC"
												class="logo-img" style="height: 6rem"> <span
												class="align-self-center">Admin</span>
											<button class="btn btn-danger mt-2" data-bs-toggle="modal"
												data-bs-target="#confirmLogoutModal">Cerrar sesion</button>
										</div>
									</li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- MENU SUPERIOR DE HORA -->
			<script>
			
			//JS PARA QUE FUNCIONE LA BARRA DE HORA
			
	// Obtener el elemento para mostrar la hora y fecha y actualizarlo cada segundo
	var currentDateTimeElement = document.getElementById("currentDateTime");

	// Funcion para obtener la hora actual en formato HH:MM:SS
	function getCurrentTime() {
		var currentDate = new Date();
		var hours = currentDate.getHours().toString().padStart(2, "0");
		var minutes = currentDate.getMinutes().toString().padStart(2, "0");
		var seconds = currentDate.getSeconds().toString().padStart(2, "0");
		return hours + ":" + minutes + ":" + seconds;
	}

	// Funcion para obtener la fecha actual en formato DD/MM/YYYY
	function getCurrentDate() {
		var currentDate = new Date();
		var days = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'];
		var day = days[currentDate.getDay()];
		var date = currentDate.getDate().toString().padStart(2, "0");
		var months = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];
		var month = months[currentDate.getMonth()];
		var year = currentDate.getFullYear().toString();
		return day + ' ' + date + ' de ' + month + ' de ' + year;
	}

	// Actualizar la hora y fecha cada segundo
	function updateCurrentDateTime() {
		var currentTime = getCurrentTime();
		var currentDate = getCurrentDate();
		currentDateTimeElement.textContent = currentTime + " - " + currentDate;
	}

	// Actualizar la hora y fecha inicial y luego cada segundo
	updateCurrentDateTime();
	setInterval(updateCurrentDateTime, 1000);

	function updateCurrentDateTime() {
		var currentTimeElement = document.getElementById("currentTime");
		var currentDateElement = document.getElementById("currentDate");

		var currentTime = getCurrentTime();
		var currentDate = getCurrentDate();

		currentTimeElement.textContent = currentTime;
		currentDateElement.textContent = currentDate;
	}
</script>

			<!-- BOTON CERRAR SESION -->
			<div class="modal fade" id="confirmLogoutModal" tabindex="-1"
				aria-labelledby="confirmLogoutModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmLogoutModalLabel">Confirmar
								cierre de sesion</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="text-center mx-auto">
								<img src="img\cerrarSESION.png" alt="Logo CASSIATEC"
									class="logo-img" style="height: 6rem">
								<H4>
									<span>¿Desea cerrar <br>sesion?
									</span>
								</H4>
							</div>
						</div>
						<div class="modal-footer">
							<div class="text-center mx-auto">
								<button type="button" class="btn btn-danger"
									onclick="cerrarSesion()">Cerrar sesion</button>
								<script>
									function cerrarSesion() {
										// Redireccionar a la pÃ¡gina de inicio de sesiÃ³n
										window.location.href = "index.jsp";
									}
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- TARJETA -->
		<div class="row">
			<div class="p-4	">
				<div class="container">
					<div class="row">
						<div class="col-md-10 mx-auto">
							<div class="card">
								<h2 class="text-center mt-4">
											Listar Productos</strong>
										</h2>
								<div class="card-body">
									<form method="post" action="productBuscar">
								  <div class="mb-3 row">
								   
								  
								    <div class="col-sm-3" id="barra_field">
								      <input type="text" class="form-control" id="name" name="name" placeholder="Ingrese el Nombre">
								    </div>
								  
								    <div class="col-sm-3" id="objeto_field" style="display: none;">
								      <input type="text" class="form-control" id="type" name="type" placeholder="Ingrese el Tipo">
								    </div>
								    
		
								    <div class="col-sm-2">
								      <select class="form-select" id="search_field" name="search_field" onchange="updateSearchFields()">
								        <option value="name" selected>Nombre</option>
								        <option value="type">Tipo</option>
								      </select>
								    </div>
								    
								    <div class="col-sm-1">
								      <button type="button" class="btn btn-outline-primary mb-3" id="btnBuscar" name="btnBuscar">Buscar</button>
								    </div>	
    

											<div class="col-sm-1">
												<button type="button" class="btn btn-outline-primary mb-2"
													id="btnNuevo" name="btnNuevo">Insertar</button>
											</div>

  
											<div class="form-check form-switch" style="right: 100%;">
												<input class="form-check-input" type="checkbox"
													role="switch" id="flexSwitchCheckDefault" checked
													onchange="filtrarRegistros()"> <label
													class="form-check-label" for="flexSwitchCheckDefault"
													id="labelSwitch">Activo</label>
											</div>
											
										</div>
									</form>
								</div>
							</div>
							<br />
						<!-- Card de resultados -->
							<div class="card" id="divResultado">
								<div class="card-header">Resultados</div>
								<div class="card-body" style="overflow-x: auto;">
								
								
								 
									<table class="table">
										<caption>Aqui podemos encontrar los datos de los
											Productos</caption>
										<thead>
											<tr>
												<th>Codigo</th>
												<th>Nombre</th>
												<th>Descripcion</th>
												<th>Puntos</th>
												<th>Stock</th>
												<th>Tipo</th>
												<th>Marca</th>
												<th>ACCION</th>
											</tr>
										</thead>
										<tbody id="detalleTabla">
										</tbody>
									</table>
								</div>
							</div>
								<style>
								.card {
									width: 135%;
								}
								</style>

				<!-- Formulario de edicion de registro -->
							<div class="card" id="divRegistro" style="display: none;">
								<div class="card-header" id="tituloRegistro">{accion}
									EMPLEADO</div>
								<div class="card-body">
									<form>
										<input type="hidden" id="accion" name="accion">
										<!-- Codigo de barra -->
										<div class="row mb-3">
											<label for="frmId" class="col-sm-2 col-form-label">Codigo</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="frmId" name="frmId" >
												<div class="valid-feedback">Correcto</div>
											    <div class="invalid-feedback">Es necesario escribir exactamente 6 números en el código de barras</div>
											</div>
										</div>
											<script>
											// ObtÃ©n el elemento del campo de entrada por su ID
											var frmCellphone = document
													.getElementById("frmId");

											// Agrega un evento de escucha para el evento "input"
											frmCellphone
													.addEventListener(
															"input",
															function() {
																// Elimina cualquier carÃ¡cter que no sea un nÃºmero
																var value = frmCellphone.value
																		.replace(
																				/\D/g,
																				"");

																// Limita el valor a 9 dÃ­gitos
																if (value.length > 9) {
																	value = value
																			.slice(
																					0,
																					9);
																}

																// Asigna el valor modificado de vuelta al campo de entrada
																frmCellphone.value = value;
															});
											</script>
											
					
									<!-- Nombre  -->
											<div class="row mb-3">
										    <label for="frmName" class="col-sm-2 col-form-label">Nombre</label>
											    <div class="col-sm-10">
											        <input type="text" class="form-control" id="frmName" name="frmName" required pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+">
											        <div class="valid-feedback">Correcto</div>
											        <div class="invalid-feedback">Es necesario escribir solo letras en el campo de Nombre</div>
											    </div>
											</div>

											<script>
											var nombresInput = document
												.getElementById('frmName');
											nombresInput
												.addEventListener(
													'input',
													function(event) {
														var nombres = event.target.value;
														var regex = /^[A-Za-z\s]+$/;
														if (nombres === '') {
															nombresInput.classList
																	.remove('is-valid');
															nombresInput.classList
																	.remove('is-invalid');
														} else if (regex
																.test(nombres)) {
															nombresInput.classList
																	.remove('is-invalid');
															nombresInput.classList
																	.add('is-valid');
														} else {
															nombresInput.classList
																	.remove('is-valid');
															nombresInput.classList
																	.add('is-invalid');
														}
													});
											</script>
									<!-- Descripcion  -->
											<div class="row mb-3">
										    <label for="frmDescription" class="col-sm-2 col-form-label">Descripcion</label>
											    <div class="col-sm-10">
											        <input type="text" class="form-control" id="frmDescription" name="frmDescription">
											    </div>
											</div>
					
										
									<!-- Puntos -->
											<div class="row mb-3">
											    <label for="frmPoints" class="col-sm-2 col-form-label">Puntos</label>
											    <div class="col-sm-10">
											        <input type="text" class="form-control" id="frmPoints" name="frmPoints" >
											        <div class="valid-feedback">Correcto</div>
											        <div class="invalid-feedback">Es necesario ingresar números en el campo de Puntos</div>
											    </div>
											</div>

								
										<script>
										var numerosInput = document.getElementById('frmPoints');
										numerosInput.addEventListener('input', function(event) {
										    var numero = event.target.value;
										    var regex = /^[0-9]+$/; // Esta expresión regular permite solo números

										    if (numero === '') {
										        numerosInput.classList.remove('is-valid');
										        numerosInput.classList.remove('is-invalid');
										    } else if (regex.test(numero)) {
										        numerosInput.classList.remove('is-invalid');
										        numerosInput.classList.add('is-valid');
										    } else {
										        numerosInput.classList.remove('is-valid');
										        numerosInput.classList.add('is-invalid');
										    }
										});
										</script>
								<!-- Stock -->
											<div class="row mb-3">
											    <label for="frmStock" class="col-sm-2 col-form-label">Stock</label>
											    <div class="col-sm-10">
											        <input type="number" class="form-control" id="frmStock" name="frmStock" required>
											        <div class="valid-feedback">todo bien</div>
											        <div class="invalid-feedback">Es necesario ingresar números en el campo de Puntos</div>
											    </div>
											</div>

								
										<script>
										var numerosInput = document.getElementById('frmStock');
										numerosInput.addEventListener('input', function(event) {
										    var numero = event.target.value;
										    var regex = /^[0-9]+$/; // Esta expresión regular permite solo números

										    if (numero === '') {
										        numerosInput.classList.remove('is-valid');
										        numerosInput.classList.remove('is-invalid');
										    } else if (regex.test(numero)) {
										        numerosInput.classList.remove('is-invalid');
										        numerosInput.classList.add('is-valid');
										    } else {
										        numerosInput.classList.remove('is-valid');
										        numerosInput.classList.add('is-invalid');
										    }
										});
										</script>
								<!-- Typo  -->
											<div class="row mb-3">
										    <label for="frmType" class="col-sm-2 col-form-label">Tipo</label>
											    <div class="col-sm-10">
											        <input type="text" class="form-control" id="frmType" name="frmType" >
											        <div class="valid-feedback">Correcto</div>
											        <div class="invalid-feedback">Es necesario escribir solo letras en el campo Tipo</div>
											    </div>
											</div>

											<script>
											var tipoInput = document
											.getElementById('frmType');
											tipoInput
											.addEventListener(
												'input',
												function(event) {
													var tipo = event.target.value;
													var regex = /^[A-Za-z\s]+$/;
													if (tipo === '') {
														tipoInput.classList
																.remove('is-valid');
														tipoInput.classList
																.remove('is-invalid');
													} else if (regex
															.test(tipo)) {
														tipoInput.classList
																.remove('is-invalid');
														tipoInput.classList
																.add('is-valid');
													} else {
														tipoInput.classList
																.remove('is-valid');
														tipoInput.classList
																.add('is-invalid');
													}
												});
											</script>
						
							
									<!-- Marca -->
									<div class="row mb-3">
									    <label for="frmBrand" class="col-sm-2 col-form-label">Marca</label>
									    <div class="col-sm-10">
									        <input type="text" class="form-control" id="frmBrand" name="frmBrand" required pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+">
									        <div class="valid-feedback">Todo bien</div>
									        <div class="invalid-feedback">Es necesario ingresar solo letras en el campo de Marca</div>
									    </div>
									</div>

					
					
									<script>
									var nombresInput = document
									.getElementById('frmBrand');
								nombresInput
									.addEventListener(
										'input',
										function(event) {
											var nombres = event.target.value;
											var regex = /^[A-Za-z\s]+$/;
											if (nombres === '') {
												nombresInput.classList
														.remove('is-valid');
												nombresInput.classList
														.remove('is-invalid');
											} else if (regex
													.test(nombres)) {
												nombresInput.classList
														.remove('is-invalid');
												nombresInput.classList
														.add('is-valid');
											} else {
												nombresInput.classList
														.remove('is-valid');
												nombresInput.classList
														.add('is-invalid');
											}
										});
									</script>
					
					
					<button type="button" class="btn btn-primary" id="btnProcesar">Procesar</button>
				</form>
			

				
			</div>
		</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	
<style>

/*ESTILO PAR AAGRANDAR LOS CAMPOS DE "gRADO" Y "SECCION"*/
    #grade_field input,
	#section_field input {
  height: calc(1.5em + 0.75rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 0.875rem;
}

/*ESTOS ESTILOS ES PARA EL BOTON GENERAR CSV */
    .btn.btn-outline-success.mb-1 {
        color: gray;
        transition: color 0.3s, background-color 0.3s; /* Agrega una transición suave */
        border-color: gray; /* Cambia el color del borde a blanco */
    }

    .btn.btn-outline-success.mb-1:hover {
        color: white; /* Cambia el color del texto a blanco */
        background-color: gray; /* Cambia el color de fondo al mismo gris */
        border-color: gray; /* Cambia el color del borde a blanco */
    }
    }


    </style>

	<script src="https://kit.fontawesome.com/3d22aaea26.js"
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
	btnNuevo.addEventListener("click", fnBtnNuevo);  // Agregamos el evento click para el botón "Nuevo"
	btnProcesar.addEventListener("click", fnBtnProcesar);

	// Campos del formulario
	let accion = document.getElementById('accion');
	let frmId = document.getElementById('frmId');
	let frmName = document.getElementById('frmName')
	let frmDescription = document.getElementById('frmDescription')
	let frmPoints = document.getElementById('frmPoints');
	let frmStock = document.getElementById('frmStock');
	let frmType = document.getElementById('frmType');
	let frmBrand = document.getElementById('frmBrand');

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
		document.getElementById("divResultado").style.display = "none";
		document.getElementById("divRegistro").style.display = "block";
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
		datos += "&name=" + document.getElementById("frmName").value;
		datos += "&description=" + document.getElementById("frmDescription").value;
		datos += "&points=" + document.getElementById("frmPoints").value;
		datos += "&stock="
			+ document.getElementById("frmStock").value;
		datos += "&type=" + document.getElementById("frmType").value;
		datos += "&brand="
			+ document.getElementById("frmBrand").value;
		// El envio con AJAX
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "ClienteProcesar", true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
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
		document.getElementById("tituloRegistro").innerHTML = ACCION_NUEVO + " REGISTRO";
		document.getElementById("accion").value = ACCION_NUEVO;
		fnEstadoFormulario(ACCION_NUEVO);

		// Mostrar formulario
		document.getElementById("divResultado").style.display = "none";
		document.getElementById("divRegistro").style.display = "block";
	}
	document.addEventListener("DOMContentLoaded", function() {
		// Mostrar la lista de clientes al cargar la página
		fnBtnBuscar();
	});
	// Función fnBtnBuscar
	function fnBtnBuscar() {
		// Datos
		let name = document.getElementById("name").value;
		let type = document.getElementById("type").value;

		let url = "btnBuscar?name=" + name;
		url += "&type=" + type;
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
					detalleTabla += "<td>" + item.name + "</td>";
					detalleTabla += "<td>" + item.description + "</td>";
					detalleTabla += "<td>" + item.points + "</td>";
					detalleTabla += "<td>" + item.stock + "</td>";
					detalleTabla += "<td>" + item.type + "</td>";
					detalleTabla += "<td>" + item.brand + "</td>";
					detalleTabla += "<td>";
					detalleTabla += "<a href='javascript:fnEditar(" + item.id + ");' class='btn btn-primary btn-icon'><i class='fas fa-pencil-alt'></i></a> ";
					detalleTabla += "<a href='javascript:fnEliminar(" + item.id + ");' class='btn btn-danger btn-icon'><i class='fas fa-trash-alt'></i></a>";
					detalleTabla += "</td>";
					detalleTabla += "</tr>";
				});
				document.getElementById("detalleTabla").innerHTML = detalleTabla;
				// Mostrar formulario
				document.getElementById("divResultado").style.display = "block";
				document.getElementById("divRegistro").style.display = "none";
			}
		};
		xhttp.send();
	}

	function fnCargarForm(id) {
		arreglo.forEach(function(item) {
			if (item.id == id) {
				frmId.value = item.id;
				frmName.value = item.name;
				frmDescription.value = item.description;
				frmPoints.value = item.points;
				frmStock.value = item.stock;
				frmType.value = item.type;
				frmBrand.value = item.brand;
				return true;
			}
		});
	}

	function fnEstadoFormulario(estado) {
		frmName.disabled = (estado == ACCION_ELIMINAR)
		frmDescription.disabled = (estado == ACCION_ELIMINAR)
		frmPoints.disabled = (estado == ACCION_ELIMINAR)
		frmStock.disabled = (estado == ACCION_ELIMINAR)
		frmType.disabled = (estado == ACCION_ELIMINAR)
		frmBrand.disabled = (estado == ACCION_ELIMINAR)
		if (estado == ACCION_NUEVO) {
			frmId.value = "";
			frmName.value = "";
			frmDescription.value = "";
			frmPoints.value = "";
			frmStock.value = "";
			frmType.value = "";
			frmBrand.value = "";
		}
	}

	function fnValidar() {

		return true;
	}	
	</script>
</body>
</html>