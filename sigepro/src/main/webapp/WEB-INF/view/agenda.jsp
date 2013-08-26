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
	 
	 .bs-docs-example:after {
	    background-color: #0088CC;
	    border: 2px solid #DDDDDD;
	    border-radius: 4px 0 4px 0;
	    color: #FFFFFF; 
	    content: "Editar Cliente";
	    font-size: 15px;
	    font-weight: bold;
	    left: -1px;
	    padding: 3px 7px;
	    position: absolute;
	    top: -1px;
  	 }
	
	.bs-docs-example {
	    background-color: #FFFFFF;
	    border: 1px solid #DDDDDD;
	    border-radius: 4px 4px 4px 4px;
	    margin: 15px 0;
	    padding: 39px 19px 14px;
	    position: relative;
	}
	#removeBtn{
		border-radius: 10px 10px 10px 10px;
		margin-top: 8px;
	}
	.ui-autocomplete-loading { background: white url('css/images/ui-anim_basic_16x16.gif') right center no-repeat; }
	.ui-loadingBar { background: transparent url('css/images/load.gif') center / 260px no-repeat;  }


/* 	.fc-header{ */
/* 		font-size: 12px !important; */
/* 	} */
/* 	.fc-header-title h2{ */
/* 	    font-size: 20px !important; */
/* 	} */
	
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/validate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
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
              <li ><a href="login.htm">Inicio</a></li>
              <li class="dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Clientes <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="addClient.htm" >Agregar</a></li>
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
               <li class="active dropdown">
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
             <div lang="alreadyLoggued" class="pull-right" style="" id="templatemo_main">
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
     <div class="row-fluid">
        <div class="span12">
			<ul class="nav nav-pills">
		    <li class="active">
		    <a href="#">Agenda</a>
		    </li>
		    </ul>
		    <div style="margin-bottom: -18px;" ></div>
		   <hr>
		   <div style="margin-bottom: -18px;" ></div>
          </div>
      </div>
		<div class="row-fluid">		
			<div class="span3">
						<label for="apellidoSearch"><strong>Cliente</strong></label>
							<input type="text" class="span12" id="nombreCSearch" name="nombreCSearch" />	
			</div>
			<div class="span2">
						<label for="nombreSearch"><strong>Desde</strong></label>
						<div class="form-inline">
							<input type="text" class="span7" id="dateStart" name="dateStart" />
							<input type="text" class="span5" id="timeStart" name="timeStart" />
						</div>	
			</div>
			<div class="span2">
						<label for="cuitSearch"><strong>Hasta</strong></label>
						 <div class="form-inline">
							<input type="text" class="span7" id="dateEnd" name="dateEnd" />	
							<input type="text" class="span5" id="timeEnd" name="timeStart" />
						 </div>	
									
			</div>
			<div class="span4">
					<label for="puntuacionSearch"><strong>Dirección</strong></label>
							<input type="text" class="input-xlarge" id="direcSearch" name="direcSearch" />	
			</div>
		</div>
		<div class="row-fluid">	 
			<div class="pull-right">			
	               <button type="button" class="btn btn-primary" id="searchButton" name="searchButton">Buscar</button>
	               <button type="button" class="btn" id="clearSearchButton" name="clearSearchButton">Limpiar</button>	
			</div>
		</div>
		<div style="margin-bottom: -14px;" ></div> 
			   <hr>
		<div style="margin-bottom: -12px;" ></div>	
	<div class="row-fluid" >	
	 <div class="span12">		
		<table id="tableVisit" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Cliente</th>
                  <th>Desde</th>
                  <th>Hasta</th>
                  <th>Dirección</th>
                  <th>Descripción</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td colspan="6" align="center">Sin resultados</td>
                </tr>
              </tbody>
            </table>
	</div>	
	</div>
		<div class="row-fluid">
	   		<div class="pull-right" > 		
    				<button class="btn disabled" type="button" id="addNewVisit"><i class="icon-calendar icon-large"></i> Imprimir Visitas</button>
	   		</div>
		</div>
