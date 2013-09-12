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
	    content: "Asignar Abono";
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
                  <li class=""><a href="historialIncidencia.htm">Historial</a></li>
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
					<label for="apellidoSearch"><strong>Apellido</strong></label>
						<input type="text" class="" id="apellidoSearch" name="apellidoSearch" />
				</div>
				<div class="span3">    
					<label for="localidadC"><strong>Localidad</strong></label>
						<input type="text" class="" id="localidadSearch" name="localidadSearch" />
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
<!--            <hr> -->
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
		  </div><!-- end row -->
         <div class="assignClientAbonoDiv" style="display: none;">
	    <div class="bs-docs-example">
	     <div class="row-fluid">
		     <div class="span4">
				<div style="" align="center">
					    		<div style="height: 1px" ></div>
			  						 <table style="text-align: center" align="center" id="listAbonoTable">
			             			 </table>	
			             		<div id="listAbonoTableGrid"></div>
		        </div>
			 </div>
			  <div class="span8">
			  
			   <div class="row-fluid" id="baseClient" style="margin-bottom: 10px;">
			   <div class="span12">
				<div class="tableContainer" align="center">
		        </div>
		        </div>
		       </div>
		       
			 </div>
			</div> 
		</div><!-- end row -->
        </div>
      </div>
      <hr>

    </div><!--/.fluid-container-->
  <div id="footer" >
      <div class="container">
        <p class="muted credit">Creada por <a href="#">[Matias Iseas]</a>.</p>
      </div>
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
	<div id="dialogAsignAbono"  style="display: none" align="" title="Asignar Abono" >
	 <div class="row-fluid">
	        	<div class="span12">    
	        	<div class="row-fluid">
		        	<div class="span6">
						<label for="fechaAlta"><strong>Fecha Alta</strong></label>
							<input type="text" alt="dateP" id="fechaAlta" name="fechaAlta" style="width: 100px" />
					</div>	
					<div class="span6">
						<label for="clientState"><strong>Estado</strong></label>
							<select id="clientState">
							</select>
					</div>		
				</div>
				<div class="row-fluid">
						<div class="span12">
					<label for="noteNewAbono"><strong>Nota</strong></label>
					  <textarea name="noteNewAbono" id="noteNewAbono" rows="3" class="input-block-level"></textarea>
					 </div> 
				</div>		
				</div>
	 </div>	
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
//      var options = $("#localidadCSearch");
//      $.each(resp.localidades, function() {
//     	     options.append($("<option />").val(this.idlocalidad).text(this.descripcion));
//      });   	 
//      var options = $("#localidadC");
//    	 $.each(resp.localidades, function() {
//    	     options.append($("<option />").val(this.idlocalidad).text(this.descripcion));
//    	 });
//    	 var options = $("#typeId");
//    	 $.each(resp.typeID, function() {
//    	     options.append($("<option />").val(this.iddnitipo).text(this.descripcion));
//    	 });
   	 var options = $("#clientState");
   	 $.each(resp.estadoCli, function() {
   	     options.append($("<option />").val(this.idestadocli).text(this.descripcion));
   	 });
    }
  });
  
  

jQuery("#searchButton").click(function(){
	 var name = jQuery("#nombreSearch").val();
	 var lastName = jQuery("#apellidoSearch").val();
	 var cuit = jQuery("#cuitSearch").val();
	 var score = "";
     jQuery("#listClientTable").jqGrid('setGridParam',{url:"<c:url value="/loadListClientsByParameter.htm" />?name="+name+"&lastName="+lastName+"&cuit="+cuit+"&score="+score,page:1}).trigger('reloadGrid');
});

jQuery("#clearSearchButton").click(function(){
	 cleanScreenSearch();
	 cancelAsignAbonos();
});


