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
<style>
	.ui-autocomplete-loading { background: white url('css/images/ui-anim_basic_16x16.gif') right center no-repeat; }
	.ui-loadingBar { background: transparent url('css/images/load.gif') center / 260px no-repeat;  }
</style>


<script type="text/javascript" src="js/jquery-1.7.min.js"></script>

<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="js/i18n/grid.locale-es.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="js/jquery.alerts.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript" src="js/excanvas.js" ></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.raty.min.js"></script>

<script type="text/javascript">
jQuery(function() {
		cleanScreenSearch();
		
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
	  		var nombreEdit = jQuery("#nombreC").val();
	  		var apellidoEdit = jQuery("#apellidoC").val();
	  		var direccionEdit = jQuery("#direccionC").val();
	  		var localidadEdit = jQuery("#localidadC").val();
	  		var emailEdit = jQuery("#emailC").val();
	  		var telEdit = jQuery("#telC").val();
	  		var cuitEdit = jQuery("#cuitC").val();
	  		var puntuaEdit = jQuery('#puntuacionStart input[name=score]').val();
	  		var comentEdit = jQuery("#comentC").val();
	  		var cuentaCEdit = jQuery("#ccC").val();
	  		var idClient = jQuery("#idClientEdit").val();

	  		var newClient = {'idcliente':idClient,'nombre':nombreEdit,'apellido':apellidoEdit,'direccion':direccionEdit,
	  					    'localidad':localidadEdit,'email':emailEdit,'telefono':telEdit,
	  						'notas':comentEdit,'ccNro':cuentaCEdit,'puntuacion':puntuaEdit, 'cuit':cuitEdit};		  		 
	  		 
            jQuery.ajax({
                 url: '<c:url value="/editClient.htm" />',
                 type: "POST",
                 dataType: "json",
                 contentType: "application/json",
                 data: JSON.stringify( newClient ), 
                 success: function(resp){                                       
                			jSuccess("Operacion realizada exitosamente", "Guardar",function(){
                				cleanScreenEdit();
                				jQuery('#listClientTable').jqGrid('setGridState','visible');	
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
	  		 jQuery("#puntuacionSearch").val("");
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

	 jQuery("#listClientTable").jqGrid({
				 url: '<c:url value="/loadlistClients.htm"/>',
				 datatype: "json", 
				 width : 900,
				 height : 200,
				 colNames : ['Operación','','<fmt:message key="message.cli.nombre"/>',  '<fmt:message key="message.cli.apellido"/>',
				             '<fmt:message key="message.cli.direc"/>', '<fmt:message key="message.cli.localidad"/>','','','','CUIT','Puntuación','','' ],
					colModel : [ 
					        	{name: 'myac',
									 width:60, 
									 fixed:true, 
									 sortable:false, 
									 resize:false, 
										search: false,
										formatter:function(){
											return "<div style='margin-left: 4px;'>"+
											'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Enviar mail a..."><span op="email" class="ui-icon ui-icon-mail-closed"></span></div>'+											
											'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Modificar fila seleccionada"><span op="edit" class="ui-icon ui-icon-pencil"></span></div>'+											
											'<div onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onmouseover="jQuery(this).addClass(\'ui-state-hover\');"  class="ui-pg-div ui-inline-edit" style="float: left; cursor: pointer; display: block;" title="Eliminar fila seleccionada"><span op="delete" class="ui-icon ui-icon-trash"></span></div>'+											
											"</div>";
											}
// 									 formatter:'actions', 
// 									 formatoptions:{keys:true,onEdit:function(idrow,data){
// 										 var row = jQuery('#listClientTable').jqGrid('getRowData',idrow);										 
// 										 updateClient(row);							 
// 									 }, delOptions: {
// 										 beforeSubmit:function(formid){
// 											 		 var idCliente = jQuery('#listClientTable').jqGrid('getCell',formid,"idcliente");
// 											 		 delClient(idCliente);
// 													 return [true,''];}
// 									 }
// 									 }
									
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
						name : 'puntuacion',
						index : 'puntuacion',
						align: 'center',
						width : 30
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
						 		 delClient(idCliente);
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
	 
	 $.fn.raty.defaults.path = 'css/images';
	 	jQuery('#puntuacionStart').raty({
	 		  size     : 24,
	 		  starHalf : 'star-half-big.png',
	 		  starOff  : 'star-off-big.png',
	 		  starOn   : 'star-on-big.png',
	 		  target: '#hint',
	 		  hints: ['Malo', 'Aceptable','Bueno', 'Muy bueno', 'Excelente']
	 	});
	 
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
	 	
	 	
}); //end jQuery ready


function delClient(idParam){
		   jQuery.ajax({
		          url: '<c:url value="/delClient.htm" />',
		          type: "GET",
		          dataType: "json",
		          contentType: "application/json",
		          data: {idClient:idParam}, 
		          success: function(resp){     
	            	 if(resp){
							jSuccess("Operacion realizada exitosamente", "Eliminar",function(){
								 jQuery("#listClientTable").trigger('reloadGrid');
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

function updateClient(row){
	jQuery('#listClientTable').jqGrid('setGridState','hidden');	
	
	jQuery("#nombreC").val(capitaliseFirstLetter(row.nombre));
	jQuery("#apellidoC").val(capitaliseFirstLetter(row.apellido));
	jQuery("#direccionC").val(row.direccion);
	jQuery("#localidadC").val(row.localidad);
	jQuery("#emailC").val(row.email);
	jQuery("#telC").val(row.telefono);
	jQuery("#comentC").val(row.notas);
	jQuery("#ccC").val(row.ccNro);
	//jQuery("#puntuacionC").val(row.puntuacion);
	jQuery('#puntuacionStart').raty('score', row.puntuacion);
// 	jQuery("#nombreC").val(row.fechaAgregado);
	jQuery("#cuitC").val(row.cuit);
	jQuery("#idClientEdit").val(row.idcliente);
	jQuery(".editClientDiv").show();
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
	jQuery(".editClientDiv").hide();
	jQuery('#listClientTable').jqGrid('setGridState','visible');	

}	

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script>

<div id="nav">
	<div id="dialogSendEmail" style="display: none" align="" title="Enviar email" >
	<p style="margin:0px;">Destinatario: <input class="text2" type="text" id="toEmail" /> </p>
	<p style="margin:0px;">Asunto: <input class="text2" type="text" id="subjectEmail" /> </p>
	<p style="margin:10px 0px 0px 0px">Contenido:</p>
	<textarea style="width: 500px" name="contentEmail" id="contentEmail" rows="8" cols="6"></textarea>
	</div>
	<div class="container">	
		<div style="margin-bottom: 10px;">
		<fieldset>
		<legend>Buscar Cliente</legend>     
		<div class="span-8">
					<label for="nombreSearch">Nombre</label></br>
						<input type="text" class="text2" id="nombreSearch" name="nombreSearch" /></br>
		</div>
		<div class="span-8">
					<label for="apellidoSearch">Apellido</label></br>
						<input type="text" class="text2" id="apellidoSearch" name="apellidoSearch" /></br>	
		</div>
		<div style="float:left; margin-right:16px">
					<label for="cuitSearch">CUIT</label></br>
						<input type="text" style="width: 120px" maxlength="11" class="text2" id="cuitSearch" name="cuitSearch" /></br>			
		</div>
		<div class="float:left; margin-right:16px">
				<label for="puntuacionSearch">Puntuación</label></br>
						<input type="text" style="width: 20px" maxlength="3" class="text2" id="puntuacionSearch" name="puntuacionSearch" /></br>	
		</div>
					<div align="right">
					<input type="button" value="Limpiar" class="" id="clearSearchButton" name="clearSearchButton" />					
					<input type="button" value="Buscar" class="" id="searchButton" name="searchButton" />
					</div>			
		</fieldset>  
		</div>
		
		    		<div style="" align="center">
			    		<div style="height: 30px" ></div>
	  						 <table style="text-align: center;" align="center" id="listClientTable">
	             			 </table>	
	             		<div id="listClientTableGrid"></div>
              		</div>
            		
              		
	<div class="editClientDiv" style="display: none;">	
			<br>
			<h2>Editar cliente</h2>
			<hr>
        <form id="editClientForm" action="" method="">
        <input type="hidden" class="" id="idClientEdit" name="idClientEdit" />
	        	<div class="span-8">    
					<label for="nombreC">Nombre</label><br>
						<input type="text" class="text2" id="nombreC" name="nombreC" ><br>
					<label for="apellidoC">Apellido</label><br>
						<input type="text" class="text2" id="apellidoC" name="apellidoC" ><br>
					<label for="direccionC">Dirección</label><br>
						<input type="text" class="text2" id="direccionC" name="direccionC" ><br>
				</div>
				<div class="span-8">    
					<label for="localidadC">Localidad</label><br>
						<input type="text" class="text2" id="localidadC" name="localidadC" ><br>
					<label for="emailC">Correo electrónico</label><br>
						<input type="text" class="text2" id="emailC" name="emailC" ><br>
					<label for="telC">Teléfono</label><br>
						<input type="text" class="text2" id="telC" name="telC" ><br>			  
				</div>	
				<div class="span-8 last">		  
					<label for="ccC">CC</label><br>
						<input type="text" class="text2" id="ccC" name="ccC" ><br>
					<label for="cuitC">CUIT</label><br>
						<input type="text" class="text2" id="cuitC" name="cuitC" ><br>
					<label for="puntuacionC">Puntuación</label><br>
						<div id="puntuacionStart" style="margin-top:5px; float: left;"></div><span style="font-size: 18px" id="hint"></span>		
				</div>				 
				<div class="span-24 last">							 
					<label for="comentC">Comentario</label><br>
				  		<textarea name="comentC" id="comentC" rows="5" cols="20"></textarea>
				</div>
				<div class="prepend-top append-bottom last" style="position: relative; float: right;">						
		              <input type="button" onclick="jQuery('#editClientForm').submit();"  value="Guardar" />
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