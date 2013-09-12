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
	    content: "Editar Incidencia";
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

    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/validate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
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
		    <a href="#">Historial Incidencia</a>
		    </li>
		    </ul>
		    <div style="margin-bottom: -18px;" ></div>
		   <hr>
		   <div style="margin-bottom: -18px;" ></div>
          </div>
      </div>
     <div class="row-fluid">
     <div class="span12 thumbnail">
		  <div class="row-fluid">
 	  		 <form id="" action="" class="">
	         <div class="row-fluid">
	        	<div class="span3">    
					<label for="nombreSearch"><strong>Nombre cliente</strong></label>
						<input type="text" class="" id="nombreSearch" name="nombreSearch" />
				</div>
				<div class="span2">				
				<label for="typeIncidencia"><strong>Tipo de incidencia</strong></label>
						<select id="typeIncidenciaSearch" name="typeIncidenciaSearch" class="span10">
						<option value="-1">Todos</option>
				</select>
				</div>
				<div class="span2">    
					<label for="apellidoC"><strong>Estado Incidecia</strong></label>
						<select id="stateIncidenciaSearch" name="stateIncidenciaSearch" class="span10">
						<option value="-1">Todos</option>
						</select>
				</div>
				<div class="span2">
					<label for="fechaDesde"><strong>Fecha desde</strong></label>
   						<input type="text" class="input-small" alt="dateP" id="fechaDesde" name="fechaDesde"/>
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
           <hr>
     <div class="row-fluid">
     <div class="span12 thumbnail">
		  <div class="row-fluid">
<!-- 		  Tabla -->
		     		<div style="" align="center">
			    		<div style="height: 1px" ></div>
	  						 <table style="text-align: center;font-size: 16px" align="center" id="listIncidenciaTable">
	             			 </table>	
	             		<div id="listIncidenciaTableGrid"></div>
              		</div>
		  </div>
     <div class="editIncidenciatDiv" style="display: none;">
     <br>
	 <div class="bs-docs-example">      
      <div class="row-fluid">	 
      <div class="span12">
      <input type="hidden" class="" id="idIncidenciaEdit" name="idIncidenciaEdit" />  
		  <div class="row-fluid" id="clientSelected" >
 	  		 <form id="" action="" class="">
	         <div class="row-fluid">
	        	<div class="span3">    
					<label for="typeIncidencia"><strong>Tipo de incidencia</strong></label>
						<select id="typeIncidencia" name="typeIncidencia" class="">
						</select>
				</div>
			   <div class="span3">    
					<label for="fechaIncStart"><strong>Fecha Inicio</strong></label>
						<input type="text" class="span5" disabled="disabled" id="fechaIncStart" name="fechaIncStart" />
					<label for="apellidoC"><strong>Estado Incidecia</strong></label>
						<select id="stateIncidencia" name="stateIncidencia" class="span5">
						</select>
			   </div>
			   <div class="span4" id="dataIncidenciaDiv" style="display: none"> 	
			   <div id="options-1" style="display: none">
			   			<label for="causaInc"><strong>Causa</strong></label>
						<input type="text" class="span" id="causaInc" name="causaInc" />
						<label for="fechaVisita"><strong>Visita</strong></label>
						<div class="input-append" id="visitDiv">
						<input type="text" class="span4" id="fechaVisita" name="fechaVisita" disabled="disabled" />
						 <button class="btn" id="openVisitDialog" type="button" style="display: none"><i class="icon-calendar-empty" ></i> Crear visita</button>						
					     <button class="btn" id="openVisitDialogChange" type="button" style="display: none"><i class="icon-calendar" ></i> Cambiar</button>
					     <button class="btn btn-danger" id="cancelVisitDialog" type="button" style="display: none"><i class="icon-remove-sign" ></i> Cancelar</button>
						</div>
			   </div>		
					<label for="direccionC"><strong>Descripcion</strong></label>
				<textarea name="comentC" id="comentC" rows="2" class="input-block-level"></textarea>
		      </div>    
			</div>		
		    
		<div class="row-fluid">	 
				<div class="pull-right">			
		               <button type="button" onclick="" id="updateIncidenciaBtn" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cancelEdit();" class="btn" >Cancelar</button>	
				</div>
				</div>
        </form>
		  </div>
      </div>
      </div>
      </div>
      <!--/row-->    
     </div> 
      </div>
      </div>
      <hr>

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
    
  <div id="footer" >
      <div class="container">
        <p class="muted credit">Creada por <a href="#">[Matias Iseas]</a>.</p>
      </div>
    </div>
   	<div id="dialogCancelVisita" style="display: none" align="" title="Cancelar Visita" >
	    <div class="row-fluid">
		 <div class="span12">
			<p style="margin:0px;"><b>Causa de la cancelación</b>
			<select class="" id="cancelVisitCause" ></select> </p>
			<p style="margin:10px 0px 0px 0px"><b>Aclaración</b></p>
			<textarea  class="span12" name="contentCancel" id="contentCancel" rows="3" cols="1"></textarea>
		</div>
		</div>
	</div> 
	<div id="dialogDeleteIncidencia" style="display: none" align="" title="Eliminar incidencia" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Esta seguro de que desea eliminar la incidencia? </p>
	</div> 
	<div id="dialogErrorOperation" class="" style="display: none" align="" title="Eliminar incidencia" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Se ha producido un error al realizar la operacion! </p>
	</div> 
	<div id="dialogSuccessOperation"  style="display: none" align="" title="Eliminar incidencia" >
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
  