</div>
	
	<div id="dialogAddVisit"  style="display: none" align="" title="Agregar visita a:" >
	 <div class="">	
      <form id="addVisitForm" action="" method="post">
      <input type="hidden" value="" id="visitEditID" />
      <input type="hidden" value="" id="clientIdVisit" />
      <input type="hidden" value="" id="clientNameVisit" />
	      <div class="row-fluid">
	        	<div class="span12">
	        	 <label for="directionVisit"><strong>Dirección</strong></label>
				  <input type="text" class="span12" id="directionVisit" name="directionVisit" />
	        	</div>
	      </div>     	
         <div class="row-fluid">
	        	<div class="span4">    
					<label for="dateStart"><strong>Fecha</strong></label>
						<input type="text" class="span10" id="dateStart" name="dateStart" />
				</div>
			    <div class="span4"> 			
					<label for="timeStart"><strong>Hora inicio</strong></label>
						<input type="text" class="span10" id="timeStart" name="timeStart" />		
				</div>
				<div class="span4">		  
						<label for="timeEnd"><strong>Hora fin</strong></label>
						<input type="text" class="span10" id="timeEnd" name="timeEnd" />
				</div>
			</div>
			<div class="row-fluid">	
				<div class="span4">
				 <label class="checkbox">
					<input id="puntualCheck" type="checkbox" value="true"/><strong> Puntual </strong>
				</label>
				</div>
			</div>	
		 <div class="row-fluid">	 
					<div class="span12">							 
						<label for="comentC"><strong>Descripción</strong></label>
					  		<textarea name="comentC" id="descVisit" rows="2" class="input-block-level"></textarea>
					</div>
				</div>

        </form>
       </div>
	</div>
<div style="margin-bottom: -18px;" ></div>
<hr></hr>
<div class="row-fluid">
	 <div class="span10 offset1">	
	<div id='calendar'></div>
	</div>
</div>
<div id="eventContent" title="Event Details" style="font-size:13px;display:none;"> 
		<div class="row-fluid">
	        	<div class="span12 help-block">
	        	 <label for="dialogDirecVisit"><strong>Dirección</strong></label>
				  <span id="dialogDirecVisit" class="label label-info"></span>
	        	</div>
		</div>     	
		<div class="row-fluid">
	        	<div class="span4 help-block">    
				 <label for="dialogDateStart"><strong>Fecha</strong></label>
					<span id="dialogDateStart" class="label label-info"></span>
				</div>
               <div class="span4 help-block"> 			
		            <label for="dialogTimeStart"><strong>Hora inicio</strong></label>
					<span id="dialogTimeStart" class="label label-info" ></span>		
				</div>
			   <div class="span4 help-block">		  
				    <label for="dialogTimeEnd"><strong>Hora fin</strong></label>
				    <span id="dialogTimeEnd" class="label label-info"></span>
			</div>
	    </div>
<!-- 		<div class="row-fluid">	 -->
<!-- 				<div class="span4"> -->
<!-- 				 <label class="checkbox"> -->
<!-- 					<input id="dialogPuntual" type="checkbox" disabled="disabled" value="true"/><strong> Puntual </strong> -->
<!-- 				</label> -->
<!-- 				</div> -->
<!-- 		</div>		 -->
<div class="row-fluid">	 
 			<div class="span12 help-block">							 
				<label for="comentC"><strong>Descripción</strong></label>
				<span id="dialogDesc" class="label label-info"></span>
	        </div>
