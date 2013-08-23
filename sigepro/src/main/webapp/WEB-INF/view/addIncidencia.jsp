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


	.fc-header{
		font-size: 12px !important;
	}
	.fc-header-title h2{
	    font-size: 20px !important;
	}
	
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
               <li class="active dropdown">
               <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Incidencia<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Operaciones</li>
                  <li class="divider"></li>
                  <li><a href="addIncidencia.htm">Crear</a></li>
                  <li class="divider"></li>
                  <li class=""><a href="listIncidencia.htm">Buscar</a></li>
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
		    <a href="#">Crear Incidencia</a>
		    </li>
		    </ul>
		    <div style="margin-bottom: -18px;" ></div>
		   <hr>
		   <div style="margin-bottom: -18px;" ></div>
          </div>
      </div>
     <div id="selectClientDiv" class="row-fluid">
     <div class="span12 thumbnail">
		  <div class="row-fluid">
 	  		 <form id="" action="" class="">
	         <div class="row-fluid">
	        	<div class="span3">    
					<label for="nombreSearch"><strong>Nombre</strong></label>
						<input type="text" class="" id="nombreSearch" name="nombreSearch" />
				</div>
			    <div class="span3">    
					<label for="apellidoSearch"><strong>Apellido</strong></label>
						<input type="text" class="" id="apellidoSearch" name="apellidoSearch" />
				</div>
				<div class="span3">    
					<label for="localidadC"><strong>Localidad</strong></label> 
						<select id="localidadCSearch" name="localidadC" class="">
						</select>
			    </div>
				<div class="span3">    
					<label for="cuitSearch"><strong>CUIT/DNI</strong></label>
						<input type="text" class="" id="cuitSearch" name="cuitSearch" />
				</div>
			</div>		
				<div class="row-fluid">	 
				<div class="pull-right">			
		               <button type="button" class="btn btn-primary"  id="searchButton" name="searchButton">Buscar</button>
		               <button type="button" class="btn" id="clearSearchButton" name="clearSearchButton" >Resetear</button>	
				</div>
				</div>
        </form>
		  </div>
      </div>
      </div><!--/row-->
      <div class="row-fluid" id="selectedClientDiv" style="display: none">
	     <div class="span12 thumbnail">
			  <div class="row-fluid">
		         <div class="row-fluid">
		        	<div class="span3">    
		        	<label for="nombreSearch"><strong>Cliente seleccionado</strong></label>
		        	<div class="input-append">
							<input type="text" class="uneditable-input" disabled="disabled" id="selectedClientI" name="selectedClientI" />
							 <button class="btn btn-inverse" id="deselectCliButton" type="button"><i class="icon-remove-sign" ></i> Seleccionar otro</button>
					</div>	
					</div>	    
				</div>		
			  </div>
	      </div>
      </div><!--/row-->
       <hr>
      <div style="margin-bottom: -18px;" ></div>
           
      <div class="row-fluid">
      <div class="span12 thumbnail">
	      <div class="row-fluid" id="clientNoSelected">
		      <div class="span12">
			    <div class="alert alert-info" style="margin-bottom: 0px">
			   	<strong>Seleccione un cliente</strong> para poder crear una incidencia
			    </div>
	     	 </div>
	      </div>
		  <div class="row-fluid" id="clientSelected" style="display: none">
 	  		 <form id="" action="" class="">
	         <div class="row-fluid">
	        	<div class="span3">    
					<label for="typeIncidencia"><strong>Tipo de incidencia</strong></label>
						<select id="typeIncidencia" name="typeIncidencia" class="">
						<option value="-1">Seleccionar</option>
						<option value="1">Mantenimiento</option>
						<option value="2">Otra</option>
						</select>
				</div>
			   <div class="span3">    
					<label for="nombreC"><strong>Fecha Inicio</strong></label>
						<input type="text" class="span5" disabled="disabled" id="fechaIncStart" name="fechaIncStart" />
					<label for="apellidoC"><strong>Estado Incidecia</strong></label>
						<select id="stateIncidencia" name="stateIncidencia" class="span5">
						<option value="0">Sin iniciar</option>
						<option value="1">Iniciada</option>
						<option value="2">Cerrada</option>
						<option value="3">Reabierta</option>
						<option value="4">Pausada</option>
						</select>
			   </div>
			   <div class="span4" id="dataIncidenciaDiv" style="display: none"> 	
			   <div id="options-1" style="display: none">
			   			<label for="nombreC"><strong>Causa</strong></label>
						<input type="text" class="span" id="causaInc" name="causaInc" />
						<label for="nombreC"><strong>Visita</strong></label>
						<div class="input-append">
						<input type="text" class="span4" id="fechaVisita" name="fechaVisita" disabled="disabled" />
					     <button class="btn" id="openVisitDialog" type="button"><i class="icon-calendar-empty" ></i> Crear visita</button>
						</div>
			   </div>		
					<label for="direccionC"><strong>Descripcion</strong></label>
				<textarea name="comentC" id="comentC" rows="2" class="input-block-level"></textarea>
		      </div>    
			</div>		
		    
		<div class="row-fluid">	 
				<div class="pull-right">			
		               <button type="button" class="btn" id="clearIncidenciaButton" onclick="" name="clearIncidenciaButton" >Resetear</button>	
		               <button type="button" class="btn btn-primary"  id="createNewIncidencia" name="createNewIncidencia">Crear</button>
				</div>
				</div>
        </form>
		  </div>
      </div>
      </div><!--/row-->     
      
     <div id="dialogSearchResultClient" class="" style="display: none; padding: 0px !important;"  title="Resultado busqueda de cliente" >      
	     <div class="row-fluid">
	     <div class="span12">
			  <div class="row-fluid">
	<!-- 		  Tabla -->
			     		<div style="" align="center">
				    		<div style="height: 1px" ></div>
		  						 <table style="text-align: center;font-size: 18px" align="center" id="listClientTable">
		             			 </table>	
		             		<div id="listClientTableGrid"></div>
	              		</div>
			  </div>
	
	      </div>
	      </div>
      </div>
