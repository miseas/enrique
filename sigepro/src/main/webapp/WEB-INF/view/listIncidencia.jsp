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
		    <a href="#">Buscar Incidencia</a>
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
						<select id="typeIncidencia" name="typeIncidencia" class="span10">
						<option value="-1">Todos</option>
						<option value="1">Mantenimiento</option>
						<option value="2">Otra</option>
				</select>
				</div>
				<div class="span2">    
					<label for="apellidoC"><strong>Estado Incidecia</strong></label>
						<select id="stateIncidencia" name="stateIncidencia" class="span10">
						<option value="-1">Todos</option>
						<option value="0">Sin iniciar</option>
						<option value="1">Iniciada</option>
						<option value="2">Cerrada</option>
						<option value="3">Reabierta</option>
						<option value="4">Pausada</option>
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
	  						 <table style="text-align: center;font-size: 16px" align="center" id="listClientTable">
	             			 </table>	
	             		<div id="listClientTableGrid"></div>
              		</div>
		  </div>
     <div class="editClientDiv" style="display: none;">
     <div class="row-fluid">
			<br>
			<div class="bs-docs-example">
 	  		 <form id="editClientForm" action="" method="post">
 	  		 <input type="hidden" class="" id="idClientEdit" name="idClientEdit" /> 
	         <div class="row-fluid">
	        	<div class="span4">    
					<label for="nombreC"><strong>Nombre</strong></label>
						<input type="text" class="" id="nombreC" name="nombreC" />
					<label for="apellidoC"><strong>Apellido</strong></label>
						<input type="text" class="" id="apellidoC" name="apellidoC" />
					<label for="direccionC"><strong>Dirección</strong></label>
						<input type="text" class="span12" id="direccionC" name="direccionC" />
				</div>
				<div class="span4">    
					<label for="localidadC"><strong>Localidad</strong></label>
					<div class="input-prepend">
						<span class="add-on"><i class="icon-map-marker"></i></span>
<!-- 						<input type="text" class="" id="localidadC" name="localidadC" /> -->
						<select id="localidadC" name="localidadC">
						</select>
					</div>
					<label for="emailC"><strong>Correo electrónico</strong></label>
					 <div class="input-prepend">
					 <span class="add-on"><i class="icon-envelope"></i></span>
						<input type="text" class="" id="emailC" name="emailC" />
						</div>
				 <div id="phone-container">
					<div class="" id="phone-form" >
					<label for="telC"><strong>Teléfono</strong></label>
						<div class="form-search input-prepend">
						<span class="add-on">#</span>
						<input type="text" class="" id="telC-1" name="telC" /><button type="button" style="display: none" id="removeBtn" class="btn btn-mini btn-danger"><i class="icon-remove icon-white"></i></button>
						</div>   
						<span id="helpB" class="help-block"><a id="addNumberBtn" class="btn btn-mini btn-info" ><i class="icon-plus icon-white"></i> Agregar otro Nro de Teléfono</a></span>
					</div>
					</div> 
				</div>	
				<div class="span4">		 
				   <div class="row-fluid">
				     <div class="span4">
				     <label for="typeId"><strong>Tipo ID</strong></label>
						<select id="typeId" name="typeId" class="span10">
						</select>
					</div>	
				    <div class="span5">
					<label for="cuitC"><strong>Número Documento</strong></label>
						<input type="text" class="" id="cuitC" name="cuitC" />
					</div>	
					</div>	
					<label for="clientState"><strong>Estado</strong></label>
						<select id="clientState"  name="clientState">
						</select>
		            <label for="clientNum"><strong>Número Cliente</strong></label>
						<input type="text" class="" id="clientNum" name="clientNum" />
				</div>	
				</div>		
				<div class="row-fluid">	 
					<div class="span7">							 
						<label for="comentC"><strong>Comentario</strong></label>
					  		<textarea name="comentC" id="comentC" rows="3" class="input-block-level"></textarea>
					</div>
				</div>
				<div class="row-fluid">	 
				<div class="pull-right">			
		               <button type="button" onclick="jQuery('#editClientForm').submit()" class="btn btn-primary">Guardar</button>
		               <button type="button" onclick="cancelEdit();" class="btn" >Cancelar</button>	
				</div>
				</div>

        </form>
        </div>
		  </div>
	</div>	
      </div>
      </div>
      <hr>

    </div><!--/.fluid-container-->
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
  