</div>
</div>
  <div id="footer" >
      <div class="container">
        <p class="muted credit">Creada por <a href="#">[Matias Iseas]</a>.</p>
      </div>
    </div>
   	<div id="dialogSendEmail" style="display: none" align="" title="Enviar email" >
	<p style="margin:0px;">Destinatario: <input class="text2" type="text" id="toEmail" /> </p>
	<p style="margin:0px;">Asunto: <input class="text2" type="text" id="subjectEmail" /> </p>
	<p style="margin:10px 0px 0px 0px">Contenido:</p>
	<textarea style="width: 500px" name="contentEmail" id="contentEmail" rows="8" cols="6"></textarea>
	</div> 
	<div id="dialogDeleteClient" style="display: none" align="" title="Eliminar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Esta seguro de que desea eliminar el cliente? </p>
	</div> 
	<div id="dialogErrorOperation" class="" style="display: none" align="" title="Eliminar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Se ha producido un error al realizar la operacion! </p>
	</div> 
	<div id="dialogSuccessOperation"  style="display: none" align="" title="Eliminar cliente" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 20px 0;"></span>Operacion realizada exitosamente!</p>
	</div> 
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="js/i18n/grid.locale-es.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript" src="js/excanvas.js" ></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript" src="js/jquery.scrollTo-min.js" ></script>  
<script type="text/javascript" src="js/jquery.autosize-min.js" ></script>  
<script type="text/javascript" src='js/fullcalendar.min.js'></script>
<script type="text/javascript" src='js/jquery-ui-timepicker-addon.js'></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#addNewVisit").popover({content:"Por favor, seleccione primero un cliente",title:"Ayuda"});
	
	 jQuery( "#addNewClient" ).click(function(){
	 		jQuery( "#myModal" ).modal( "show" ); 
	 		jQuery("#nombreC").focus();
	 	 });
	 
	 jQuery( "#addNewVisit" ).click(function(){
		 if ($(this).hasClass('disabled')){
			 return;
		 }
		 $(this).popover("hide");
		 cleanScreenVisit();
		 var cliente = jQuery.data(document.body,"clientData");
		 var nameClient = cliente.nombre+" "+cliente.apellido;
   		
		 jQuery("#dialogAddVisit").dialog( "option", "title", "Agregar visita a: "+nameClient );
		 jQuery("#directionVisit").val(cliente.direccion+", "+cliente.localidad);
	     jQuery("#dialogAddVisit").dialog( "open" ); 
	 		//jQuery("#nombreC").focus();
	 	 }); 
	 
     jQuery("#nombreCSearch" ).autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: '<c:url value="/searchClientByName.htm" />',
					dataType: "json",
					type: "POST",
					data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						nameStartWith: request.term
					},
					success: function( data ) {
						response( jQuery.map( data, function (elementOfArray, indexInArray){							
							return  { value: capitaliseFirstLetter(elementOfArray.nombre) +" "+capitaliseFirstLetter(elementOfArray.apellido), 
								idItem:elementOfArray.idcliente, itemDirec:elementOfArray.direccion, itemLocal:elementOfArray.localidad, 
								itemTel:elementOfArray.telefono, itemCuit:elementOfArray.cuit, itemApellido:elementOfArray.apellido,
								itemNombre:elementOfArray.nombre
							};											
						}));						
					}
				});
			},
			minLength: 1,
			select: function(event, ui){
					jQuery.data(document.body,"clientData",{"idcliente":ui.item.idItem,"direccion":ui.item.itemDirec,
															"localidad":ui.item.itemLocal,"telefono":ui.item.itemTel,
															"cuit":ui.item.itemCuit,"apellido":ui.item.itemApellido,
															"nombre":ui.item.itemNombre} );
					jQuery( "#addNewVisit" ).removeClass("disabled");
			},
			open: function() {
//				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
//				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
		});
     
     
  	jQuery("#addClientForm").validate({
 		focusInvalid:false,
	    rules: {
	    	nombreC:{required: true},
			apellidoC:{required: true},
			emailC:{email:true},
			cuitCC:{digits:true}
        },
	    messages: {
	    	nombreC: {required: "campo obligatorio"},	
	    	apellidoC: {required: "campo obligatorio"},
	    	emailC:{email:"email incorrecto"},
	    	cuitC:{digits:"campo numerico"}
	    },
  	submitHandler: function() { 	  	
  		var nombreNew = jQuery("#nombreC").val();
  		var apellidoNew = jQuery("#apellidoC").val();
  		var direccionNew = jQuery("#direccionC").val();
  		var localidadNew = jQuery("#localidadC").val();
  		var emailNew = jQuery("#emailC").val();
  		var telNew = jQuery("#telC-1").val();
  		var telNew2 =" ";
  		if (jQuery("#telC-2").length>0){
  			telNew2 = jQuery("#telC-2").val();
  		}
  		var telNew3 =" ";
  		if (jQuery("#telC-3").length>0){
  				telNew3 = jQuery("#telC-3").val();
  		}
  		var cuitNew = jQuery("#cuitC").val();
  		var puntuaNew = jQuery('#puntuacionStart input[name=score]').val();
  		var comentNew = jQuery("#comentC").val();
  		var cuentaCNew = jQuery("#ccC").val();
  		  		
  		var newClient = {'nombre':nombreNew,'apellido':apellidoNew,'direccion':direccionNew,
  					    'localidad':localidadNew,'email':emailNew,'telefono':telNew+"@@"+telNew2+"@@"+telNew3,
  						'notas':comentNew,'ccNro':cuentaCNew,'puntuacion':puntuaNew, 'cuit':cuitNew};		  		 
  		 
        jQuery.ajax({
             url: '<c:url value="/addNewClient.htm" />',
             type: "POST",
             dataType: "json",
             contentType: "application/json",
             data: JSON.stringify( newClient ), 
             success: function(resp){   
            	 	if(resp!=-1){ 
            			jSuccess("Operacion realizada exitosamente", "Guardar",function(){
            				jQuery("#nombreCSearch").val(capitaliseFirstLetter(newClient.nombre)+" "+capitaliseFirstLetter(newClient.apellido));
            				jQuery.data(document.body,"clientData",{"idcliente":resp,"direccion":newClient.direccion,
								"localidad":newClient.localidad,"telefono":newClient.telNew,
								"cuit":newClient.cuit,"apellido":newClient.apellido,"nombre":newClient.nombre} );
            				cleanScreenAdd();
            		  		jQuery("#myModal").modal( "hide" );
            		  		jQuery( "#addNewVisit" ).removeClass("disabled");
            			},["Aceptar"]);
            	 	}
            	 	else{
            	 		jAlert("Error al realizar la operación", "Error al Guardar",function(){
            				//cleanScreenAdd();
            			},["Aceptar"]);
            	 	}          	                                
             }
           });
  		
  	}
	         
	});	 
     
     
 	jQuery("#addVisitForm").validate({
 		focusInvalid:false,
	    rules: {
	    	titleVisit:{required: true},
	    	dateStart:{required: true}
        },
	    messages: {
	    	titleVisit: {required: "campo obligatorio"},	
	    	dateStart: {required: "campo obligatorio"}
	    },
  	submitHandler: function() { 	  	
  		//var titulo = jQuery("#titleVisit").val();
  		var descripcion = jQuery("#descVisit").val();
  		var fechaInicia = jQuery("#dateStart").val();
  		var fechaFin = jQuery("#dateEnd").val();
  		var tiempoInicio = jQuery("#timeStart").val();
  		var tiempoFin = jQuery("#timeEnd").val();
  		var directionVisit = jQuery("#directionVisit").val();
  		var puntualCheck = jQuery("#puntualCheck").prop('checked');
  		if (puntualCheck){
  			puntualCheck = 1;
  		}
  		else{
  			puntualCheck = 0;
  		}
  		var todoDia = false;
  		
  		var cliente = jQuery.data(document.body,"clientData");
  		var clientId;
  		
  		var idVisita = jQuery("#visitEditID").val();
  		var urlServ = '<c:url value="/addNewVisit.htm" />';
  		if (idVisita!=""){
  			urlServ = '<c:url value="/editVisit.htm" />';
  			clientId = jQuery("#clientIdVisit").val();
  		}
  		else{
  			clientId = cliente.idcliente;
  		}
  		  		
  		var newVisita = {'idvisita':idVisita, 'clienteId':clientId,'titulo':"",'descripcion':descripcion,
  					    'fechaInicia':fechaInicia,'fechaTermina':fechaInicia,'horaInicia':tiempoInicio,
  						'horaTermina':tiempoFin,'diacompleto':todoDia, 'direccion':directionVisit,'estadoId':puntualCheck};		  		 
  		 
        jQuery.ajax({
             url: urlServ,
             type: "POST",
             dataType: "json",
             contentType: "application/json",
             data: JSON.stringify( newVisita ), 
             success: function(resp){   
            	 	if(resp!=-1){ 
            	 		var clientName;
            	 		if (idVisita!=""){
            	 			$('#calendar').fullCalendar( 'removeEvents', idVisita );
            	 			clientName =jQuery("#clientNameVisit").val();
            	 		}
            	 		else{
            	 			clientName = cliente.nombre +" "+ cliente.apellido;
            	 		}
            	 		
            			jSuccess("Operacion realizada exitosamente", "Guardar",function(){
            				jQuery("#visitEditID").val("");
            				jQuery("#dialogAddVisit").dialog("close");
            				cleanScreenVisit();
            		  		var fechaIS = fechaInicia.split("/");
            		  		var yearI =  fechaIS[2];
            		  		var monthI = fechaIS[1];
            		  		var dayI = fechaIS[0];
            		  		var tiempoIS = tiempoInicio.split(":");
            		  		var hourI = tiempoIS[0];
            		  		var minI = tiempoIS[1];
            		  		if (fechaFin!=null){
            		  		var fechaFS = fechaFin.split("/");
            		  		var yearF =  fechaFS[2];
            		  		var monthF = fechaFS[1];
            		  		var dayF = fechaFS[0];
            		  		}
            		  		var tiempoFS = tiempoFin.split(":");
            		  		var hourF = tiempoFS[0];
            		  		var minF = tiempoFS[1];
            		  		var source=[{'id': resp,
            		  					 'title':clientName,
			                   			 'clientName':clientName,
			                			 'clientId':clientId,
            		  			         'description':descripcion,
            		  			       	 'direccion':directionVisit,
            		  			         'start':new Date(yearI,parseInt(monthI)-1,dayI,hourI,minI),
            		  			         'end': new Date(yearI,parseInt(monthI)-1,dayI,hourF,minF),
            		  			         'allDay':todoDia,
            		  			         'color':puntualCheck==1?"red":""
            		  			         }
            		  		            ];
            		  		$('#calendar').fullCalendar( 'addEventSource', source );
            			},["Aceptar"]);
            	 	}
            	 	else{
            	 		jAlert("Error al realizar la operación", "Error al Guardar",function(){
            			},["Aceptar"]);
            	 	}          	                                
             }
           });
  		
  	}	         
	});	     
     
     
