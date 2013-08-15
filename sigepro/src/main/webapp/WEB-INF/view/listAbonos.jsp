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
	    content: "Editar Abono";
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
              <li class="active dropdown">
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
		    <a href="#">Buscar Abono</a>
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
					<label for="apellidoSearch"><strong>Vel. Subida</strong></label>
						<input type="text" class="" id="apellidoSearch" name="apellidoSearch" />
				</div>
				<div class="span3">    
					<label for="localidadC"><strong>Vel. Bajada</strong></label>
						<input type="text" class="" id="localidadSearch" name="localidadSearch" />
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
	  						 <table style="text-align: center;font-size: 18px" align="center" id="listAbonoTable">
	             			 </table>	
	             		<div id="listAbonoTableGrid"></div>
              		</div>
		  </div>
     <div class="editAbonoDiv" style="display: none;">
     <div class="row-fluid">
			<br>
			<div class="bs-docs-example">
 	  		 <form id="editAbonoForm" action="" method="post">
 	  		 <input type="hidden" class="" id="idAbonoEdit" name="idAbonoEdit" /> 
 	  	         <div class="row-fluid">
	        	<div class="span4">    
					<label for="nombreC"><strong>Nombre</strong></label>
						<input type="text" class="input-xlarge" id="nombreC" name="nombreC" />
				</div>
				 <div class="span4">    
					<label for="price"><strong>Precio</strong></label>
					<div class="input-prepend">
					 <span class="add-on"><i class="icon-dollar icon-large"></i></span>
						<input type="text" class="input-small" id="price" name="price" />
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">    
					<label for="localidadC"><strong>Vel. Bajada</strong></label>
					 <div class="input-prepend input-append">
					 <span class="add-on"><i class="icon-download icon-large"></i></span>
						<input type="text" class="input-small" id="velDown" name="velDown" />
						<span class="add-on">kbps</span>
					</div>
				</div>
				<div class="span3">    
					<label for="localidadC"><strong>Vel. Subida</strong></label>
					 <div class="input-prepend input-append">
					 <span class="add-on"><i class="icon-upload icon-large"></i></span>
						<input type="text" class="input-small" id="velUp" name="velUp" />
						 <span class="add-on">kbps</span>
					</div>
				</div>	
				</div>	
				<div class="row-fluid">	 
					<div class="span7">							 
						<label for="comentC"><strong>Descripción</strong></label>
					  		<textarea name="decription" id="decription" rows="3" class="input-block-level"></textarea>
					</div>
				</div>
				<div class="row-fluid">	 
				<div class="pull-right">			
		               <button type="button" onclick="jQuery('#editAbonoForm').submit();" class="btn btn-primary">Guardar</button>
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
	<div id="dialogDeleteClient" style="display: none" align="" title="Eliminar abono" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Esta seguro de que desea eliminar el abono? </p>
	</div> 
	<div id="dialogErrorOperation" class="" style="display: none" align="" title="Eliminar abono" >
	<p style="margin:0px;"><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>Se ha producido un error al realizar la operacion! </p>
	</div> 
	<div id="dialogSuccessOperation"  style="display: none" align="" title="Eliminar abono" >
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
jQuery("#editAbonoForm").validate({
		focusInvalid:false,
	    rules: {
	    	nombreC:{required: true}
        },
	    messages: {
	    	nombreC: {required: "campo obligatorio"}
	    },
  	submitHandler: function() { 	  	
  		var nombreNew = jQuery("#nombreC").val();
  		var velUp = jQuery("#velUp").val();
  		var velDown = jQuery("#velDown").val();
  		var decription = jQuery("#decription").val();
  		var price = jQuery("#price").val();
  		var idAbono = jQuery("#idAbonoEdit").val();
  		
  		var newAbono = {'idabono':idAbono,'nombre':nombreNew,'descripcion':decription,
  					    'maxbajada':velDown,'maxsubida':velUp,'precio':price};	
  		  		 
  		 
        jQuery.ajax({
             url: '<c:url value="/editAbono.htm" />',
             type: "POST",
             dataType: "json",
             contentType: "application/json",
             data: JSON.stringify( newAbono ), 
             success: function(resp){                                       
              	 if(resp!=-1){ 
              		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Editar abono" );
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
	 var lastName = jQuery("#apellidoSearch").val();
	 var cuit = jQuery("#cuitSearch").val();
      jQuery("#listAbonoTable").jqGrid('setGridParam',{url:"<c:url value="/loadListAbonoByParameter.htm" />?name="+name+"&lastName="+lastName+"&cuit="+cuit+"&score="+score,page:1}).trigger('reloadGrid');
});

jQuery("#clearSearchButton").click(function(){
	 cleanScreenSearch();
	 cancelEdit();
});


jQuery("#listAbonoTable").jqGrid({
	 url: '<c:url value="/loadlistAbonos.htm"/>',
	 datatype: "json", 
	 width : 1158,
	 height : 200,
	 colNames : ['Operación','','Nombre','Vel. Bajada (kbps)','Vel. Subida (kbps)','Precio','','' ],
		colModel : [ 
		        	{name: 'myac',
						 width:67, 
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
	  multiselect: true,
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

// $("#gview_listClientTable").css("font-size","14px");



jQuery("#dialogDeleteClient").dialog({
	autoOpen: false,
	height: 170,
	modal:true,
	buttons: {
		"Ok": function() {
			delAbono();
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
			 jQuery("#listAbonoTable").trigger('reloadGrid');
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

});
//Other functions

function updateAbono(row){
	jQuery('#listAbonoTable').jqGrid('setGridState','hidden');	
	
	jQuery("#nombreC").val(capitaliseFirstLetter(row.nombre));
    jQuery("#velUp").val(row.maxsubida);
  	jQuery("#velDown").val(row.maxbajada);
  	jQuery("#decription").val(row.descripcion);
  	jQuery("#price").val(row.precio);
	jQuery("#idAbonoEdit").val(row.idabono);
	
	jQuery(".editAbonoDiv").show();		
	jQuery("#nombreC").focus();
}
function delAbono(){
	      var clientObj = jQuery.data(document.body,"clientData");
		   jQuery.ajax({
		          url: '<c:url value="/delAbono.htm" />',
		          type: "GET",
		          dataType: "json",
		          contentType: "application/json",
		          data: {idAbono:clientObj.idabono}, 
		          success: function(resp){     
	            	 if(resp){
	               		jQuery("#dialogSuccessOperation").dialog( "option", "title", "Eliminar abono" );
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

}
function cleanScreenEdit(){
	 jQuery(".editClientDiv").hide();			 
     jQuery("#nombreC").val("");
     jQuery("#velUp").val("");
   	 jQuery("#velDown").val("");
   	 jQuery("#decription").val("");
   	 jQuery("#price").val("");
	 jQuery("#listAbonoTable").trigger('reloadGrid');

}
function cancelEdit(){
	jQuery("div .ui-inline-cancel").trigger("click");
	jQuery(".editAbonoDiv").hide();
	jQuery('#listAbonoTable').jqGrid('setGridState','visible');	
	cleanScreenEdit();
}	

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script> 

  </body>
</html>
