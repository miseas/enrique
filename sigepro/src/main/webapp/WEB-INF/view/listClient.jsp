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
              <li class=" active dropdown">
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
		    <a href="#">Buscar Cliente</a>
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
					<label for="nombreSearch"><strong>Nombre</strong></label>
						<input type="text" class="" id="nombreSearch" name="nombreSearch" />
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
           <hr>
     <div class="row-fluid">
     <div class="span12 thumbnail">
		  <div class="row-fluid">
<!-- 		  Tabla -->
		     		<div style="" align="center">
			    		<div style="height: 1px" ></div>
	  						 <table style="text-align: center;font-size: 18px" align="center" id="listClientTable">
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
   	 var options = $("#typeId");
   	 $.each(resp.typeID, function() {
   	     options.append($("<option />").val(this.iddnitipo).text(this.descripcion));
   	 });
   	 var options = $("#clientState");
   	 $.each(resp.estadoCli, function() {
   	     options.append($("<option />").val(this.idestadocli).text(this.descripcion));
   	 });
    }
  });
  
jQuery("#editClientForm").validate({
		focusInvalid:false,
	    rules: {
	    	nombreC:{required: true},
			emailC:{email:true},
			cuitC:{digits:true}
        },
	    messages: {
	    	nombreC: {required: "campo obligatorio"},
	    	emailC:{email:"email incorrecto"},
	    	cuitC:{digits:"campo numerico"}
	    },
  	submitHandler: function() { 	  	
  		var nombreNew = jQuery("#nombreC").val();
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

  		var newClient = {'idcliente':idClient,'nombre':nombreNew,'direccion':direccionNew,"iddnitipo":typeId,
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
              		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Editar cliente" );
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
	 var name = jQuery("#nombreSearch").val();
// 	 var lastName = jQuery("#apellidoSearch").val();
	 var cuit = jQuery("#cuitSearch").val();
	 var score = "";
      jQuery("#listClientTable").jqGrid('setGridParam',{url:"<c:url value="/loadListClientsByParameter.htm" />?name="+name+"&lastName="+lastName+"&cuit="+cuit+"&score="+score,page:1}).trigger('reloadGrid');
});

jQuery("#clearSearchButton").click(function(){
	 cleanScreenSearch();
	 cancelEdit();
});


jQuery("#listClientTable").jqGrid({
	 url: '<c:url value="/loadlistClients.htm"/>',
	 datatype: "json", 
	 width : 1158,
	 height : 200,
	 colNames : ['Operación','','<fmt:message key="message.cli.nombre"/>',
	             '<fmt:message key="message.cli.direc"/>', '<fmt:message key="message.cli.localidad"/>','','','','','','CUIT/DNI','','','','','','' ],
		colModel : [ 
		        	{name: 'myac',
						 width:77, 
						 fixed:true, 
						 sortable:false, 
						 resize:false, 
							search: false,
							formatter:function(){
								return "<div style='margin-left: 7px;'>"+
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Enviar mail a..."><span op="email" class="ui-icon ui-icon-mail-closed"></span></div>'+											
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;margin-left: 4px;margin-right: 4px;" title="Modificar fila seleccionada"><span op="edit" class="ui-icon ui-icon-pencil"></span></div>'+											
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Eliminar fila seleccionada"><span op="delete" class="ui-icon ui-icon-trash"></span></div>'+											
								"</div>";
								}

					},
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
			width : 250
		},
		 {
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
			width : 100
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
		ondblClickRow: function(id ){},
	  rowNum:10, 
	  rowList:[10,20,30],
	  multiselect: true,
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
			 		 var idCliente = jQuery('#listClientTable').jqGrid('getCell',rowid,"idcliente");
			 		 jQuery.data(document.body,"clientData",{"idcliente":idCliente});
			 		 jQuery("#dialogDeleteClient" ).dialog("open");
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
	  caption:'<fmt:message key="message.cli.titulo"/>', 
	  editurl: "dummy.htm"
	  });

$("#gview_listClientTable").css("font-size","14px");




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

jQuery("#dialogDeleteClient").dialog({
	autoOpen: false,
	height: 170,
	modal:true,
	buttons: {
		"Ok": function() {
			delClient();
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

// jQuery("#apellidoSearch" ).autocomplete({
// 	source: function( request, response ) {
// 		$.ajax({
// 			url: '<c:url value="/searchClientByName.htm" />',
// 			dataType: "json",
// 			type: "POST",
// 			data: {
// 				featureClass: "P",
// 				style: "full",
// 				maxRows: 12,
// 				nameStartWith: request.term
// 			},
// 			success: function( data ) {
// 				response( jQuery.map( data, function (elementOfArray, indexInArray){							
// 					return  { value:capitaliseFirstLetter(elementOfArray.apellido)};											
// 				}));						
// 			}
// 		});
// 	},
// 	minLength: 1,
// 	select: function(event, ui){
// 	},
// 	open: function() {
// 	},
// 	close: function() {
// 	}
// });


$("#addNumberBtn").click(function(){
	var idLastNum = jQuery('#phone-container input').last().attr("id");
	var counter = parseInt(idLastNum.split("-")[1]);
	var phoneForm = jQuery('#phone-form').clone(true);
	if (counter==1){
		jQuery('#helpB').hide();
	}else{
		$("#phone-form-"+(counter-1)).find('#helpB').hide();
		$("#phone-form-"+(counter-1)).find("#removeBtn").hide();
		if (counter<2){
			phoneForm.find('#helpB').show();
		}
	}
	phoneForm.find("label").html("<strong>"+phoneForm.find("label").text()+" "+(counter+1)+"</strong>");
	phoneForm.find("#removeBtn").show();
	phoneForm.find("input").attr("id","telC-"+(counter+1)).val("");
	phoneForm.attr("id","phone-form-"+counter);
	phoneForm.insertAfter('#phone-container div:last-child');
});

$("#removeBtn").click(function(){
	var idSelecNum = $(this).prev().attr("id");
	var counter = parseInt(idSelecNum.split("-")[1]);
	jQuery('#phone-form-'+(counter-1)).remove();		
	jQuery('#phone-container div:last-child').find('#helpB').show();
	$("#phone-form-"+(counter-2)).find("#removeBtn").show();
});

});
//Other functions

function updateClient(row){
	jQuery('#listClientTable').jqGrid('setGridState','hidden');	
	
	jQuery("#nombreC").val(capitaliseFirstLetter(row.nombre));
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
function delClient(){
	      var clientObj = jQuery.data(document.body,"clientData");
		   jQuery.ajax({
		          url: '<c:url value="/delClient.htm" />',
		          type: "GET",
		          dataType: "json",
		          contentType: "application/json",
		          data: {idClient:clientObj.idcliente}, 
		          success: function(resp){     
	            	 if(resp){
	               		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Eliminar cliente" );
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
		 jQuery("#cuitSearch").val("");		 
		 jQuery("#localidadSearch").val("");
		 jQuery("#nombreSearch").focus();
}
function cleanScreenEdit(){
	 jQuery(".editClientDiv").hide();			 
     jQuery("#nombreC").val("");
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