// 	calendar config 
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	$('#calendar').fullCalendar({
		theme: true,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: true,
		allDayText:"Todo el día",
		monthNames:[ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
		monthNamesShort:["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" ],
		dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
		dayNamesShort:[ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
		buttonText: {
			    prev:     '&lsaquo;', // <
			    next:     '&rsaquo;', // >
			    prevYear: '&laquo;',  // <<
			    nextYear: '&raquo;',  // >>
			    today:    'Hoy',
			    month:    'Mes',
			    week:     'Semana',
			    day:      'Día'
		},
		viewDisplay: function(view) {
		        //alert('El nuevo titulo de la vista es: ' + view.title);
		 },
		events: [
		],
		eventSources: [{
		                   events: [ // put the array in the `events` property
		                       {
		           				title: 'Cumple Manu (Test)',
		        				start: new Date(y, m, d+2, 19, 0),
		        				end: new Date(y, m, d+2, 22, 30),
		        				allDay: false
		                       }
		                   ],
		                   //color: 'black',     // an option!
		                   textColor: 'yellow', // an option!
		                   backgroundColor:'red',
		                   editable:false
		               }
		           ],
		eventClick: function(event) {
						//alert(event.title);
						//event.title = "CLICKED!";
				       // $('#calendar').fullCalendar('updateEvent', event);
						return false;
					},
		eventRender: function (event, element) { 
			element.attr('href', 'javascript:void(0);'); 
			$(element).click(function(){openModal(event);});
		},
		eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view ) { 
			updateEventDateTime(event);
		},
		eventResize:function(  event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view  ) { 
			updateEventDateTime(event);
		}
	});
	
	
	 $( "#dateStart" ).datepicker({
		 defaultDate: "+1d",
		 changeMonth: true,
		 numberOfMonths: 2,
		 dateFormat: "dd/mm/yy",
		 dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
		 dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
		 monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ], 
	     monthNamesShort:["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" ],
		 closeText: "Cerrar", 
		 currentText: "Hoy",
		 onClose: function( selectedDate ) {
		 $( "#dateEnd" ).datepicker( "option", "minDate", selectedDate );
		 }
		 });
		 $( "#dateEnd" ).datepicker({
		 defaultDate: "+1w",
		 changeMonth: true,
		 numberOfMonths: 2,
		 dateFormat: "dd/mm/yy",
		 dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
		 dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
		 monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ], 
	     monthNamesShort:["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" ],
		 closeText: "Cerrar", 
		 currentText: "Hoy",
		 onClose: function( selectedDate ) {
		 $( "#dateStart" ).datepicker( "option", "maxDate", selectedDate );
		 }
		 });
      	 
      
	var startDateTextBox = $('#timeStart');
	var endDateTextBox = $('#timeEnd');

	startDateTextBox.timepicker({
		stepMinute: 15,
		closeText:"Listo",
		currentText:"Ahora",
		timeOnlyTitle:"Elegir hora",
		hourText:"Hora",
		minuteText:"Minutos",
		timeText:"Tiempo"
		//controlType: myControl
	});
	endDateTextBox.timepicker({ 
		stepMinute: 15,
		closeText:"Listo",
		currentText:"Ahora",
		timeOnlyTitle:"Elegir hora",
		hourText:"Hora",
		minuteText:"Minutos",
		timeText:"Tiempo"
		//controlType: myControl
	});
	
	
	 	
		jQuery("#dialogAddVisit").dialog({
			autoOpen: false,
			height: 400,
			width:420,
			modal:true,
			buttons: {
				"Cancelar": function() {
					jQuery( this ).dialog( "close" );
				},
				"Guardar": function() {
					jQuery('#addVisitForm').submit();
				}
			},
			resizable: true,
			draggable: false,
			close: function() {
			}
		});	 		
	 	
		loadAllVisits();
});//end jquery load