jQuery.ajax({
    url: '<c:url value="/loadAllCatAddIncidencia.htm" />',
    type: "GET",
    dataType: "json",
    contentType: "application/json",
    data:"", 
    success: function(resp){                                       

     var options = $("#stateIncidenciaSearch");
     $.each(resp.estadoI, function() {
	     options.append($("<option />").val(this.idestadoinc).text(this.descripcion));
 	 });
     var options = $("#typeIncidenciaSearch");
   	 $.each(resp.tipoI, function() {
   	     options.append($("<option />").val(this.idtipoincidencia).text(this.descripcion));
   	 });
   	 var options = $("#stateIncidencia");
     $.each(resp.estadoI, function() {
    	     options.append($("<option />").val(this.idestadoinc).text(this.descripcion));
     });
     var options = $("#typeIncidencia");
   	 $.each(resp.tipoI, function() {
   	     options.append($("<option />").val(this.idtipoincidencia).text(this.descripcion));
   	 });
     var options = $("#cancelVisitCause");
   	 $.each(resp.estadoV, function() {
   		 if (this.idestadovis>9){
   	     options.append($("<option />").val(this.idestadovis).text(this.descripcion));
   		 }
   	 });
    }
  });  
  
$("#updateIncidenciaBtn").click(function(){
	var clientData = jQuery.data(document.body,"clientData");
	var idInc = $("#idIncidenciaEdit").val();
	var incidenciaTypeId = $("#typeIncidencia option:selected").val();
	var incidenciaEstado = $("#stateIncidencia option:selected").val();
	//var fechaInicioNew = $("#fechaIncStart").val();
	var desc = $("#comentC").val();
	var causaOtra = $("#causaInc").val();

	var directionVisit = $("#directionVisit").val();
	var dateStart = $("#dateStart").val();
	var timeStart = $("#timeStart").val();
	var timeEnd = $("#timeEnd").val();


	var updatedIncidencia = {idincidencia:idInc,idtipoincidencia:incidenciaTypeId,idestadoinc:incidenciaEstado,idcliente:clientData.idcliente,descripcion:desc,
						 titulo:causaOtra};
	var newVisita;
	var canceledVisitData = jQuery.data(document.body,"visitCancelData");//,{"idEstadoV":idEstadoCancel,"contenctCancel":contentCancel,"idVisit":idVisit});
	if (canceledVisitData!=null){
		 newVisita = {descripcion:canceledVisitData.contenctCancel,idvisita:canceledVisitData.idVisit,estadoId:canceledVisitData.idEstadoV};
	}
	else{
	 newVisita = {clienteId:clientData.idcliente,titulo:"Mantenimiento",descripcion:"",fechaInicia:dateStart,fechaTermina:dateStart,horaInicia:timeStart,
					 horaTermina:timeEnd,direccion:directionVisit,estadoId:"0"};
	}
	
	jQuery.ajax({
        url: '<c:url value="/updateIncidencia.htm" />',
        type: "POST",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify( {'incidencia':updatedIncidencia,'visita':newVisita} ), 
        success: function(resp){     
				if (resp!=-1){
	           		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Editar Incidencia" );
           		    jQuery("#dialogSuccessOperation").dialog("open");
				}
				else{
	           		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Editar Incidencia" );
					jQuery("#dialogErrorOperation").dialog("open");	
				}
         }
      });
       
});

