<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>


<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
<link type="text/css" href="css/demos.css" rel="stylesheet" />
<link rel="stylesheet" href="css/tablas_datos.css" type="text/css"/>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />


<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>

<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="js/i18n/grid.locale-es.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="js/jquery.alerts.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.js" ></script>  


<script type="text/javascript">
	jQuery(function() {
		cleanScreenSearch();
		
		jQuery("#editProviderForm").validate({
		    rules: {
		    	example:{required: true,digits:true}
	  
	        },
		    messages: {
		    	example: {required: "campo obligatorio",digits:"campo debe ser numerico"}			    	
		    },
	  	submitHandler: function() { 	  	
	  		var razonProv = jQuery("#rzprov").val();
	  		var nameProv = jQuery("#nameprov").val();
	  		var telContactProv = jQuery("#telcontprov").val();
	  		var localProv = jQuery("#localprov").val();
	  		var emailProv = jQuery("#emailprov").val();
	  		var telProv = jQuery("#telprov").val();
	  		var cuitProv = jQuery("#cuitprov").val();
	  		var ccProv = jQuery("#ccprov").val();
	  		var direProv = jQuery("#direProv").val();
	  		var idProvider = jQuery("#idProviderEdit").val();

	  		var newProvider = {'idproveedor':idProvider,'razonsocial':razonProv,'telefono':telProv,'direccion':direProv,
	  					    'localidad':localProv,'email':emailProv,'ccNro':ccProv,'cuitTipo':'CUIT', 'cuit':cuitProv,
	  					  'nombreContacto':nameProv,'telefonoContacto':telContactProv};		  		  		 
	  		 
            jQuery.ajax({
                 url: '<c:url value="/editProvider.htm" />',
                 type: "POST",
                 dataType: "json",
                 contentType: "application/json",
                 data: JSON.stringify( newProvider ), 
                 success: function(resp){                                       
                			jSuccess("Operacion realizada exitosamente", "Guardar",function(){
                				cleanScreenEdit();
                				jQuery('#listProviderTable').jqGrid('setGridState','visible');	
                			},["Aceptar"]);
                	                                
                 }
               });
	  		
	  	}      
	});
		
		
		 jQuery("#searchButton").click(function(){
			 var name = jQuery("#nombreSearch").val();
			 var lastName = jQuery("#apellidoSearch").val();
			 var cuit = jQuery("#cuitSearch").val();
			 var score = jQuery("#puntuacionSearch").val();
		       jQuery("#listClientTable").jqGrid('setGridParam',{url:"<c:url value="/loadListClientsByParameter.htm" />?name="+name+"&lastName="+lastName+"&cuit="+cuit+"&score="+score,page:1}).trigger('reloadGrid');
		       //jQuery("#showHideTable").fadeIn(); 
		 });
		 
		 jQuery("#clearSearchButton").click(function(){
			 cleanScreenSearch();
			 cancelEdit();
		 });
		 
		function cleanScreenSearch(){
			 jQuery("#nombreSearch").val("");
	  	  	 jQuery("#apellidoSearch").val("");
	  		 jQuery("#cuitSearch").val("");		 
		}
		
		function cleanScreenEdit(){
			 jQuery("#nombreC").val("");
	  	  	 jQuery("#apellidoC").val("");
	  		 jQuery("#direccionC").val("");
	  		 jQuery("#localidadC").val("");
	  		 jQuery("#emailC").val("");
	  		 jQuery("#telC").val("");
	  		 jQuery("#cuitC").val("");
	  		 jQuery("#puntuacionC").val("");
	  		 jQuery("#comentC").val("");
	  		 jQuery("#ccC").val("");
			 jQuery("#listClientTable").trigger('reloadGrid');
			 jQuery(".editClientDiv").hide();			 
		}

	 jQuery("#listProviderTable").jqGrid({
				 url: '<c:url value="/loadlistProviders.htm"/>',
				 datatype: "json", 
				 width : 900,
				 height : 200,
				 colNames : ['Operación','','Razón Social',  'Nombre Contacto',
				             '<fmt:message key="message.cli.direc"/>', '<fmt:message key="message.cli.localidad"/>','','','','CUIT','','' ],
					colModel : [ 
					        	{name: 'myac',
									 width:60, 
									 fixed:true, 
									 sortable:false, 
									 resize:false, 
									 formatter:'actions', 
									 formatoptions:{keys:true,onEdit:function(idrow,data){
										 var row = jQuery('#listProviderTable').jqGrid('getRowData',idrow);										 
										 updateProvider(row);							 
									 }, delOptions: {
										 beforeSubmit:function(formid){
											 		 var idProv = jQuery('#listProviderTable').jqGrid('getCell',formid,"idproveedor");
											 		 delProvider(idProv);
													 return [true,''];}
									 }
									 }
									
								},
					{
						name : 'idproveedor',
						index : 'idproveedor',
						width : 1,
						hidden:true					
					},
					{
						name : 'razonsocial',
						index : 'razonsocial',
						align: 'center',
						width : 180
					}
					, {
						name : 'nombreContacto',
						index : 'nombreContacto',
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
					}, {
						name : 'telefonoContacto',
						index : 'telefonoContacto',
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
				  pager: '#listProviderTableGrid',
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
				  onSelectRow:function(){//alert("asdasd")
					  },
				  viewrecords: true, 
				  sortorder: "desc", 
				  caption:'Proveedores', 
				  editurl: "dummy.htm"
				  });
	 
});
	
function delProvider(idParam){
		   jQuery.ajax({
		          url: '<c:url value="/delProvider.htm" />',
		          type: "GET",
		          dataType: "json",
		          contentType: "application/json",
		          data: {idProvider:idParam}, 
		          success: function(resp){                                       
					jQuery("#listProviderTable").trigger('reloadGrid');
					jSuccess("Operacion realizada exitosamente", "Eliminar",function(){
        			},["Aceptar"]);
		          }
		        });	 
}

function updateProvider(row){
	jQuery('#listProviderTable').jqGrid('setGridState','hidden');	
	
	 jQuery("#rzprov").val(row.razonsocial);
  	 jQuery("#nameprov").val(row.nombreContacto);
  	 jQuery("#telcontprov").val(row.telefonoContacto);
  	 jQuery("#localprov").val(row.localidad);
  	 jQuery("#emailprov").val(row.email);
  	 jQuery("#telprov").val(row.telefono);
  	 jQuery("#cuitprov").val(row.cuit);
  	 jQuery("#ccprov").val(row.ccNro);
  	 jQuery("#direProv").val(row.direccion);
  	 jQuery("#idProviderEdit").val(row.idproveedor);
    
  	 jQuery(".editProvidertDiv").show();
	/* var alertObject = {'idProd':row.idProd,'idAlerta':row.idAlerta,'cantminAlerta':row.cantminAlerta};
	 			 
	     jQuery.ajax({
	          url: '<c:url value="/addAlert.htm" />',
	          type: "POST",
	          dataType: "json",
	          contentType: "application/json",
	          data: JSON.stringify( alertObject ), 
	          success: function(resp){                                       
				jQuery("#searchResultTable").trigger('reloadGrid');
	          }
	        });*/
		
	}
	
function cancelEdit(){
	jQuery("div .ui-inline-cancel").trigger("click");
	jQuery(".editProvidertDiv").hide();
	jQuery('#listProviderTable').jqGrid('setGridState','visible');	
}	

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script>

<div id="nav">
	<div class="container">	
		<div style="margin-bottom: 10px;">
		<fieldset>
		<legend>Buscar Proveedor</legend>     
		<div class="span-8">
					<label for="nombreSearch">Razon social</label></br>
						<input type="text" class="text2" id="nombreSearch" name="nombreSearch" /></br>
		</div>
		<div class="span-8">
					<label for="apellidoSearch">Nobre Contacto</label></br>
						<input type="text" class="text2" id="apellidoSearch" name="apellidoSearch" /></br>	
		</div>
		<div style="float:left; margin-right:16px">
					<label for="cuitSearch">CUIT</label></br>
						<input type="text" style="width: 120px" maxlength="11" class="text2" id="cuitSearch" name="cuitSearch" /></br>			
		</div>
<!-- 		<div class="float:left; margin-right:16px"> -->
<!-- 				<label for="puntuacionSearch">Puntuación</label></br> -->
<!-- 						<input type="text" style="width: 20px" maxlength="3" class="text2" id="puntuacionSearch" name="puntuacionSearch" /></br>	 -->
<!-- 		</div> -->
				<div style="float:right; margin-right:16px" align="right">
					<input type="button" value="Limpiar" class="" id="clearSearchButton" name="clearSearchButton" />					
					<input type="button" value="Buscar" class="" id="searchButton" name="searchButton" />
				</div>			
		</fieldset>  
		</div>
		
		    		<div style="" align="center">
			    		<div style="height: 30px" ></div>
	  						 <table style="text-align: center;" align="center" id="listProviderTable">
	             			 </table>	
	             		<div id="listProviderTableGrid"></div>
              		</div>
            		
              		
	<div class="editProvidertDiv" style="display: none;">	
			<br>
			<h2>Editar cliente</h2>
			<hr>
			  <form id="editProviderForm" action="" method="">
		        <input type="hidden" class="" id="idProviderEdit" name="idProviderEdit" />
        		<div class="span-8">    
					<label for="rzprov">Razón social</label></br>
						<input type="text" class="text2" id="rzprov" name="rzprov" /></br>
					<label for="nameprov">Nombre de contacto</label></br>
						<input type="text" class="text2" id="nameprov" name="nameprov" /></br>
					<label for="telprov">Teléfomo de contacto</label></br>
						<input type="text" class="text2" id="telcontprov" name="telcontprov" /></br>
				</div>
				<div class="span-8">    
					<label for="direProv">Dirección</label></br>
						<input type="text" class="text2" id="direProv" name="direProv" /></br>
					<label for="localprov">Localidad</label></br>
						<input type="text" class="text2" id="localprov" name="localprov" /></br>
					<label for="telprov">Teléfono</label></br>
						<input type="text" class="text2" id="telprov" name="telprov" /></br>			  
				</div>	
				<div class="span-8 last">		  
					<label for="emailprov">Correo electrónico</label></br>
						<input type="text" class="text2" id="emailprov" name="emailprov" /></br>
					<label for="cuitprov">CUIT</label></br>
						<input type="text" class="text2" id="cuitprov" name="cuitprov" /></br>
					<label for="ccprov">Cuenta corriente nro</label></br>
						<input type="text" class="text2" id="ccprov" name="ccprov" /></br>						
				</div>				 
				<div class="prepend-top append-bottom last" style="position: relative; float: right;">						
		              <input type="button" onclick="jQuery('#editProviderForm').submit();"  value="Guardar" />
		              <input type="button" onclick="cancelEdit();"  value="Cancelar" />	
				</div>
        </form>
	</div>	
	</div>
</div>	
<div id="footer">
      <div class="container">
         <div class="span-21">
            Enlaces del pie..
         </div>
         <div class="span-3 last">
            logo en pequeño
         </div>
      </div>
   </div>
</body>
</html>