function loadAllVisits(){
	
    jQuery.ajax({
        url: '<c:url value="/loadAllVisit.htm" />',
        type: "GET",
        dataType: "json",
        contentType: "application/json",
        data: "", 
        success: function(resp){   
        	var sourceVisits= [];
        	$.each(resp, function(index,visit){
    	  		var fechaIS = visit.fechaInicia.split("/");
		  		var yearI =  fechaIS[2];
		  		var monthI = fechaIS[1];
		  		var dayI = fechaIS[0];
		  		var tiempoIS = visit.horaInicia.split(":");
		  		var hourI = tiempoIS[0];
		  		var minI = tiempoIS[1];
		  		if (visit.fechaTermina!=null){
		  		var fechaFS = visit.fechaTermina.split("/");
		  		var yearF =  fechaFS[2];
		  		var monthF = fechaFS[1];
		  		var dayF = fechaFS[0];
		  		}
		  		var tiempoFS = visit.horaTermina.split(":");
		  		var hourF = tiempoFS[0];
		  		var minF = tiempoFS[1];	
        		var source={'id':visit.idvisita,
        			 'title':capitaliseFirstLetter(visit.clienteNombre),
        			 'clientName':capitaliseFirstLetter(visit.clienteNombre), 	
        			 'clientId':visit.clienteId, 
			         'description':visit.descripcion,
			         'direccion':visit.direccion,
			         'start':new Date(yearI,parseInt(monthI)-1,dayI,hourI,minI),
			         'end': new Date(yearI,parseInt(monthI)-1,dayI,hourF,minF),
			         'allDay':visit.diacompleto,
			         'color':visit.estadoId=='100'?"red":""
			         };    
        		sourceVisits.push(source);
        	});
        	
	  		$('#calendar').fullCalendar( 'addEventSource', sourceVisits );
        }
      });
}