<!-- calendar! -->
<div id="dialogCalendarVisit" class="" style="display: none; padding: 0px !important;"  title="Crear Visita" >    
	      <div class="row-fluid">
	        	<div class="span12">
	        	 <label for="directionVisit"><strong>Dirección</strong></label>
				  <input type="text" class="span12" id="directionVisit" name="directionVisit" />
	        	</div>
	      </div>    	
		<div class="row-fluid">
      		 	<div class="span2">     
					<label for="dateStart"><strong>Fecha</strong></label>
						<input type="text" class="span12" id="dateStart" name="dateStart" />
				</div>
			    <div class="span2"> 			
					<label for="timeStart"><strong>Hora inicio</strong></label>
						<input type="text" class="span10" id="timeStart" name="timeStart" />		
				</div>
				<div class="span2">		  
						<label for="timeEnd"><strong>Hora fin</strong></label>
						<input type="text" class="span10" id="timeEnd" name="timeEnd" />
				</div>
		</div>  
		  <div style="margin-bottom: -18px;" ></div>
		<hr>
	<div class="row-fluid">
		 <div class="span8 offset2">	
		<div id='calendar'></div>
		</div>
	</div>
</div>

</div><!--/.fluid-container-->


<div id="eventContent" title="Detalle visita" style="font-size:13px;display:none;"> 
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
<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="js/i18n/grid.locale-es.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript" src='js/fullcalendar.min.js'></script>
<script type="text/javascript" src='js/jquery-ui-timepicker-addon.js'></script>
<script type="text/javascript">
jQuery(function() {
cleanScreenSearch();
cleanIncidenciaForm();

$("#fechaIncStart").val($.fullCalendar.formatDate( new Date(), "dd/MM/yyyy" ));

jQuery("#dialogSearchResultClient").dialog({
	autoOpen: false,
	height: 310,
	width:1110,
	modal:true,
	buttons: [
				{
				html: "<i class='icon-calendar-empty'></i> Cancelar",
				click: function() {
					jQuery( this ).dialog( "close" );
					}
				},
				{
				html: "<i class='icon-edit' id='selectCliButton'></i> Seleccionar",
				click: function() {
					var rowid = jQuery("#listClientTable").jqGrid('getGridParam','selrow');
					if (rowid!=null){
					  setSelectedClient(rowid);
					  $( this ).dialog( "close" );
					}
				   }
				}
	    ],
	resizable: true,
	draggable: false,
	close: function() {
	}
});	 

jQuery("#dialogCalendarVisit").dialog({
	autoOpen: false,
	height:500,
	width:800,
	modal:true,
	buttons: [
				{
				html: "<i class='icon-calendar-empty'></i> Cancelar",
				click: function() {
					jQuery( this ).dialog( "close" );
					}
				},
				{
				html: "<i class='icon-edit' id='selectCliButton'></i> Crear Visita",
				click: function() {
					jQuery("#fechaVisita").val(jQuery("#dateStart").val());
					jQuery( this ).dialog( "close" );
				   }
				}
	    ],
	resizable: false,
	draggable: false,
	close: function() {
	}
});	 

$("#openVisitDialog").click(function(){
	var client = jQuery.data(document.body,"clientData");
	jQuery("#directionVisit").val(client.direccion);
	//jQuery(".fc-header-right span:eq(1)").click();
	jQuery("#dialogCalendarVisit").dialog("open");
	jQuery(".fc-header-left span:eq(3)").click();
	jQuery(".fc-header-left span:eq(2)").click();
});

$("#clearIncidenciaButton").click(function(){
	cleanIncidenciaForm();
});


jQuery.ajax({
    url: '<c:url value="/loadAllCatAddClient.htm" />',
    type: "GET",
    dataType: "json",
    contentType: "application/json",
    data:"", 
    success: function(resp){                                       
     var options = $("#localidadCSearch");
     $.each(resp.localidades, function() {
    	     options.append($("<option />").val(this.idlocalidad).text(this.descripcion));
     });   	 
     var options = $("#localidadC");
   	 $.each(resp.localidades, function() {
   	     options.append($("<option />").val(this.idlocalidad).text(this.descripcion));
   	 });
//    	 var options = $("#typeId");
//    	 $.each(resp.typeID, function() {
//    	     options.append($("<option />").val(this.iddnitipo).text(this.descripcion));
//    	 });
//    	 var options = $("#clientState");
//    	 $.each(resp.estadoCli, function() {
//    	     options.append($("<option />").val(this.idestadocli).text(this.descripcion));
//    	 });
    }
  });
  
  
$("#typeIncidencia").change(function() {
	var value = $(this).find("option:selected").val();
	$("div[id*=options-]").hide();
	if (value!=-1){
		$("#dataIncidenciaDiv").show();
		$("#options-"+value).show();
	}
	else{
		$("#dataIncidenciaDiv").hide();
	}
	
});   

jQuery("#searchButton").click(function(){
	 var name = jQuery("#nombreSearch").val();
	 var lastName = jQuery("#apellidoSearch").val();
	 var cuit = jQuery("#cuitSearch").val();
	 var score = "";
      jQuery("#listClientTable").jqGrid('setGridParam',{url:"<c:url value="/loadListClientsByParameter.htm" />?name="+name+"&lastName="+lastName+"&cuit="+cuit+"&score="+score,page:1}).trigger('reloadGrid');
      $("#selectCliButton").parent().parent().addClass("ui-state-default").removeClass("btn-primary");
      jQuery("#dialogSearchResultClient").dialog("open");
});

jQuery("#clearSearchButton").click(function(){
	 cleanScreenSearch();
	 cancelEdit();
});

$("#createNewIncidencia").click(function(){
	var clientData = jQuery.data(document.body,"clientData");
	var incidenciaTypeId = $("#typeIncidencia option:selected").val();
	var incidenciaEstado = $("#stateIncidencia option:selected").val();
	var fechaInicioNew = $("#fechaIncStart").val();
	var desc = $("#comentC").val();
	var causaOtra = $("#causaInc").val();

	var directionVisit = $("#directionVisit").val();
	var dateStart = $("#dateStart").val();
	var timeStart = $("#timeStart").val();
	var timeEnd = $("#timeEnd").val();


	var newIncidencia = {idtipoincidencia:incidenciaTypeId,idestadoinc:incidenciaEstado,idcliente:clientData.idcliente,fechaInicio:fechaInicioNew,descripcion:desc,
						 titulo:causaOtra};
	var newVisita = {clienteId:clientData.idcliente,titulo:"Mantenimiento",descripcion:"",fechaInicia:dateStart,fechaTermina:dateStart,horaInicia:timeStart,
					 horaTermina:timeEnd,direccion:directionVisit,estado:"0"};
	
	jQuery.ajax({
        url: '<c:url value="/addNewIncidencia.htm" />',
        type: "POST",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify( {'incidencia':newIncidencia,'visita':newVisita} ), 
        success: function(resp){     
				if (resp!=-1){
	           		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Crear Incidencia" );
           		    jQuery("#dialogSuccessOperation").dialog("open");
				}
				else{
					jQuery("#dialogErrorOperation").dialog("open");	
				}
         }
      });
       
});

jQuery("#listClientTable").jqGrid({
	 url: '',
	 datatype: "json", 
	 width : 1100,
	 height : 150,
	 colNames : ['','<fmt:message key="message.cli.nombre"/>',  '<fmt:message key="message.cli.apellido"/>',
	             '<fmt:message key="message.cli.direc"/>', '<fmt:message key="message.cli.localidad"/>','','','','','','CUIT/DNI','','','','','','' ],
		colModel : [
		{
			name : 'idcliente',
			index : 'idcliente',
			width : 1,
			hidden:true					
		},
		{
			name : 'nombre',
			index : 'nombre',
			align: 'center',
			width : 150
		}
		, {
			name : 'apellido',
			index : 'apellido',
			align: 'center',
			width : 150
		}, {
			name : 'direccion',
			index : 'direccion',
			align: 'center',
			width : 200
		}, {
			name : 'localidad',
			index : 'localidad',
			align: 'center',
			width : 100
		}, {
			name : 'email',
			index : 'email',
			align: 'center',
			width : 1,
			hidden:true
		}, {
			name : 'telefono',
			index : 'telefono',
			align: 'center',
			width : 1,
			hidden:true
		},{
			name : 'telefono2',
			index : 'telefono2',
			align: 'center',
			width : 1,
			hidden:true
		},{
			name : 'telefono3',
			index : 'telefono3',
			align: 'center',
			width : 1,
			hidden:true
		}, {
			name : 'notas',
			index : 'notas',
			align: 'center',
			width : 1,
			hidden:true
		}, {
			name : 'cuit',
			index : 'cuit',
			align: 'center',
			width : 80
		}, {
			name : 'ccNro',
			index : 'ccNro',
			align: 'center',
			width : 1,
			hidden:true
		},
		 {
			name : 'estadoCliId',
			index : 'estadoCliId',
			align: 'center',
			width : 1,
			hidden:true
		},
		 {
			name : 'iddnitipo',
			index : 'iddnitipo',
			align: 'center',
			width : 1,
			hidden:true
		},
		 {
			name : 'numerocli',
			index : 'numerocli',
			align: 'center',
			width : 1,
			hidden:true
		},
		 {
			name : 'localidadId',
			index : 'localidadId',
			align: 'center',
			width : 1,
			hidden:true
		},
		{
			name : 'dummy',
			index : 'dummy',
			align: 'center',
			width : 1,
			hidden:true,
			editable:true
		}],
		ondblClickRow: function(id){
			if (id!=null){
			  setSelectedClient(id);
			  $("#dialogSearchResultClient").dialog( "close" );
			}
		},
	  rowNum:10, 
	  rowList:[10,20,30],
	  multiselect: false,
	  sortable: true,
	  pager: '#listClientTableGrid',
	  pgbuttons: false,
	  pginput:false,
	  rownumbers : true,
	  rowList: {},
	  jsonReader : {
         root: "rows",
         page: "page",
         total: "total",
         records: "records",
         repeatitems: false,
         id: "id"
     },				
	  onSelectRow:function(){
		  $("#selectCliButton").parent().parent().unbind('mouseenter mouseleave');
		  $("#selectCliButton").parent().parent().removeClass("ui-state-default").addClass("btn-primary");	
		  },
	  viewrecords: true, 
	  sortorder: "desc", 
	 // caption:'<fmt:message key="message.cli.titulo"/>', 
	  editurl: "dummy.htm"
	  });

$("#gview_listClientTable").css("font-size","14px");



function setSelectedClient(rowid){
	
	var row = jQuery('#listClientTable').jqGrid('getRowData',rowid);
	jQuery.data(document.body,"clientData",row);
	$("#selectedClientI").val(row.nombre+" "+row.apellido);
	$("#selectClientDiv").hide();
	$("#selectedClientDiv").show();	
	$("#clientNoSelected").hide();
	$("#clientSelected").show("blind",{},500);
}


$("#deselectCliButton").click(function(){
	$("#selectedClientI").val("");
	$("#selectedClientDiv").hide();	
	$("#selectClientDiv").show();
	$("#clientSelected").hide();
	$("#clientNoSelected").show();
});
	

jQuery("#dialogErrorOperation").dialog({
	autoOpen: false,
	height: 170,
	modal:true,
	buttons: {
		"Ok": function() {
			jQuery( this ).dialog( "close" );
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
	}
});	 	

jQuery("#dialogSuccessOperation").dialog({
	autoOpen: false,
	height: 170,
	modal:true,
	buttons: {
		"Ok": function() {
			jQuery( this ).dialog( "close" );
			cleanIncidenciaForm();
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
	}
});	 

function cleanIncidenciaForm(){
     $("#typeIncidencia").val(-1).change();
	 $("#stateIncidencia").val(0).change();
	 $("#comentC").val("");
	 $("#causaInc").val("");
	 $("#fechaVisita").val("");
	$("#directionVisit").val("");
    $("#dateStart").val("");
	$("#timeStart").val("");
	$("#timeEnd").val("");
	$("#deselectCliButton").click();
}

jQuery("#nombreSearch" ).autocomplete({
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
					return  { value: capitaliseFirstLetter(elementOfArray.nombre)};											
				}));						
			}
		});
	},
	minLength: 1,
	select: function(event, ui){
	},
	open: function() {
	},
	close: function() {
	}
});