jQuery("#searchButton").click(function(){
	 var client = jQuery.data(document.body,"clientData");
	 var cId="";
	 if (client!=null){
		 cId = client.idcliente;
	 }
	 var iniD = jQuery("#fechaDesde").val();
	 var tipoI = jQuery("#typeIncidencia option:selected").val();
	 if (tipoI==-1){
		 tipoI = "";
	 }
	 var estadoI = jQuery("#stateIncidencia option:selected").val(); 
	 if (estadoI==-1){
		 estadoI = "";
	 }
	 
      jQuery("#listIncidenciaTable").jqGrid('setGridParam',{url:"<c:url value="/searchIncidenciaList.htm" />?cId="+cId+"&iniD="+iniD+"&tipoI="+tipoI+"&estadoI="+estadoI,page:1}).trigger('reloadGrid');
});

jQuery("#clearSearchButton").click(function(){
	 cleanScreenSearch();
	 cancelEdit();
});

jQuery("#cancelVisitDialog").click(function(){
	$("#dialogCancelVisita").dialog("open");
	
});




jQuery("#listIncidenciaTable").jqGrid({
	 url: '<c:url value="/searchIncidenciaList.htm"/>',
	 datatype: "json", 
	 width : 1158,
	 height : 200,
	 colNames : ['Operación','','','Tipo','','Estado','','Cliente','Fecha Inicio', 'Fecha Cierra','Descripcion','Otra info', ''],
		colModel : [ 
		        	{name: 'myac',
						 width:77, 
						 fixed:true, 
						 sortable:false, 
						 resize:false, 
							search: false,
							formatter:function(){
								return "<div style='margin-left: 7px;'>"+
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;margin-left: 4px;margin-right: 4px;" title="Modificar fila seleccionada"><span op="edit" class="ui-icon ui-icon-pencil"></span></div>'+											
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Eliminar fila seleccionada"><span op="delete" class="ui-icon ui-icon-trash"></span></div>'+											
								"</div>";
								}

					},
		{
			name : 'idincidencia',
			index : 'idincidencia',
			width : 1,
			hidden:true					
		},
		{
			name : 'idtipoincidencia',
			index : 'idtipoincidencia',
			width : 1,
			hidden:true		
		}
		, {
			name : 'descripcionTipoIncidencia',
			index : 'descripcionTipoIncidencia',
			align: 'center',
			width : 90
		}, {
			name : 'idestadoinc',
			index : 'idestadoinc',
			width : 1,
			hidden:true
		}, {
			name : 'descripcionEstadoIncidencia',
			index : 'descripcionEstadoIncidencia',
			align: 'center',
			width : 75
		}, {
			name : 'idcliente',
			index : 'idcliente',
			align: 'center',
			width : 1,
			hidden:true
		}, {
			name : 'clienteNombre',
			index : 'clienteNombre',
			align: 'center',
			width : 150
		},{
			name : 'fechaInicio',
			index : 'fechaInicio',
			align: 'center',
			width : 70
		},{
			name : 'fechaCierre',
			index : 'fechaCierre',
			align: 'center',
			width : 70
		}, {
			name : 'descripcion',
			index : 'descripcion',
			align: 'center',
			width : 100
		}, {
			name : 'titulo',
			index : 'titulo',
			align: 'center',
			width : 100
		},
		{
			name : 'dummy',
			index : 'dummy',
			align: 'center',
			width : 1,
			hidden:true,
			editable:true
		}],
		ondblClickRow: function(id ){},
	  rowNum:10, 
	  rowList:[10,20,30],
	  multiselect: false,
	  sortable: true,
	  pager: '#listIncidenciaTableGrid',
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
     beforeSelectRow: function(rowid, e) {
			 var iCol = jQuery.jgrid.getCellIndex(e.target);
			 if(iCol == 1){
			 	if(e.target.attributes.op.value=="edit"){		 		
					 var row = jQuery('#listIncidenciaTable').jqGrid('getRowData',rowid);										 
					 updateIncidencia(row);		
		             return false;
		            }
			 	if(e.target.attributes.op.value=="delete"){
			 		 var idIncidencia = jQuery('#listIncidenciaTable').jqGrid('getCell',rowid,"idincidencia");
			 		 jQuery.data(document.body,"incidenciaID",{"idIncidencia":idIncidencia});
			 		 jQuery("#dialogDeleteIncidencia" ).dialog("open");
			 		 //delClient(idCliente);
			 		return false;
		            }
			 	}
		       //return true;    // allow select the row
            //  return false;   // not allow select the row
			 // prevent row selection if one click on the button
			 return (iCol != 1)? true: false;
         
     },
	  onSelectRow:function(){//alert("asdasd")
		  },
	  viewrecords: true, 
	  sortorder: "desc", 
	  caption:'Incidencias', 
	  editurl: "dummy.htm"
	  });