function openModal(event) {
	
	$("#dialogDirecVisit").html(event.direccion);
	$("#dialogDateStart").html($.fullCalendar.formatDate( event.start, "dd/MM/yyyy" ));
	$("#dialogTimeStart").html($.fullCalendar.formatDate( event.start, "HH:mm" ));
	$("#dialogTimeEnd").html($.fullCalendar.formatDate( event.end, "HH:mm" ));
	$("#dialogDesc").html(event.description);
    if (event.color=='red'){ 
	$("#dialogPuntual").attr('checked', true);
    }
    else{
    	$("#dialogPuntual").attr('checked', false);	
    }
	$("#eventContent").dialog({ 
		modal: true,
		width:330,
		title: event.clientName,//+"-"+event.title,
		closeOnEscape: true,
		buttons: [
				{
				html: "<i class='icon-calendar-empty'></i> Borrar",
				click: function() {
					delVisit(event.id);
					}
				},
				{
				html: "<i class='icon-edit'></i> Editar",
				click: function() {
					editVisit(event);
					$( this ).dialog( "close" );
					}
				}
	    ]
		}); 
}

function updateEventDateTime(event){

	var fechaInicia = $.fullCalendar.formatDate( event.start, "dd/MM/yyyy" );
	var tiempoInicio = $.fullCalendar.formatDate( event.start, "HH:mm" );
	var tiempoFin = $.fullCalendar.formatDate( event.end, "HH:mm" );
	
var updateVisita = {'idvisita':event.id,'fechaInicia':fechaInicia,'fechaTermina':fechaInicia,'horaInicia':tiempoInicio,
					'horaTermina':tiempoFin};

var	urlServ = '<c:url value="/updateVisitDateTime.htm" />';
	 
jQuery.ajax({
     url: urlServ,
     type: "POST",
     dataType: "json",
     contentType: "application/json",
     data: JSON.stringify( updateVisita ), 
     success: function(resp){   
    	 	if(resp!=-1){ 
 
    	 	}
    	 	else{
    	 		jAlert("Error al actualizar la visita", "Error al Guardar",function(){
    			},["Aceptar"]);
    	 	}          	                                
     }
   });
	
}