jQuery("#apellidoSearch" ).autocomplete({
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
					return  { value:capitaliseFirstLetter(elementOfArray.apellido)};											
				}));						
			}
		});
	},
	minLength: 1,
	select: function(event, ui){
	},
	open: function() {
	},
	close: function() {
	}
});


//	calendar config 
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
	//editable: true,
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
	           				description: 'Visitar en el cumple',
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
		draggable: false,
		title: event.clientName,//+"-"+event.title,
		closeOnEscape: true,
		buttons: [
				{
				html: "<i class='icon-calendar-empty'></i> Cerrar",
				click: function() {
					$(this).dialog("close");
					}
				}
	    ]
		}); 
}


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
	 currentText: "Hoy"
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
	
	loadAllVisits();	
});
//Other functions

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
			         'color':visit.estado=='1'?"red":""
			         };    
        		sourceVisits.push(source);
        	});
        	
	  		$('#calendar').fullCalendar( 'addEventSource', sourceVisits );
        }
      });
}

function cleanScreenSearch(){
	 jQuery("#nombreSearch").val("");
	  	 jQuery("#apellidoSearch").val("");
		 jQuery("#cuitSearch").val("");		 
		 jQuery("#localidadSearch").val("");
		 jQuery("#nombreSearch").focus();
}


function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script> 

  </body>
</html>