$("#gview_listIncidenciaTable").css("font-size","12px");


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


jQuery("#dialogDeleteIncidencia").dialog({
	autoOpen: false,
	height: 170,
	modal:true,
	buttons: {
		"Ok": function() {
			delIncidencia();
			jQuery( this ).dialog( "close" );
		},
		"Cancelar": function() {
			jQuery( this ).dialog( "close" );
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
	}
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


jQuery("#dialogCancelVisita").dialog({
	autoOpen: false,
	modal:true,
	buttons: {
		"Cancelar": function() {
			jQuery( this ).dialog( "close" );
		},
		"Ok": function() {
			$("#cancelVisitDialog").hide();
	    	$("#openVisitDialogChange").hide();	    	
	    	$("#openVisitDialog").show();
			$("#fechaVisita").val("");
			var idEstadoCancel = $("#cancelVisitCause option:selected").val();
			var contentCancel = $("#contentCancel").val();
			var idVisit = jQuery.data(document.body,"visitData").idvisita;
			jQuery.data(document.body,"visitCancelData",{"idEstadoV":idEstadoCancel,"contenctCancel":contentCancel,"idVisit":idVisit});
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
			 jQuery("#listIncidenciaTable").trigger('reloadGrid');
			 cancelEdit();
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
	}
});	 

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
	},
	open: function() {
	},
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


$("#openVisitDialogChange").click(function(){
	var visit = jQuery.data(document.body,"visitData", resp);

	jQuery("#directionVisit").val(visit.direccion);
	//jQuery(".fc-header-right span:eq(1)").click();
	jQuery("#dialogCalendarVisit").dialog("open");
	jQuery(".fc-header-left span:eq(3)").click();
	jQuery(".fc-header-left span:eq(2)").click();
});


//calendar config 
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

jQuery("input[alt=dateP]").datepicker({
	 showButtonPanel: true,
	 dateFormat: "dd/mm/yy",
	 showOn: "button",
	 buttonImage: "css/images/calendar.gif",
	 buttonImageOnly: true,
	 dayNames: [ "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" ],
	 dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
	 monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ], 
	 altField: "#actualDate" ,
	 closeText: "Cerrar", 
	 currentText: "Hoy"
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
			         'color':visit.estadoId=='100'?"red":""
			         };    
        		sourceVisits.push(source);
        	});
        	
	  		$('#calendar').fullCalendar( 'addEventSource', sourceVisits );
        }
      });
}

