<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- codigo para poner logo en pestaña de navegador -->
<link rel="icon" type="image/png" sizes="100x100"
	href="img\Claro.svg.png">

<title>Home Claro</title>
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

<style>
html, body {
	height: 100%;
	overflow: hidden;
}

.nav-pills li a:hover {
	background-color: orange;
}

.nav-link.active {
	background-color: orange !important;
}

.modal-pink {
	background-color: pink;
}

@
keyframes move { 0% {
	transform: translateX(0);
}

50
%
{
transform
:
translateX(
-20px
);
}
100
%
{
transform
:
translateX(
0
);
}
}
.animated-img {
	animation: move 0s infinite;
}
</style>
<body>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<jsp:include page="BarraLateral.jsp"></jsp:include>

	<script>
		// Obtener el elemento para mostrar la hora y fecha y actualizarlo cada segundo
		var currentDateTimeElement = document.getElementById("currentDateTime");

		// Función para obtener la hora actual en formato HH:MM:SS
		function getCurrentTime() {
			var currentDate = new Date();
			var hours = currentDate.getHours().toString().padStart(2, "0");
			var minutes = currentDate.getMinutes().toString().padStart(2, "0");
			var seconds = currentDate.getSeconds().toString().padStart(2, "0");
			return hours + ":" + minutes + ":" + seconds;
		}

		// Función para obtener la fecha actual en formato DD/MM/YYYY
		function getCurrentDate() {
			var currentDate = new Date();
			var days = [ 'Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves',
					'Viernes', 'Sábado' ];
			var day = days[currentDate.getDay()];
			var date = currentDate.getDate().toString().padStart(2, "0");
			var months = [ 'enero', 'febrero', 'marzo', 'abril', 'mayo',
					'junio', 'julio', 'agosto', 'septiembre', 'octubre',
					'noviembre', 'diciembre' ];
			var month = months[currentDate.getMonth()];
			var year = currentDate.getFullYear().toString();
			return day + ' ' + date + ' de ' + month + ' de ' + year;
		}

		// Actualizar la hora y fecha cada segundo
		function updateCurrentDateTime() {
			var currentTime = getCurrentTime();
			var currentDate = getCurrentDate();
			currentDateTimeElement.textContent = currentTime + " - "
					+ currentDate;
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

	<!-- Modal -->
	<div class="modal fade" id="confirmLogoutModal" tabindex="-1"
		aria-labelledby="confirmLogoutModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmLogoutModalLabel">Confirmar
						cierre de sesión</h5>
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
							onclick="cerrarSesion()">Cerrar sesión</button>
						<script>
							function cerrarSesion() {
								// Redireccionar a la página de inicio de sesión
								window.location.href = "index.jsp";
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/3d22aaea26.js"
		crossorigin="anonymous"></script>
</body>
</html>