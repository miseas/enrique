<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>

<html>
	<jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>


<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="css/demos.css"  />
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
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript" src="js/excanvas.js" ></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript" src="js/jquery.notify.js"></script>
<script type="text/javascript" src="js/notifycation.js"></script>
<script type="text/javascript" src="js/jquery.alerts.js"></script>
<script type="text/javascript" src="js/jquery.raty.min.js"></script>
<script type="text/javascript" src="js/jquery.scrollTo-min.js" ></script>  

<script type="text/javascript">
jQuery(function() {
 	  jQuery( "#dialog-form" ).dialog({
			autoOpen: false,
			//height: 90,
			width: 990,
			modal:true,
			resizable: false,
			draggable: false,
			buttons: {
				"Aceptar": function() {
					jQuery('#addClientForm').submit();
	               //window.location.href = "<%=request.getContextPath()%>/generateReport.htm";
				},
				"Cancelar":function(){
					jQuery( this ).dialog("close");
				}
			},
			close: function() {
			}
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
 	  
 	 jQuery( "#addNewClient" ).click(function(){
 		jQuery( "#dialog-form" ).dialog( "open" ); 
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
  		var telNew = jQuery("#telC").val();
  		var cuitNew = jQuery("#cuitC").val();
  		var puntuaNew = jQuery('#puntuacionStart input[name=score]').val();
  		var comentNew = jQuery("#comentC").val();
  		var cuentaCNew = jQuery("#ccC").val();
  		  		
  		var newClient = {'nombre':nombreNew,'apellido':apellidoNew,'direccion':direccionNew,
  					    'localidad':localidadNew,'email':emailNew,'telefono':telNew,
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
            				cleanScreenAdd();
            		  		jQuery("#dialog-form").dialog( "close" );
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
	
 	cleanScreenAdd();

     var lastsel; 
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
								itemTel:elementOfArray.telefono, itemCuit:elementOfArray.cuit
							};											
						}));						
					}
				});
			},
			minLength: 1,
			select: function(event, ui){
					jQuery.data(document.body,"clientData",{"idcliente":ui.item.idItem,"direccion":ui.item.itemDirec,
															"localidad":ui.item.itemLocal,"telefono":ui.item.itemTel,
															"cuit":ui.item.itemCuit} );
// 					jQuery("#clientDire").val(ui.item.itemDirec);
// 					jQuery("#clientLoc").val(ui.item.itemLocal);
// 					jQuery("#idClientHidden").val(ui.item.idItem);
				
// 				 jQuery("#tableAdd input[name='nameProduct']").each(function(i,element){						 		
// 				 		if (i==0){
// 					 		alreadyAddedProducts="'"+$(this).val().toLowerCase()+"'";
// 					 		}
// 					 		else{
// 					 		alreadyAddedProducts+=",'"+$(this).val().toLowerCase()+"'";
// 					 		};
// 					});		
			},
			open: function() {
// 				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
// 				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
		});
	 
	 
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
			     var setedByUser=false;		    
				jQuery("#ordenCompraTable tr[id="+id+"] input").each(function(){
					    // Listen for enter (and shift-enter)
					$(this).bind("keydown",function(e) {
	
						  if (e.currentTarget.attributes.name.value=="productTotalPrice"){
							  setedByUser = true;
					       }
					      if (e.keyCode === 13) {  // Enter key:
					    	  if(!setedByUser){
					    		  //auto calculate the totalprice of the product
						    	 var price2 = jQuery("#ordenCompraTable tr[id="+id+"] input:eq(3)").val();
								 var quantity2 = jQuery("#ordenCompraTable tr[id="+id+"] input:eq(0)").val();				
								 jQuery("#ordenCompraTable tr[id="+id+"] input:eq(4)").val(parseFloat(price2*quantity2));
								 setedByUser = false;
					    	  }
					    	var increment = e.shiftKey ? -1 : 1;
				        	id = parseInt(id)+parseInt(increment);
				        	setTimeout(function(){				        		
				        		jQuery("#"+id).trigger("click").focus();},50);
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
		   caption:'Agregar Fila', 
		   buttonicon:"ui-icon-plus", 
		   onClickButton: function(){ 			   
			   var cantRecords = jQuery("#ordenCompraTable").jqGrid("getGridParam","records");
			   jQuery("#ordenCompraTable").addRowData(cantRecords,{});	
		   }, 
		   position:"first"
		});
	
	 for(var i=1; i<10;i++){
		 jQuery("#ordenCompraTable").addRowData(i,{});
	}
	 
	 jQuery("#gbox_ordenCompraTable table[class=ui-jqgrid-ftable] tr td:eq(3)").html("Total:");


	 
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
	 
	 jQuery("#fechaOC").datepicker('setDate', new Date());
	 
	 
	 
	 
	 jQuery("#generateBillButton").click(function(){
		   var totalCheckout = jQuery("#ordenCompraTable").jqGrid('footerData','get','productTotalPrice').productTotalPrice;
		   //alert(dwr.util.toDescriptiveString(data,2));
		   var rowData = jQuery("#ordenCompraTable").jqGrid('getRowData');      
// 		   jQuery("#ordenCompraTable tbody>tr" ).each(function(){
// 			   jQuery(this).removeClass("row-warning");			   
// 		   });
		  var ready=0; 
		  var errorType1=false;
		  var errorType2=false;
		  //var items = rowData;
		  //Usado para cambiar de color los campos que estuvieran mal, y generar las variables de error
		  var items = jQuery.map(rowData, function (item, index) {
			   if (item.productDescription=="") return null; // Removes the element;
// 			    if (parseInt(item.productQuantity) > parseInt(item.productStockQuantity)){
// 			    	jQuery("#stockOutTable").jqGrid('setRowData',index+1,null,"row-warning");
// 			    	ready=1;
// 			    	errorType1=true;
// 			    }
// 			    if (item.productId==""){
// 			    	jQuery("#stockOutTable").jqGrid('setRowData',index+1,null,"row-warning");
// 			    	ready=1;
// 			    	errorType2=true;
// 			    }
			    return item;
			});
	
		    	
	  		if (ready==0){		 
	  			var nombreClie = jQuery("#nombreCSearch").val();
	  			var fechaReporte = jQuery("#fechaOC").val();
	  			var fechaEntrega = jQuery("#fechaCol").val();
	  			var condPago = jQuery("#payCondition").val();
// 	  			var clientDire = jQuery("#clientDire").val();	 
// 	  			var clientLoc = jQuery("#clientLoc").val();
// 	  			var requestNum = jQuery("#requestNum").val();
// 	  			var clientId = jQuery("#idClientHidden").val();
				var clientObj = jQuery.data(document.body,"clientData");
				//alert(clientObj.localidad);
// 	  			var clientObj = {'nombreClie':nombreClie,'direccionClie':clientDire,'localidadClie':clientLoc,'nroPed':requestNum };
				jQuery.extend(clientObj,{"nombre":nombreClie});
	  		   // private int idCliente;

	  			
	       jQuery.ajax({
            url: '<c:url value="/dataReport.htm" />',
            type: "POST",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify( {'items':items,'totalPriceOrder':totalCheckout,'client':clientObj, 'payCondition':condPago,'dateReport':fechaReporte,'dateDelivery':fechaEntrega} ), 
            success: function(resp){     
          	  
//           	  jQuery("#totalProfit").val(resp);
          	  
//           	  <sec:authorize access="hasRole('ROLE_ADMIN')" >    
          	  
//           	  jQuery( "#dialog-form" ).dialog({
//           			autoOpen: false,
//           			height: 90,
//           			width: 350,
//           			modal:true,
//           			resizable: false,
//           			draggable: false,
//           			buttons: {
//           				"Aceptar": function() {
//           					jQuery( this ).dialog( "close" );
//           					 jQuery("#dialogLoading" ).dialog("open");
//<%--           	               window.location.href = "<%=request.getContextPath()%>/generateReport.htm"; --%>
//           				}
//           			},
//           			close: function() {
//           			}
//           		});
//           	  jQuery( "#dialog-form" ).dialog( "open" );
          	  
//         	    </sec:authorize>
        	     jQuery("#dialogLoading" ).dialog("open");
	              window.location.href = "<%=request.getContextPath()%>/generateReport.htm?reportNum="+resp;
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
	 
	 
	 jQuery("#resetBillButton").click(function(){
		 jQuery("#ordenCompraTable").jqGrid("clearGridData");		
		 for(var i=1; i<10;i++){
			 jQuery("#ordenCompraTable").addRowData(i,{});
		 }
	     jQuery("#ordenCompraTable").jqGrid('footerData','set',{'totalPrice':''});
		 jQuery("#payCondition").val("");
  		 jQuery("#fechaCol").val("");
  		 $(document).scrollTo( $('#firstDivScroll'), 700 );
	 });
	 
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
	  
}); //end of jquery ready

function cleanScreenAdd(){
	 jQuery("#nombreC").val("");
	  	 jQuery("#apellidoC").val("");
		 jQuery("#direccionC").val("");
		 jQuery("#localidadC").val("");
		 jQuery("#emailC").val("");
		 jQuery("#telC").val("");
		 jQuery("#cuitC").val("");
		 jQuery('#puntuacionStart').raty('cancel', false);
		 jQuery("#comentC").val("");
		 jQuery("#ccC").val("");
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
			</br>
			<h2>Orden de compra</h2>
        <form id="ordenCompraForm" action="" method="post">
	        <div class="span-15" id="firstDivScroll"> 
				<fieldset>
            		<legend>Datos del cliente</legend>
   						<input type="text" class="text2" id="nombreCSearch" name="nombreCSearch" placeholder="Buscar cliente existente" /> &nbsp;&nbsp;ó&nbsp;&nbsp;
   						<input type="button" onclick="" id="addNewClient"  value="Agregar nuevo" />
   						
				</fieldset>
			</div>
			<div class="span-4 last"> 
				<fieldset>
            		<legend>Fecha</legend>
   						<input type="text" class="text2" alt="dateP" id="fechaOC" name="fechaOC" style="width: 80px" />
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
		              <input type="button" id="generateBillButton" value="Guardar y Generar reporte" />
		              <input type="button" value="Borrar" id="resetBillButton" />	
					</span>
				</fieldset>
			</div>

        </form>
        <div id="dialog-form" style="display: none"   title="Agregar nuevo cliente">
        <form id="addClientForm" action="" method="post">
	        	<div class="span-8">    
					<label for="nombreC">Nombre</label></br>
						<input type="text" class="text2" id="nombreC" name="nombreC" /></br>
					<label for="apellidoC">Apellido</label></br>
						<input type="text" class="text2" id="apellidoC" name="apellidoC" /></br>
					<label for="direccionC">Dirección</label></br>
						<input type="text" class="text2" id="direccionC" name="direccionC" /></br>
				</div>
				<div class="span-8">    
					<label for="localidadC">Localidad</label></br>
						<input type="text" class="text2" id="localidadC" name="localidadC" /></br>
					<label for="emailC">Correo electrónico</label></br>
						<input type="text" class="text2" id="emailC" name="emailC" /></br>
					<label for="telC">Teléfono</label></br>
						<input type="text" class="text2" id="telC" name="telC" /></br>			  
				</div>	
				<div class="span-8 last">		  
					<label for="ccC">CC</label></br>
						<input type="text" class="text2" id="ccC" name="ccC" /></br>
					<label for="cuitC">CUIT</label></br>
						<input type="text" class="text2" id="cuitC" name="cuitC" /></br>
					<label for="puntuacionC">Puntuación</label></br>
					<div id="puntuacionStart" style="margin-top:5px; float: left;"></div><span style="font-size: 18px" id="hint"></span>
				</div>				 
				<div class="span-24 last">							 
					<label for="comentC">Comentario</label></br>
				  		<textarea name="comentC" id="comentC" rows="5" cols="20" style="width: 950px"></textarea>
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
   
<div id="footer">
	<div class="container">	
		<div class="span-24 prepend-top last">
				Pie...
		</div>
	</div>
</div>


</body>
</html>