function updateIncidencia(row){
	$("#fechaVisita").val("");
	if (row.idtipoincidencia==1){
		loadVisita(row.idincidencia);
	}
	
	jQuery('#listIncidenciaTable').jqGrid('setGridState','hidden');	
	
	jQuery("#nombreC").val(capitaliseFirstLetter(row.clienteNombre));
	
	//var clientData = jQuery.data(document.body,"clientData");
	$("#typeIncidencia").val(row.idtipoincidencia).change();
	$("#stateIncidencia").val(row.idestadoinc);
	$("#fechaIncStart").val(row.fechaInicio);
	$("#comentC").val(row.descripcion);
	$("#causaInc").val(row.titulo);

	//$("#directionVisit").val();
	//$("#dateStart").val();
    //$("#timeStart").val();
	//$("#timeEnd").val();

// 	jQuery("#comentC").val(row.notas);
// 	jQuery("#ccC").val(row.ccNro);
// 	jQuery("#cuitC").val(row.cuit);
	
// 	jQuery("#clientState").val(row.estadoCliId);

 	jQuery("#idIncidenciaEdit").val(row.idincidencia);
	loadClientData(row.idcliente);
	jQuery(".editIncidenciatDiv").show();
	jQuery.data(document.body,"visitCancelData",null);
	}
function loadVisita(idInc){
	
	jQuery.ajax({
	    url: '<c:url value="/loadVisitByIncId.htm" />',
	    type: "GET",
	    dataType: "json",
	    contentType: "application/json",
	    data:{"iId":idInc}, 
	    success: function(resp){
	    	$("#visitDiv > button").hide();
	    	if(resp.idvisita==null){
	    		$("#openVisitDialog").show();
	    	}
	       else{
	    	   $("#openVisitDialogChange").show();
	    	   $("#cancelVisitDialog").show();
	           $("#fechaVisita").val(resp.fechaInicia);
				jQuery.data(document.body,"visitData", resp);
	        }
	    }
	  });
}	

function loadClientData(idCliente){
	
	jQuery.ajax({
	    url: '<c:url value="/loadClientById.htm" />',
	    type: "GET",
	    dataType: "json",
	    contentType: "application/json",
	    data:{"idClient":idCliente}, 
	    success: function(resp){
	    	 jQuery.data(document.body,"clientData",resp);
	    }
	  });
}	

function delIncidencia(){
	      var data =  jQuery.data(document.body,"incidenciaID");

		   jQuery.ajax({
		          url: '<c:url value="/delIncidencia.htm" />',
		          type: "GET",
		          dataType: "json",
		          contentType: "application/json",
		          data: {idInc:data.idIncidencia}, 
		          success: function(resp){     
	            	 if(resp){
	               		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Eliminar incidencia" );
	            		 jQuery("#dialogSuccessOperation").dialog("open");

		          	  }
	            	 else{
	            		 jQuery("#dialogErrorOperation").dialog("open");
	            		 }
	            	 }
		        });	 

}

function cleanScreenSearch(){
	 jQuery("#nombreSearch").val("");
		 jQuery("#typeIncidencia").val(-1);		 
		 jQuery("#stateIncidencia").val(-1);
		 jQuery("#fechaDesde").val("");
		 jQuery("#nombreSearch").focus();
		 jQuery.data(document.body,"clientData",null);

}
function cleanScreenEdit(){
	 //jQuery(".editClientDiv").hide();			 
	$("#nombreSearch").val("");
	$("#fechaVisita").val("");
	$("#comentC").val("");
	$("#causaInc").val("");
	 jQuery("#nombreSearch").focus();
	 jQuery("#listIncidenciaTable").trigger('reloadGrid');

}
function cancelEdit(){
	jQuery("div .ui-inline-cancel").trigger("click");
	jQuery(".editIncidenciatDiv").hide();
	jQuery('#listIncidenciaTable').jqGrid('setGridState','visible');	
	cleanScreenEdit();
}	

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script> 

  </body>
</html>
