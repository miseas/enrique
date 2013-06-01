<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
<title>SIGECO - Decorart</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="css/blueprint/screen.css" type="text/css" media="screen, projection">
	<link rel="stylesheet" href="css/blueprint/print.css" type="text/css" media="print">   
	<!--[if lt IE 8]><link rel="stylesheet" href="css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->

	<!-- Estilos CSS propios -->
	<link href="css/menuppal.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" charset="utf-8" />
	<!-- JS para el menu ppal -->
	<script type="text/javascript" src="js/menuppal.js"></script>
</head>

<style type="text/css">

</style>

<body>
<div id="header">
	<div class="container">
		<div class="span-20 append-half-bottom">
			SIGECO
		</div>
		<div id="sesion">
		    <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
			<div class="span-4 last">
				Bienvenido <strong><sec:authentication property="principal.username"/></strong><br>
				<c:url value="/logout" var="logoutUrl"/>
				<a id="logoutLink" href="${logoutUrl}" style=" color:white" ><b>Salir de esta sesion</b></a>
			</div>
			</sec:authorize>
		</div>
	</div>
</div>


	<jsp:include flush="true" page="menu.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>