jQuery("#editClientForm").validate({
		focusInvalid:false,
	    rules: {
	    	nombreC:{required: true},
			apellidoC:{required: true},
			emailC:{email:true},
			cuitC:{digits:true}
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
  		var puntuaNew = 1;
  		var comentNew = jQuery("#comentC").val();
  		var clientStateID = jQuery("#clientState").val();
  		var idClient = jQuery("#idClientEdit").val();
  		var clientNum = jQuery("#clientNum").val();
  		var typeId = jQuery("#typeId").val();

  		var newClient = {'idcliente':idClient,'nombre':nombreNew,'apellido':apellidoNew,'direccion':direccionNew,"iddnitipo":typeId,
  					    'localidadId':localidadNew,'email':emailNew,'telefono':telNew+"@@"+telNew2+"@@"+telNew3,
  						'notas':comentNew,'estadoCliId':clientStateID,'puntuacion':puntuaNew, 'cuit':cuitNew,'numerocli':clientNum};		  		 
  		 
        jQuery.ajax({
             url: '<c:url value="/editClient.htm" />',
             type: "POST",
             dataType: "json",
             contentType: "application/json",
             data: JSON.stringify( newClient ), 
             success: function(resp){                                       
              	 if(resp!=-1){ 
              		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Editar incidencia" );
            		 jQuery("#dialogSuccessOperation").dialog("open");
            		 cancelEdit();
         	 	}
         	 	else{
           		 jQuery("#dialogErrorOperation").dialog("open");
         	 	}     
             }
           });
  		
  	}
	         
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
	 
      jQuery("#listClientTable").jqGrid('setGridParam',{url:"<c:url value="/searchIncidenciaList.htm" />?cId="+cId+"&iniD="+iniD+"&tipoI="+tipoI+"&estadoI="+estadoI,page:1}).trigger('reloadGrid');
});

jQuery("#clearSearchButton").click(function(){
	 cleanScreenSearch();
	 cancelEdit();
});



jQuery("#listClientTable").jqGrid({
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
     beforeSelectRow: function(rowid, e) {
			 var iCol = jQuery.jgrid.getCellIndex(e.target);
			 if(iCol == 2){
 			 	if(e.target.attributes.op.value=="email"){		 
					 var row = jQuery('#listClientTable').jqGrid('getRowData',rowid);	
					 if (row.email=="" || row.email==null){
							row.email="(Cliente sin email)";
					}
					 jQuery("#toEmail").val(row.email);
 	        	     jQuery("#dialogSendEmail" ).dialog("open");
		              return false;
		            }
			 	if(e.target.attributes.op.value=="edit"){		 		
					 var row = jQuery('#listClientTable').jqGrid('getRowData',rowid);										 
					 updateClient(row);		
		             return false;
		            }
			 	if(e.target.attributes.op.value=="delete"){
			 		 var idIncidencia = jQuery('#listClientTable').jqGrid('getCell',rowid,"idincidencia");
			 		 jQuery.data(document.body,"incidenciaID",{"idIncidencia":idIncidencia});
			 		 jQuery("#dialogDeleteIncidencia" ).dialog("open");
			 		 //delClient(idCliente);
			 		return false;
		            }
			 	}
		       //return true;    // allow select the row
            //  return false;   // not allow select the row
			 // prevent row selection if one click on the button
			 return (iCol != 2)? true: false;
         
     },
	  onSelectRow:function(){//alert("asdasd")
		  },
	  viewrecords: true, 
	  sortorder: "desc", 
	  caption:'Incidencias', 
	  editurl: "dummy.htm"
	  });

