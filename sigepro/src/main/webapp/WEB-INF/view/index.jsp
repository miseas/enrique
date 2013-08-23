<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SigePRO</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
			body {
			    padding-bottom: 10px;
			    padding-top: 60px;
			}
	      .sidebar-nav {
	        padding: 9px 0;
	      }
	
	      @media (max-width: 980px) {
	        /* Enable use of floated navbar text */
	        .navbar-text.pull-right {
	          float: none;
	          padding-left: 5px;
	          padding-right: 5px;
	        }
	      }
	      
		#footer {
		background-color: #f5f5f5;
		}
		/* Lastly, apply responsive CSS fixes as necessary */
		@media (max-width: 767px) {
		#footer {
		margin-left: -20px;
		margin-right: -20px;
		padding-left: 20px;
		padding-right: 20px;
		}
		} 
		
		.show-grid[class*="span"] {
			background-color: #F5F5F5;
		    border: 1px solid #E3E3E3;
		    border-radius: 4px 4px 4px 4px;
		    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05) inset;
		    min-height: 20px;
		    padding: 10px 19px;
		}
    </style>
    
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
     <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
     <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
     <link rel="shortcut icon" href="../assets/ico/favicon.png">
                  
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">SigePRO</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
            <li class="divider-vertical"></li>
            <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
              <li class="active"><a href="login.htm">Inicio</a></li>
              <li class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Clientes <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="addClient.htm">Agregar</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="listClient.htm">Buscar</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="assignClientAbono.htm">Asignar Abono</a></li>
                </ul>
               </li>
			  <li class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Abonos<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="addAbono.htm">Crear</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="listAbonos.htm">Buscar</a></li>
                  <li class="divider"></li>
                  <li class="disabled"><a href="#">Otro</a></li>
                </ul>
               </li>
               <li class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Incidencia<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="addIncidencia.htm">Crear</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="listIncidencia.htm">Buscar</a></li>
                  <li class="divider"></li>
                  <li class="disabled"><a href="">Historial</a></li>
                </ul>
               </li>
               <li class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Agenda<b class="caret"></b></a>
                 <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="agenda.htm">Ver e imprimir</a></li>
                  <li class="divider"></li>
                  <li class="disabled"><a href="">Otro</a></li>
                </ul>
               </li>
               </sec:authorize>
              <li><a href="#contact">Contacto</a></li>
            </ul>
           <div lang="loginDivData" style="display: none" >
            <form class="navbar-form pull-right" action="j_spring_security_check" method="post">
              <input class="span2" type="text" id="j_username" name="j_username" placeholder="Usuario">
              <input class="span2" type="password" id="j_password" name="j_password" placeholder="Password">
              <button type="submit" onclick="jQuery(this).button('loading')" class="btn btn-primary" data-loading-text="Iniciando...">Iniciar sesión</button>
            </form>
            </div>
             <div lang="alreadyLoggued" class="pull-right" style="display: none" id="templatemo_main">
					<p class="navbar-text pull-left">
             		 Logueado como 
             		 	 <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
						 <strong><sec:authentication property="principal.username"/></strong>
						 </sec:authorize>
           			 </p>
           			 <button type="button" onclick="javascript:window.location.href='logout'" style="margin-left: 10px;" class="btn btn-primary pull-right">
						 Salir<i style="margin-left:5px" class="icon-share"></i>
			         </button>
				</div>		        
	       </div><!--/.nav-collapse -->
          </div>
        </div>
      </div>

    <div class="container">
        <div class="hero-unit">
      		<sec:authorize ifNotGranted="ROLE_USER,ROLE_ADMIN">        
	            <h1>Logueo de usuario</h1>
	            <p>Se deberá loguear para poder acceder a las diferentes opciones del menú</p>
	            <p><a href="#" id="helpLoginButton" class="btn btn-primary btn-large">Ayuda &raquo;</a></p>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">          
	            	<h1>Bienvenido!</h1>
	            	<div class="alert alert-success">
	                <p>Se encuentra logueado con el usuario:
	                		 <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
							 <strong><sec:authentication property="principal.username"/></strong>
							 </sec:authorize>
						. Si lo desea puede <span class="label label-info" style="font-size: 14px">Salir</span> y loguearse con otro usuario</p>
					</div>	
	                
	               	<c:url value="/logout" var="logoutUrl"/>	  
	          	 <p><a class="btn btn-primary btn-large" href="${logoutUrl}" style="font-size: 20px;" >Salir <i style="margin-left:5px" class="icon-share"></i></a></p>                 
	         </sec:authorize>
          </div>
      <div class="row-fluid">
        <div class="span6 show-grid" style="background-color: white">
             <h2>Incidencias del dia</h2>
              <p>Aqui van datos sobre las incidencias mas relevantes para mostrar rapidamente</p>
              <p>Diferente info relacionada a las incidencias y los clientes</p>
              <div class="tabbable"> <!-- Only required for left/right tabs -->
			    <ul class="nav nav-tabs">
				    <li class="active"><a href="#tab1" data-toggle="tab"><span class="label label-important">Importantes</span></a></li>
				    <li><a href="#tab2" data-toggle="tab"><span class="label label-warning">Normales</span></a></li>
				    <li><a href="#tab3" data-toggle="tab"><span class="label label-info">Otras</span></a></li>
			    </ul>
			    <div class="tab-content">
				    <div class="tab-pane active in fade" id="tab1">
				    <p>Cosas importantes</p>
				    <p>Aqui!!!</p>
				    </div>
				    <div class="tab-pane fade" id="tab2">
				    <p>De todos los dias, pero aun relevante.</p>
				    </div>
				   <div class="tab-pane fade" id="tab3">
				    <p>Puede llegar a ser interesante...</p>
				    </div>
			    </div>
			   </div>
        </div>
            <div class="span3 show-grid">
              <h2>Ultimos clientes agregados</h2>
              <p>Puede mostrarse info acerca de los ultimos cientes agregados, sus estados, incidencias, algun otro dato de rapido acceso</p>
            </div><!--/span-->
            <div class="span3 show-grid">
              <h2>Otra info</h2>
              <p>Cualquier otra informacion que valga la pena mostrar en la pantalla principal y sin necesitar logueo...o si</p>
              <p><a class="btn" href="#">Mas detalles &raquo;</a></p>
            </div><!--/span-->
          </div><!--/row-->

      <hr>

    </div><!--/.fluid-container-->
  <div id="footer">
      <div class="container">
        <p class="muted credit">Creada por <a href="#">[Matias Iseas]</a>.</p>
      </div>
    </div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
jQuery(function() {

<sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	jQuery("div[lang='loginDivData']").hide();
	jQuery("div[lang='alreadyLoggued']").show();
</sec:authorize>
<sec:authorize ifNotGranted="ROLE_USER">
jQuery("div[lang='loginDivData']").show();
jQuery("#j_username").focus();
</sec:authorize>

$('#helpLoginButton').popover({html:true,content:"Debe acceder con un <strong>usuario/password</strong> en la barra de menú de arriba"});


});
</script> 

  </body>
</html>