function cleanScreenAdd(){
	     jQuery("#nombreC").val("");
	  	 jQuery("#apellidoC").val("");
		 jQuery("#direccionC").val("");
		 jQuery("#localidadC").val("");
		 jQuery("#emailC").val("");
 		 jQuery("#telC-1").val("");
 		 jQuery("#phone-form-1").remove();
 		 jQuery("#phone-form-2").remove();
 		 jQuery("#cuitC").val("");
		 jQuery('#puntuacionStart').raty('cancel', false);
		 jQuery("#comentC").val("");
		 jQuery("#ccC").val("");
	     jQuery("#myModal").modal("hide");	 
}
function cleanScreenVisit(){
	    //jQuery("#titleVisit").val("");
	     jQuery("#dateStart").val("");
	  	 jQuery("#dateEnd").val("");
		 jQuery("#timeStart").val("");
		 jQuery("#timeEnd").val("");
		 jQuery("#descVisit").val("");
	     jQuery("#modalVisit").modal("hide");	 
	     jQuery("#puntualCheck").attr('checked', false);
}

function delVisit(idParam){
	jConfirm("Esta seguro de que desea eliminar la visita?","Operacion Eliminar",function(choice){
		if (choice){
		   jQuery.ajax({
		          url: '<c:url value="/delVisit.htm" />',
		          type: "GET",
		          dataType: "json",
		          contentType: "application/json",
		          data: {idVisita:idParam}, 
		          success: function(resp){     
	            	 if(resp){
							jSuccess("Operacion realizada exitosamente", "Eliminar",function(){
								$("#eventContent").dialog( "close" );
								$('#calendar').fullCalendar( 'removeEvents', idParam );
		        			},["Aceptar"]);
							
		          	  }
	            	 else{
	         	 		jAlert("Error al realizar la operación", "Error al eliminar",function(){
            				//cleanScreenAdd();
            			},["Aceptar"]);
	            		 }
	            	 }
		        });	 
		}
	},["Si","No"]);
}

function editVisit(event){
	 jQuery("#descVisit").val(event.description);
  	 jQuery("#dateStart").val($.fullCalendar.formatDate( event.start, "dd/MM/yyyy" ));
  	 jQuery("#timeStart").val($.fullCalendar.formatDate( event.start, "HH:mm" ));
  	 jQuery("#timeEnd").val($.fullCalendar.formatDate( event.end, "HH:mm" ));
  	 jQuery("#directionVisit").val(event.direccion);
     if (event.color=='red'){ 
  	 jQuery("#puntualCheck").attr('checked', true);
     }
     else{
      jQuery("#puntualCheck").attr('checked', false); 
     }
	 jQuery("#visitEditID").val(event.id);
	 jQuery("#clientIdVisit").val(event.clientId);
	 jQuery("#clientNameVisit").val(capitaliseFirstLetter(event.clientName));
	 jQuery("#dialogAddVisit").dialog( "option", "title", "Editar visita a: "+capitaliseFirstLetter(event.clientName) );
     jQuery("#dialogAddVisit").dialog( "open" ); 
	
	
}

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script>


</body>
</html>