jQuery("#listClientTable").jqGrid({
	 url: '<c:url value="/loadlistClients.htm"/>',
	 datatype: "json", 
	 width : 1158,
	 height : 200,
	 colNames : ['','<fmt:message key="message.cli.nombre"/>',  '<fmt:message key="message.cli.apellido"/>',
	             '<fmt:message key="message.cli.direc"/>', '<fmt:message key="message.cli.localidad"/>','','','','CUIT/DNI','','','','' ],
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
			width : 180
		}
		, {
			name : 'apellido',
			index : 'apellido',
			align: 'center',
			width : 180
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
			width : 100
		}, {
			name : 'ccNro',
			index : 'ccNro',
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
	  rownumbers : false,
	  rowList: {},
	  jsonReader : {
         root: "rows",
         page: "page",
         total: "total",
         records: "records",
         repeatitems: false,
         id: "idcliente"
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
	  
jQuery("#listClientTable").jqGrid('navGrid','#listClientTableGrid',{
	add : false,
	refresh : false,
	edit : false,
	del : false,
	search:false
},{}).navButtonAdd('#listClientTableGrid',{
	   caption:'Asignar Abono', 
	   buttonicon:"icon-exchange icon-large", 
	   onClickButton: function(){ 			   
		   var selected = jQuery("#listClientTable").jqGrid('getGridParam','selarrrow');
		   if (selected.length>=1){
				jQuery('#listClientTable').jqGrid('setGridState','hidden');	
				jQuery('.assignClientAbonoDiv').show();
				var tableNames=" ";
				jQuery.each(selected, function(num,id){
					var baseClient = jQuery('#baseClient').clone(true);
					baseClient.attr("id","baseClient-"+id);
					baseClient.insertAfter('#baseClient');
					baseClient.find(".tableContainer").html("<table id='tableClient"+id+"' class='scroll'></table><div id='tableClientPager"+id+"' class='scroll'></div>");
					var row = jQuery('#listClientTable').jqGrid('getRowData',id);
					createJqGridClient(id,row);
					baseClient.show();
					tableNames = tableNames+",#tableClient"+id;
				});
				jQuery("#listAbonoTable").jqGrid('gridDnD',{connectWith:tableNames,dropbyname:true,ondrop:function(event,object,data){createDialogAsign(event,object,data);}});
				jQuery('#baseClient').hide();
		   }
		   else{
			   alert("Selecciona antes!");   
		   }
		  	
	   }, 
	   position:"first"
	});	  

$("#gview_listClientTable").css("font-size","12px");
$(".icon-exchange").removeClass("ui-icon");
$(".icon-exchange").parent().css("font-size","12px");

jQuery("#listAbonoTable").jqGrid({
	 url: '<c:url value="/loadlistAbonos.htm"/>',
	 datatype: "json", 
	 width : 400,
	 height : 200,
	 colNames : ['','Nombre','Vel. Bajada (kbps)','Vel. Subida (kbps)','Precio','','' ],
		colModel : [ 
		{
			name : 'idabono',
			index : 'idabono',
			width : 1,
			hidden:true					
		},
		{
			name : 'nombre',
			index : 'nombre',
			align: 'center',
			width : 180
		}
		, {
			name : 'maxbajada',
			index : 'maxbajada',
			align: 'center',
			width : 180
		}, {
			name : 'maxsubida',
			index : 'maxsubida',
			align: 'center',
			width : 200
		}, {
			name : 'precio',
			index : 'precio',
			align: 'center',
			formatter:'currency',
			formatoptions:{prefix:"$"},
			width : 100
		}, {
			name : 'descripcion',
			index : 'descripcion',
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
// 	  multiselect: true,
	  sortable: true,
	  pager: '#listAbonoTableGrid',
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
			 	if(e.target.attributes.op.value=="edit"){		 		
					 var row = jQuery('#listAbonoTable').jqGrid('getRowData',rowid);										 
					 updateAbono(row);		
		             return false;
		            }
			 	if(e.target.attributes.op.value=="delete"){
			 		 var idabono = jQuery('#listAbonoTable').jqGrid('getCell',rowid,"idabono");
			 		 jQuery.data(document.body,"clientData",{"idabono":idabono});
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
	  caption:'Abonos', 
	  editurl: "dummy.htm"
	  });


function createJqGridClient(id,row){
	 jQuery("#tableClient"+id).jqGrid({ 
		   url:'<c:url value="/listClientAbonos.htm"/>?idC='+id, 
		   caption:row.nombre+" "+row.apellido, 
		   datatype: "local", 
		   afterInsertRow:function(rowid){ jQuery.data(document.body,"rowIdAbonoAdded",rowid);},
		   colNames: ['','Abono','Fecha Alta','Fecha Baja','Nota','Operación'], 
		   colModel: [ 	{name : 'idabono',index : 'idabono', key:true, width: 1,hidden:true},
		             {name:"nombre",index:"nombre",width:100,editable:true}, 
		             {name:"fechaAlta",index:"fechaAlta",align:"center",width:100,editable:true}, 
		             {name:"fechaBaja",index:"fechaBaja",width:100,align:"center",editable:true},
		             {name:"descripcion",index:"descripcion",width:250,align:"center",editable:true},
			         {name: 'operacion',
						 width:67, 
						 fixed:true, 
						 sortable:false, 
						 resize:false, 
						 search: false,
						 formatter:function(){
								return "<div style='margin-left: 7px;'>"+
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;margin-left: 4px;margin-right: 4px;" title="Modificar fila seleccionada"><span op="edit" class="ui-icon ui-icon-pencil"></span></div>'+
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;margin-left:2px;margin-right:2px" title="Generar reporte"><span op="report" class="ui-icon ui-icon-document"></span></div>'+	
								'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Eliminar fila seleccionada"><span op="delete" class="ui-icon ui-icon-trash"></span></div>'+											
								"</div>";
								}

					 } ],
		  rowNum:20, 
		  pager: "tableClientPager"+id, 
// 		  sortname: 'idpago', 
		  sortorder: "asc", 
	      height : 80,	           	
	      beforeSelectRow: function (rowid, e) {
 			 var iCol = jQuery.jgrid.getCellIndex(e.target);
			 if(iCol == 5){
			 	if(e.target.attributes.op.value=="report"){
			 		var rowData = jQuery("#tableClient"+id).jqGrid('getRowData',rowid); 
	        	     jQuery("#dialogLoading" ).dialog("open");
		              window.location.href = "<%=request.getContextPath()%>/generateReport.htm?cliId="+id;
		            }
			 	if(e.target.attributes.op.value=="edit"){
			 		var rowData = jQuery("#listOCTable").jqGrid('getRowData',rowid); 
			 		//updateOC(rowData);
		            }
			 	if(e.target.attributes.op.value=="delete"){
			 		// var idocompra = jQuery('#listOCTable').jqGrid('getCell',rowid,"idocompra");
			 		// delOrdenCompra(idocompra);
			 		alert("eliminar o dar fecha de baja?");
			 		return false;
		            }
			 	}
			 
			 // prevent row selection if one click on the button
			 return (iCol >= 9)? false: true;
          }, 
		  editurl: "dummy.htm",
		  jsonReader : {
		        root: "rows",
		        page: "page",
		        total: "total",
		        records: "records",
		        repeatitems: false,
		        id: "idabono"
		    },	
		  pgbuttons: false,
		  pginput:false,
		  onSelectRow: function(id){ 
// 			  if(id && id!==lastsel){
// 									  jQuery("#"+subgrid_table_id).jqGrid('restoreRow',lastsel); 
// 									  jQuery("#"+subgrid_table_id).jqGrid('editRow',id,true,null,null,'',{},function(rowid){createEditButton();},null,function(){ createEditButton(); } ); 
// 									  lastsel=id;
// 			  	} 
		  },
		  });

//fix necesario apra cuando la tabla tiene dato local. El reader local, no sabe cual es el campo usado como id del array de datos.
jQuery("#tableClient"+id).jqGrid()[0].p.localReader.id = "idabono";

jQuery.ajax({
    url: '<c:url value="/listClientAbonos.htm" />',
    type: "GET",
    dataType: "json",
    contentType: "application/json",
    data: {"idC":id}, 
    success: function(resp){                                       
   	 	for (var i = 0; i <= resp.rows.length; i++) { 
		 jQuery("#tableClient"+id).jqGrid('addRowData',i + 1, resp.rows[i]); 
    	}     
    }
  });
  
}


function createDialogAsign(event,object,data){
	
	 //get the id of the inserted row
	 var idRow = jQuery.data(document.body,"rowIdAbonoAdded");
	 var idTable = jQuery("table tr[id="+idRow+"]").parent().parent().attr("id");
	 var arrayAbonoId = jQuery("#"+idTable).jqGrid('getCol','idabono');
	 
	 
	 var counter=0;
	 for(var i=0;arrayAbonoId.length>i;i++){
		 if(arrayAbonoId[i]==data.idabono){
			 counter++;
		 } 
	 }
	 if(counter==2){
		 alert("ya tiene el abono!");
		 jQuery("#"+idTable).jqGrid('delRowData',idRow);	
		 return;
	 }
		 	 	 	
	 jQuery.data(document.body,"abonoTableSelected",{"rowSelected":idRow,"tableSelected":idTable}); 

	
	jQuery("#dialogAsignAbono").dialog( "option", "title", "Asignar Abono: "+data.nombre);
	jQuery("#dialogAsignAbono").dialog( "open" );
	
}

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

jQuery("#dialogAsignAbono").dialog({
	autoOpen: false,
	width: 550,
	modal:true,
	buttons: {
		"Cerrar": function() {
			jQuery( this ).dialog( "close" );
		},
		"Asignar": function() {

			 var dataAbonoSelected = jQuery.data(document.body,"abonoTableSelected");
			 var idTable = dataAbonoSelected.tableSelected;
			 var idRow = dataAbonoSelected.rowSelected;
			 var dateNew = $("#fechaAlta").val();
			 var noteNew = $("#noteNewAbono").val();
			 var idAbono = $("#"+idTable).jqGrid('getCell',idRow,"idabono");
			 jQuery("#"+idTable).jqGrid('setCell',idRow,"fechaAlta",dateNew);
			 jQuery("#"+idTable).jqGrid('setCell',idRow,"descripcion",noteNew);
			 jQuery("#dialogAsignAbono").dialog( "close" );
			 var idClient = idTable.replace("tableClient","");
		 
		     var newCliAbono = {'idcliente':idClient,'idabono':idAbono,'descripcion':noteNew,'fechaAlta':dateNew};		  		 
		  		 
		        jQuery.ajax({
		             url: '<c:url value="/asignNewAbono.htm" />',
		             type: "POST",
		             dataType: "json",
		             contentType: "application/json",
		             data: JSON.stringify( newCliAbono ), 
		             success: function(resp){                                       
		              	 if(resp){ 
		              		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Asignar Abono" );
		            		 jQuery("#dialogSuccessOperation").dialog("open");
		            		 //cancelEdit();
		         	 	}
		         	 	else{
		           		 jQuery("#dialogErrorOperation").dialog("open");
		         	 	}     
		             }
		           });
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

function cancelAsignAbonos(){
	jQuery("div .ui-inline-cancel").trigger("click");
	jQuery(".assignClientAbonoDiv").hide();
	jQuery("div[id^='baseClient-'] ").remove();
	jQuery('#listClientTable').jqGrid('setGridState','visible');	
	
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