$("#gview_listClientTable").css("font-size","12px");




jQuery("#dialogSendEmail").dialog({
	autoOpen: false,
	width: 550,
	modal:true,
	buttons: {
		"Cerrar": function() {
			jQuery( this ).dialog( "close" );
		},
		"Enviar": function() {
			jQuery(".ui-dialog-buttonset button").hide();
			jQuery(".ui-dialog-buttonset").append("<div class='ui-loadingBar' style='width: 260px; height: 40px;'></div>");
			var toEmail = jQuery("#toEmail").val();
			var subjectEmail = jQuery("#subjectEmail").val();
			var contentEmail = jQuery("#contentEmail").val();
			var emailData = {"toEmail":toEmail.split(";"),"subject":subjectEmail,"content":contentEmail};
			
	         jQuery.ajax({
                 url: '<c:url value="/sendEmailClient.htm" />',
                 type: "POST",
                 dataType: "json",
                 contentType: "application/json",
                 data: JSON.stringify( emailData ), 
                 success: function(resp){                                       
                			jSuccess("Operacion realizada exitosamente", "Enviar Email",function(){
                				jQuery("#dialogSendEmail").dialog( "close" );
                				jQuery(".ui-dialog-buttonset div").hide();
        						jQuery(".ui-dialog-buttonset button").show();
                			},["Aceptar"]);
                	                                
                 }
               });
		}
	},
	resizable: false,
	draggable: false,
	close: function() {
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

jQuery("#dialogSuccessOperation").dialog({
	autoOpen: false,
	height: 170,
	modal:true,
	buttons: {
		"Ok": function() {
			jQuery( this ).dialog( "close" );
			 jQuery("#listClientTable").trigger('reloadGrid');
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

});
//Other functions

function updateClient(row){
	jQuery('#listClientTable').jqGrid('setGridState','hidden');	
	
	jQuery("#nombreC").val(capitaliseFirstLetter(row.nombre));
	jQuery("#apellidoC").val(capitaliseFirstLetter(row.apellido));
	jQuery("#direccionC").val(row.direccion);
	jQuery("#localidadC").val(row.localidadId);
	jQuery("#emailC").val(row.email);
	jQuery("#telC-1").val(row.telefono);
	if(row.telefono2.length>1){
		jQuery("#addNumberBtn").trigger("click");
		jQuery("#telC-2").val(row.telefono2);
	}
	if(row.telefono3.length>1){
		jQuery("#addNumberBtn").trigger("click");
		jQuery("#telC-3").val(row.telefono3);
	}
	jQuery("#comentC").val(row.notas);
	jQuery("#ccC").val(row.ccNro);
	jQuery("#cuitC").val(row.cuit);
	
	jQuery("#clientState").val(row.estadoCliId);
	jQuery("#typeId").val(row.iddnitipo);
	jQuery("#clientNum").val(row.numerocli);

	jQuery("#idClientEdit").val(row.idcliente);
	jQuery(".editClientDiv").show();
		
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
	 jQuery(".editClientDiv").hide();			 
     jQuery("#nombreC").val("");
 	 jQuery("#apellidoC").val("");
	 jQuery("#direccionC").val("");
	 jQuery("#localidadC").val(0);
	 jQuery("#emailC").val("");
	 jQuery("#telC-1").val("");
	 jQuery("#phone-form-1").remove();
	 jQuery("#phone-form-2").remove();
	 jQuery("#cuitC").val("");
	 jQuery("#comentC").val("");
	 jQuery("#nombreC").focus();
	 jQuery("#listClientTable").trigger('reloadGrid');

}
function cancelEdit(){
	jQuery("div .ui-inline-cancel").trigger("click");
	jQuery(".editClientDiv").hide();
	jQuery('#listClientTable').jqGrid('setGridState','visible');	
	cleanScreenEdit();
}	

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script> 

  </body>
</html>
