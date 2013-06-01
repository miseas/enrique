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
<link rel="stylesheet" href="css/loading.css" type="text/css"/>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<style>
	.ui-autocomplete-loading { background: white url('css/images/ui-anim_basic_16x16.gif') right center no-repeat; }
</style>

<script type="text/javascript" src="js/jquery-1.7.min.js"></script>

<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="js/i18n/grid.locale-es.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.src.js" type="text/javascript"></script>
<script src="js/jquery.alerts.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript" src="js/excanvas.js" ></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.scrollTo-min.js" ></script>  


<script type="text/javascript">
jQuery(function() {
		cleanScreenSearch();
		
		
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
		

	 jQuery("#listOCTable").jqGrid({
				 url: '<c:url value="/loadlistOC.htm"/>',
				 datatype: "json", 
				 width : 900,
				 height : 200,
// 				treedatatype: "json",
				treeGrid: true,
		        treeGridModel: 'adjacency',
				ExpandColumn : 'nombreCliente',
// 				ExpandColClick: true,
				 colNames : ['','','<fmt:message key="message.cli.nombre"/>','Nro Compra',  'Fecha OC','Fecha Entrega',
				             'Precio Total','Pagos','Balance','Operación' ],
					colModel : [ 			
					{
						name : 'idocompra',
						index : 'idocompra',
						width : 1,
						key:true,
						hidden:true					
					},
					{
						name : 'idcliente',
						index : 'idcliente',
						width : 1,
						hidden:true					
					},			        	
		
					{
						name : 'nombreCliente',
						index : 'nombreCliente',
						width : 200
					},
					{
						name : 'nrocompra',
						index : 'nrocompra',
						align: 'center',
						width : 100
					},
					{
						name : 'fechacompra',
						index : 'fechacompra',
						align: 'center',
						width : 80
					}, {
						name : 'fechaentrega',
						index : 'fechaentrega',
						align: 'center',
						width : 80
					}, {
						name : 'preciototal',
						index : 'preciototal',
						align: 'center',
						formatter:'currency',
						formatoptions:{prefix:"$"},
						width : 100
					},
					{
						name : 'pagosTotal',
						index : 'pagosTotal',
						align: 'center',
						formatter:'currency',
						formatoptions:{prefix:"$"},
						width : 100
					},{
						name : 'balanceTotal',
						index : 'balanceTotal',
						align: 'center',
						formatter:'currency',
						formatoptions:{prefix:"$"},
						width : 100
					},
					{
						name : 'reportOC',
						index : 'reportOC',
						align: 'center',
						sortable: false,
						search: false,
						formatter:function(){
							return "<div style='margin-left: 8px;'><div class='ui-pg-div' style='margin-left:5px'><span title='Editar' op='edit' style='cursor:pointer;float:left' class='ui-icon ui-icon-pencil'></span></div>"+
							       "<div class='ui-pg-div' style='margin-left:24px'><span op='report' title='Generar Reporte' style='cursor:pointer;float:left' class='ui-icon ui-icon-document'></span></div>"+
							       "</div>";
							},
						width : 60
					}
					],
// 					ondblClickRow: function(id ){},
// 				  rowNum:10, 
// 				  rowList:[10,20,30],
// 				  multiselect: true,
// 				  sortable: true,
				  pager: '#listOCTableGrid',
// 				  pgbuttons: false,
// 				  pginput:false,
// 				  rownumbers : true,
// 				  rowList: {},
// 				  gridview: true,
				 localReader :{
					            root: "rows",
	                  page: "page",
	                  total: "total",
	                  records: "records",
	                  repeatitems: false,
	                  id:"idocompra"
				 },
				  jsonReader : {
	                  root: "rows",
	                  page: "page",
	                  total: "total",
	                  records: "records",
	                  id:"idocompra",
	                  repeatitems: false	            
	               },
	              treeReader : {
	            		   level_field: "level_field",
	            		   parent_id_field: "parent_id_field", // then why does your table use "parent_id"?
	            		   leaf_field: "leaf_field",
	            		   expanded_field: "expanded_field",
	 	                  id:"idocompra"
	            		},
	           	 beforeSelectRow: function (rowid, e) {
	            			 var iCol = jQuery.jgrid.getCellIndex(e.target);
	            			 if(iCol >= 9){
	            			 	if(e.target.attributes.op.value=="report"){
	            			 		var rowData = jQuery("#listOCTable").jqGrid('getRowData',rowid); 
	            	        	     jQuery("#dialogLoading" ).dialog("open");
	            		              window.location.href = "<%=request.getContextPath()%>/generateSavedReportOC.htm?ocId="+rowData.idocompra;
	            		            }
	            			 	if(e.target.attributes.op.value=="edit"){
	            			 		var rowData = jQuery("#listOCTable").jqGrid('getRowData',rowid); 
	            			 		updateOC(rowData);
	            		            }
	            			 	}
	            			 
	            			 // prevent row selection if one click on the button
	            			 return (iCol >= 9)? false: true;
	              }, 
// 				  onSelectRow:function(){//alert("asdasd")
// 					  },
// 				  viewrecords: true, 
// 				  sortorder: "desc", 
				  caption:'Ordenes de compra', 
				  editurl: "dummy.htm"
				  });
	 
	 jQuery("#listOCTable").jqGrid('navGrid',"#listOCTableGrid");
	 
	 
	 var orgExpandNode = $.fn.jqGrid.expandNode,
	    orgCollapseNode = $.fn.jqGrid.collapseNode;
	$.jgrid.extend({
	    expandNode: function (rc) {
	        //alert('before expandNode: rowid="' + rc._id_ + '", name="' + rc.nombreCliente + '"');
	        return orgExpandNode.call(this, rc);
	    },
	    collapseNode: function (rc) {
// 	        alert('before collapseNode: rowid="' + rc._id_ + '", name="' + rc.name + '"');
// 	        var node = jQuery('#listOCTable').jqGrid('getRowData',40);
// 	        jQuery.extend(node,{"_id_":40});
// 	        alert("adas"+node._id_ );
// 	        orgCollapseNode.call(this, node);
	        return orgCollapseNode.call(this, rc);
	    }
	});
	
	//Seteamos el campo id del localReader, usado por treeGrid
	jQuery("#listOCTable").jqGrid()[0].p.localReader.id = "idocompra";
	
	  jQuery("#dialogLoading" ).dialog({
			autoOpen: false,
			width: 250,
			modal:true,
			buttons: {
				"Cerrar": function() {
					jQuery( this ).dialog( "close" );
				}
			},
			resizable: false,
			draggable: false,
			close: function() {
			}
		});
	  
//EDIT OC SECTION OF JS!
     var lastsel; 
		 jQuery("#ordenCompraTable").jqGrid({
			 url:'server.php?q=2', 
					 datatype: "local", 
					 width : 959,
					 height : 360,
					 colNames : ['<fmt:message key="message.ord.cantidad"/>',  '<fmt:message key="message.ord.unidad"/>', '<fmt:message key="message.ord.descripcion"/>', '<fmt:message key="message.ord.preUni"/>','<fmt:message key="message.ord.total"/>','' ],
						colModel : [ 
						{
							name : 'productQuantity',
							index : 'productQuantity',
							width : 75,
							formatter:'integer',
							align:'right',
							editable:true						
						}, {
							name : 'productUnityType',
							index : 'productUnityType',
							width : 75,
							editable:true,
							align:'left'
						}, {
							name : 'productDescription',
							index : 'productDescription',
							width : 335,
							align:'left',
							editable:true
						}, {
							name : 'productPrice',
							index : 'productPrice',
							width : 85,
							editable:true,
							formatter:'number',
							summaryType:'sum',
							align:'right'
						}, {
							name : 'productTotalPrice',
							index : 'productTotalPrice',
							width : 85,
							formatter:'currency',
							editable:true,
							align:'right'
						},
						 {
							name : 'productId',
							index : 'productId',
							width : 1,
							hidden:true
						}],
						ondblClickRow: function(id ){onSelectRowTable(id);},
					  rowNum:10, 
					  rowList:[10,20,30], 
					  pager: '#ordenCompraTableGrid',
					  pgbuttons: false,
					  pginput:false,
					  rowList: {},
					  sortname: 'invdate', 
					  onSelectRow:function(){},
					  viewrecords: true, 
					  sortorder: "desc", 
					  caption:'<fmt:message key="message.ord.title"/>', 
					  editurl: "dummy.htm",
					  footerrow : true,
					  grouping:true,
					  //userDataOnFooter : true,
					  altRows : true
		  });
		 
		 jQuery("#ordenCompraTable").jqGrid('bindKeys', {"onEnter":function( rowid ) { onSelectRowTable(rowid); }} );

		 function onSelectRowTable(id){
			 if(id && id!==lastsel){ 
				 jQuery('#ordenCompraTable').jqGrid('restoreRow',lastsel); 
				 lastsel=id;					 
			 }
			 jQuery('#ordenCompraTable').jqGrid('editRow',id,true,function(id){ //Before edit function
				 						    
					jQuery("#ordenCompraTable tr[id="+id+"] input").each(function(){
						    // Listen for enter (and shift-enter)
						$(this).bind("keydown",function(e) {
		
						      if (e.keyCode === 13) {  // Enter key:

						    	  var price2 = jQuery("#ordenCompraTable tr[id="+id+"] input:eq(3)").val();
								   var quantity2 = jQuery("#ordenCompraTable tr[id="+id+"] input:eq(0)").val();				
								 jQuery("#ordenCompraTable tr[id="+id+"] input:eq(4)").val(parseFloat(price2*quantity2));

						    	var increment = e.shiftKey ? -1 : 1;
					        	id = parseInt(id)+parseInt(increment);
					        	setTimeout(function(){				        	
					        		jQuery("#gbox_ordenCompraTable tr[id="+id+"]").trigger("click").focus();},50);
						       } //end of if
					    }); // end of bind
				     }); // end of each			  
				     
			   },function(){ //After edit function
				return true;						 
			 },'',{}, function(){
				 var sum = jQuery("#ordenCompraTable").jqGrid('getCol','productTotalPrice',false,'sum');
				 jQuery("#ordenCompraTable").jqGrid('footerData','set',{productTotalPrice:sum});
				return true;
	      });
			 
		    jQuery("#ordenCompraTable tr[id="+id+"] input:first,#ordenCompraTable tr[id="+id+"] input:gt(2)").bind("keypress",function(event) {
				    var chars = "0123456789.,";
			        var chr = String.fromCharCode(event.charCode == undefined ? event.keyCode : event.charCode);
			        return event.ctrlKey || (chr < ' ' || !chars || chars.indexOf(chr) > -1);
			    });
	  } // end of onSelectRowTable

		jQuery("#ordenCompraTable").jqGrid('navGrid','#ordenCompraTableGrid',{
			add : false,
			refresh : false,
			edit : false,
			del : false,
			search:false
		},{}).navButtonAdd('#ordenCompraTableGrid',{
			   caption:'<fmt:message key="message.cs.addRecord"/>', 
			   buttonicon:"ui-icon-plus", 
			   onClickButton: function(){ 			   
				   var cantRecords = jQuery("#ordenCompraTable").jqGrid("getGridParam","records");
				   jQuery("#ordenCompraTable").addRowData(cantRecords+1,{});	
			   }, 
			   position:"first"
			});
		 
		 jQuery("#gbox_ordenCompraTable table[class=ui-jqgrid-ftable] tr td:eq(3)").html("Total:");
		 
		 
		 
		 
		 
		 jQuery("#fechaCol").datepicker({
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
		 
		 
		 jQuery("#saveOCButton").click(function(){
			   var totalCheckout = parseInt(jQuery("#ordenCompraTable").jqGrid('footerData','get','productTotalPrice').productTotalPrice);
			  var rowData = jQuery("#ordenCompraTable").jqGrid('getRowData');      
			  var ready=0; 
			  var errorType1=false;
			  var errorType2=false;
			  //Usado para cambiar de color los campos que estuvieran mal, y generar las variables de error
			  var items = jQuery.map(rowData, function (item, index) {
				   if (item.productDescription=="") return null; // Removes the element;
//	 			    if (parseInt(item.productQuantity) > parseInt(item.productStockQuantity)){
//	 			    	jQuery("#stockOutTable").jqGrid('setRowData',index+1,null,"row-warning");
//	 			    	ready=1;
//	 			    	errorType1=true;
//	 			    }
//	 			    if (item.productId==""){
//	 			    	jQuery("#stockOutTable").jqGrid('setRowData',index+1,null,"row-warning");
//	 			    	ready=1;
//	 			    	errorType2=true;
//	 			    }
				    return item;
				});
		
			    	
		  		if (ready==0){		 
// 		  			var fechaReporte = jQuery("#fechaOC").val();
		  			var fechaEntrega = jQuery("#fechaCol").val();
		  			var condPago = jQuery("#payCondition").val();
					var ocDataObj = jQuery.data(document.body,"ocEditData");
					
					ocDataObj.ordenCompraDTO.condcompra = condPago;
					ocDataObj.ordenCompraDTO.fechaentrega = fechaEntrega;
					ocDataObj.ordenCompraDTO.preciototal = totalCheckout;
					ocDataObj.lisProductReportDTOs = items;
					
			       jQuery.ajax({
		            url: '<c:url value="/updateOC.htm" />',
		            type: "POST",
		            dataType: "json",
		            contentType: "application/json",
		            data: JSON.stringify( ocDataObj ), 
		            success: function(resp){        	  	          	  
				           	 if(resp!=-1){ 
			          			jSuccess("Operacion realizada exitosamente", "Editar",function(){
			          				cleanScreenEdit();
			          			},["Aceptar"]);
			          	 	}
			          	 	else{
			          	 		jAlert("Error al realizar la operación", "Error al Editar",function(){
			          				//cleanScreenAdd();
			          			},["Aceptar"]);
			          	 	}   
			            }
			         });
		       
		  		}
		  		else{
		  			if (errorType1 && errorType2){
		  				jAlert("Algunos productos tienen mal las cantidades y <br> otros no existen o estan mal escritos.", "Error",function(){    			
		    			},["Aceptar"]);
		  			}
		  			else{
			  			if (errorType1){	  					
			  			jAlert("Algunos productos tienen mal las cantidades.", "Error",function(){    			
		    			},["Aceptar"]);
			  			}
			  			if (errorType2){
			  			jAlert("Algunos productos no existen en la base de datos o estan mal escritos.", "Error",function(){    			
		    			},["Aceptar"]);
			  			}
		  			}
		  		}
		 });
}); //end jQuery ready
	

function updateOC(row){
	jQuery('#listOCTable').jqGrid('setGridState','hidden');	
	  jQuery(".loadingFormEdit").show();
	  jQuery.ajax({
          url: '<c:url value="/editSavedOC.htm" />',
          type: "GET",
          dataType: "json",
          contentType: "application/json",
          data: {ocId:row.idocompra}, 
          success: function(resp){                  
        	  jQuery(".loadingFormEdit").hide();
        	  jQuery(".editOCForm").show("blind",{},500);
        	  $(document).scrollTo( $('#positionScrollEdit'), 1000 );
        	  //Show products to the list
     		 for(var i=0; i<resp.lisProductReportDTOs.length;i++){
     			resp.lisProductReportDTOs[i].productPrice = parseInt(resp.lisProductReportDTOs[i].productPrice);
     			resp.lisProductReportDTOs[i].productTotalPrice = parseInt(resp.lisProductReportDTOs[i].productTotalPrice);
    			 jQuery("#ordenCompraTable").addRowData(i+1,resp.lisProductReportDTOs[i]);
    		 }
        	 //Show the rest of oc data 
        	  jQuery("#nombreCSearch").val(resp.ordenCompraDTO.nombreCliente);
        	  jQuery("#fechaOC").val(resp.ordenCompraDTO.fechacompra);
        	  jQuery("#payCondition").val(resp.ordenCompraDTO.condcompra);
        	  jQuery("#fechaCol").val(resp.ordenCompraDTO.fechaentrega);
        	  
			  jQuery.data(document.body,"ocEditData",resp );
          }
        });	 
	
// 	jQuery("#nombreC").val(capitaliseFirstLetter(row.nombre));
// 	jQuery("#apellidoC").val(capitaliseFirstLetter(row.apellido));
// 	jQuery("#direccionC").val(row.direccion);
// 	jQuery("#localidadC").val(row.localidad);
// 	jQuery("#emailC").val(row.email);
// 	jQuery("#telC").val(row.telefono);
// 	jQuery("#comentC").val(row.notas);
// 	jQuery("#ccC").val(row.ccNro);
// 	jQuery('#puntuacionStart').raty('score', row.puntuacion);
// 	jQuery("#cuitC").val(row.cuit);
// 	jQuery("#idClientEdit").val(row.idcliente);
// 	jQuery(".editOCForm").show();
		
	}
	
function cancelEdit(){
	jQuery("div .ui-inline-cancel").trigger("click");
	jQuery("#editOCForm").hide();
	jQuery('#listClientTable').jqGrid('setGridState','visible');	
}	

function cleanScreenEdit(){
	
	jQuery(".editOCForm").hide();
	jQuery("#listOCTable").trigger('reloadGrid');
	jQuery('#listOCTable').jqGrid('setGridState','visible');	
}

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script>

<div id="nav">
	<div id="dialogLoading" style="display: none" align="center" title="Cargando..." >
	<div id="floatingCirclesG">
		<div class="f_circleG" id="frotateG_01">
		</div>
		<div class="f_circleG" id="frotateG_02">
		</div>
		<div class="f_circleG" id="frotateG_03">
		</div>
		<div class="f_circleG" id="frotateG_04">
		</div>
		<div class="f_circleG" id="frotateG_05">
		</div>
		<div class="f_circleG" id="frotateG_06">
		</div>
		<div class="f_circleG" id="frotateG_07">
		</div>
		<div class="f_circleG" id="frotateG_08">
		</div>
	</div>
	<p>(Cerrar cuando aparesca la opcion de guardar/abrir el reporte)</p>
	</div>
	<div class="container">	
		<div style="margin-bottom: 10px;">
		<fieldset>
		<legend>Buscar Orden de Compra</legend>     
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
					<div align="right" style="float:right">
					<input type="button" value="Limpiar" class="" id="clearSearchButton" name="clearSearchButton" />					
					<input type="button" value="Buscar" class="" id="searchButton" name="searchButton" />
					</div>			
		</fieldset>  
		</div>
		
		    		<div style="" align="center">
			    		<div style="height: 10px" ></div>
	  						 <table style="text-align: center;" align="center" id="listOCTable">
	             			 </table>	
	             		<div id="listOCTableGrid"></div>
              		</div>
<!--   Comienza EDITAR OC            		 -->
  	<div class="loadingFormEdit" style="display: none;height: 50px;font-size: 40px" align="center">
  		loading...........	
  	</div>
  	<div class="editOCForm" style="display: none;">	
			<hr  id="positionScrollEdit"/>
			<h2 style="margin-bottom:0px" >Editar Orden de Compra</h2>
			<hr/>
        <form id="editOrdenCompraForm" action="" >
	        <div class="span-15"> 
				<fieldset>
            		<legend>Datos del cliente</legend>
   						<input disabled="disabled" type="text" class="text2" id="nombreCSearch" name="nombreCSearch" /> 
				</fieldset>
			</div>
			<div class="span-4 last"> 
				<fieldset>
            		<legend>Fecha</legend>
   						<input disabled="disabled" type="text" class="text2" alt="dateP" id="fechaOC" name="fechaOC" style="width: 80px" />
				</fieldset>
			</div>
			<div class="span-24 last"> 
				<fieldset>
            		<legend>Detalle</legend>
				  		<div style="padding: 0px; position: relative;">
  						 <table style="font-size: 20px" align="center" id="ordenCompraTable">
             			 </table>	
             			 <div id="ordenCompraTableGrid"></div>
             			 </div>   						
				</fieldset>
			</div>
			
			<div class="span-24 last"> 
				<fieldset>           		
            			<label for="condicionesP">Condiciones de pago</label></br>
				  		<textarea class="2" name="payCondition" id="payCondition" rows="5" cols="20"></textarea><br />
				  		<label>Fecha de entrega / colocacion</label>&nbsp;&nbsp;
   						<input type="text" class="text2" alt="dateP" id="fechaCol" name="fechaCol" style="width: 80px" />
   					<span style="float:right;margin-top:10px">						
		              <input type="button" id="saveOCButton" value="Guardar" />
		              <input type="button" value="Cancelar" />	
					</span>
				</fieldset>
			</div>
        </form>
	</div>	        
<!--   FIN EDITAR OC            		 -->
			           		
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