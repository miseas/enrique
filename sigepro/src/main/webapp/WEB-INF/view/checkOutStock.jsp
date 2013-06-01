<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>INV.CONTINUO</title>


<link rel="stylesheet" href="css/style.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="css/templatemo_style.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="css/dropdown-menu.css" type="text/css"	media="screen" />
<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
<link type="text/css" href="css/demos.css" rel="stylesheet" />
<link type="text/css" href="css/mopTip/mopTip-2.2.css" rel="stylesheet" />
<link rel="stylesheet" href="css/estilos.css" type="text/css" />
<link rel="stylesheet" href="css/tablas_datos.css" type="text/css"/>
<link rel="stylesheet" href="css/ui.notify.css" type="text/css"/>
<link rel="stylesheet" href="css/loading.css" type="text/css"/>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />

<style>
	.ui-autocomplete-loading { background: white url('images/ui-anim_basic_16x16.gif') right center no-repeat; }
</style>
	
<%-- <script src='/<%=request.getContextPath()%>/dwr/interface/[YOUR-SCRIPT].js'></script> --%>
<script src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script src='<%=request.getContextPath()%>/dwr/util.js'></script>


<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>

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
<script src="js/jquery.alerts.js" type="text/javascript"></script>
<script type="text/javascript">

var alreadyAddedProducts = "''";

	jQuery(function() {

	 var lastsel; 
	 
	 jQuery("#stockOutTable").jqGrid({
		 url:'server.php?q=2', 
				 datatype: "local", 
				 width : 959,
				 height : 460,
				 colNames : ['<fmt:message key="message.ss.name"/>',  '<fmt:message key="message.cs.quantity"/>', '<fmt:message key="message.ss.quantityInStock"/>', '<fmt:message key="message.ss.price"/>','<fmt:message key="message.cs.total"/>','' ],
					colModel : [ 
					{
						name : 'productName',
						index : 'productName',
						width : 335,
						editable:true						
					}, {
						name : 'productQuantity',
						index : 'productQuantity',
						width : 75,
						editable:true,
						formatter:'integer',
						align:'right'
					}, {
						name : 'productStockQuantity',
						index : 'productStockQuantity',
						width : 75,
						formatter:'integer',
						align:'right'
					}, {
						name : 'productPrice',
						index : 'productPrice',
						width : 85,
						editable:true,
						formatter:'number',
						summaryType:'sum',
						align:'right'
					}, {
						name : 'totalPrice',
						index : 'totalPrice',
						width : 85,
						formatter:'currency',
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
				  pager: '#stockOutTableGrid',
				  pgbuttons: false,
				  pginput:false,
				  rowList: {},
				  sortname: 'invdate', 
				  onSelectRow:function(){},
				  viewrecords: true, 
				  sortorder: "desc", 
				  caption:'<fmt:message key="message.cs.listProducts"/>', 
				  editurl: "dummy.htm",
				  footerrow : true,
				  grouping:true,
				  //userDataOnFooter : true,
				  altRows : true
	  });
	 
	 jQuery("#stockOutTable").jqGrid('bindKeys', {"onEnter":function( rowid ) { onSelectRowTable(rowid); }} );

	 function onSelectRowTable(id){
		 if(id && id!==lastsel){ 
		 jQuery('#stockOutTable').jqGrid('restoreRow',lastsel); 
		 lastsel=id;					 
		 }
		 jQuery('#stockOutTable').jqGrid('editRow',id,true,function(id){
			 						    
			jQuery("#stockOutTable tr[id="+id+"] input").each(function(){
				    // Listen for enter (and shift-enter)
				$(this).bind("keydown",function(e) {

				      if (e.keyCode === 13) {  // Enter key:
				        var increment = e.shiftKey ? -1 : 1;
						//	alert("eee");
				        // Do not go out of bounds
				        //var lastRowInd = jQuery("#grid").jqGrid("getGridParam","reccount");
				        //if ( id+increment == 0 || id+increment == lastRowInd+1)
				          //return;   // we could re-edit current cell or wrap
				        //else{							          
				        	//jQuery("#stockOutTable").jqGrid("editRow",parseInt(id)+parseInt(increment),true);
				        	id = parseInt(id)+parseInt(increment);
				        	setTimeout(function(){				        		
				        		jQuery("#"+id).trigger("click").focus();},50);//(parseInt(id)+parseInt(increment));},50);
				        //}
				      }
				    });
			}); 
			
			jQuery("#stockOutTable tr[id="+id+"] input:eq(4)")
				  
		 },function(){						 
			 var price2 = jQuery("#stockOutTable tr[id="+id+"] input:eq(2)").val();
			 var quantity2 = jQuery("#stockOutTable tr[id="+id+"] input:eq(1)").val();					
			 jQuery('#stockOutTable').jqGrid('setCell',lastsel,"totalPrice",parseFloat(price2*quantity2));
			 var sum = jQuery("#stockOutTable").jqGrid('getCol','totalPrice',false,'sum');
			 jQuery("#stockOutTable").jqGrid('footerData','set',{totalPrice:sum});
			return true;						 
		 },'',{}, function(){
			 	var names = jQuery("#stockOutTable").jqGrid('getCol','productName',false);
			 	jQuery.each(names,function(i,element){						 		
			 		if (i==0){
			 		alreadyAddedProducts="'"+element.toLowerCase()+"'";
			 		}
			 		else{
			 		alreadyAddedProducts+=",'"+element.toLowerCase()+"'";
			 		}
			 		
			 	});
		 		}
		 );
		 
		 
		 jQuery("#stockOutTable tr[id="+id+"] input:eq(0)" ).autocomplete({
				source: function( request, response ) {
					$.ajax({
						url: '<c:url value="/searchByName.htm" />',
						dataType: "json",
						type: "POST",
						data: {
							featureClass: "P",
							style: "full",
							maxRows: 12,
							nameStartWith: request.term,
							nameProduc: alreadyAddedProducts
						},
						success: function( data ) {
							response( jQuery.map( data, function (elementOfArray, indexInArray){							
								return { value: capitaliseFirstLetter(elementOfArray.productName), idItem:elementOfArray.productId
								};											
							}));						
						}
					});
				},
				minLength: 2,
				open: function() {
					//$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
				},
				close: function() {
					//$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
				},
				select: function(event, ui){
					$.ajax({
						url: '<c:url value="/stockProd.htm" />',
						dataType: "json",
						type: "POST",
						data: {
							idProduct: ui.item.idItem									
						},
						success: function(data) {										
							 jQuery('#stockOutTable').jqGrid('setCell',lastsel,"productStockQuantity",data);
							 jQuery('#stockOutTable').jqGrid('setCell',lastsel,"productId",ui.item.idItem);

						}
					});
				}
			}).data( "autocomplete" )._renderItem = function( ul, item ) {
				return $( "<li></li>" )
				.data( "item.autocomplete", item )
				.append( "<a style='font-size:16px'>" + item.label +"</a>" )
				.appendTo( ul );
			};
		 
		     jQuery("#stockOutTable tr[id="+id+"] input:not(:first)" ).bind("keypress",function(event) {
			    var chars = "0123456789.,";
		        var chr = String.fromCharCode(event.charCode == undefined ? event.keyCode : event.charCode);
		        return event.ctrlKey || (chr < ' ' || !chars || chars.indexOf(chr) > -1);
		    });
		  };
	 
	 jQuery("#stockOutTable").jqGrid('navGrid','#stockOutTableGrid',{
			add : false,
			refresh : false,
			edit : false,
			del : false,
			search:false
		},{}).navButtonAdd('#stockOutTableGrid',{
			   caption:'<fmt:message key="message.cs.addRecord"/>', 
			   buttonicon:"ui-icon-plus", 
			   onClickButton: function(){ 
				   
				   var cantRecords = jQuery("#stockOutTable").jqGrid("getGridParam","records");
				   jQuery("#stockOutTable").addRowData(cantRecords,{});

			   }, 
			   position:"first"
			});
	 
	 for(var i=1; i<21;i++){
	 jQuery("#stockOutTable").addRowData(i,{});
	 }

	 
	 
	 jQuery("#stockOutTable tbody>tr>td:eq(1)input" ).autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: '<c:url value="/searchByName.htm" />',
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
							return elementOfArray;
						}));						
					}
				});
			},
			minLength: 2,
			select: function( event, ui ) {			
			},
			open: function() {
				//$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
				//$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
		});
	 
	 jQuery("#gbox_stockOutTable table[class=ui-jqgrid-ftable] tr td:eq(3)").html("Total:");
	  
	 
	 jQuery("#generateBillButton").click(function(){
		   var totalCheckout = jQuery("#stockOutTable").jqGrid('footerData','get','totalPrice').totalPrice;
		   //alert(dwr.util.toDescriptiveString(data,2));
		   var rowData = jQuery("#stockOutTable").jqGrid('getRowData');      
		   jQuery("#stockOutTable tbody>tr" ).each(function(){
			   jQuery(this).removeClass("row-warning");
			   
		   });
		  var ready=0; 
		  var errorType1=false;
		  var errorType2=false;
		  var items = jQuery.map(rowData, function (item, index) {
			    if (item.productName=="") return null; // Removes the element;
			    if (parseInt(item.productQuantity) > parseInt(item.productStockQuantity)){
			    	jQuery("#stockOutTable").jqGrid('setRowData',index+1,null,"row-warning");
			    	ready=1;
			    	errorType1=true;
			    }
			    if (item.productId==""){
			    	jQuery("#stockOutTable").jqGrid('setRowData',index+1,null,"row-warning");
			    	ready=1;
			    	errorType2=true;
			    }
			    return item;
			});
	
		    	
	  		if (ready==0){		 
	  			var nombreClie = jQuery("#clientName").val();
	  			var clientDire = jQuery("#clientDire").val();	 
	  			var clientLoc = jQuery("#clientLoc").val();
	  			var requestNum = jQuery("#requestNum").val();
	  			var clientId = jQuery("#idClientHidden").val();
	  			var clientObj = {'nombreClie':nombreClie,'direccionClie':clientDire,'localidadClie':clientLoc,'nroPed':requestNum };
	  		   // private int idCliente;

	  			
	       jQuery.ajax({
              url: '<c:url value="/dataReport.htm" />',
              type: "POST",
              dataType: "json",
              contentType: "application/json",
              data: JSON.stringify( {'items':items,'totalCheckout':totalCheckout,'client':clientObj} ), 
              success: function(resp){     
            	  
            	  jQuery("#totalProfit").val(resp);
            	  
            	  <sec:authorize access="hasRole('ROLE_ADMIN')" >    
            	  
            	  jQuery( "#dialog-form" ).dialog({
            			autoOpen: false,
            			//height: 90,
            			width: 350,
            			modal:true,
            			resizable: false,
            			draggable: false,
            			buttons: {
            				"Aceptar": function() {
            					jQuery( this ).dialog( "close" );
            					 jQuery("#dialogLoading" ).dialog("open");
            	               window.location.href = "<%=request.getContextPath()%>/generateReport.htm";
            				}
            			},
            			close: function() {
            			}
            		});
            	  jQuery( "#dialog-form" ).dialog( "open" );
            	  
          	    </sec:authorize>
          	    
          	    <sec:authorize ifNotGranted="ROLE_ADMIN">    
                window.location.href = "<%=request.getContextPath()%>/generateReport.htm";
               </sec:authorize>
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
		 jQuery("#stockOutTable").jqGrid("clearGridData");		
		 for(var i=1; i<21;i++){
			 jQuery("#stockOutTable").addRowData(i,{});
			 }
	     jQuery("#stockOutTable").jqGrid('footerData','set',{'totalPrice':''});
	     alreadyAddedProducts = "''";
		 jQuery("#clientName").val("");
  		 jQuery("#clientDire").val("");	 
		 jQuery("#clientLoc").val("");
		 jQuery("#requestNum").val("0");
		 jQuery("#idClientHidden").val("");
	 });
	 
	 
	 function capitaliseFirstLetter(string)
	 {
	     return string.charAt(0).toUpperCase() + string.slice(1);
	 }
	 
	 
	 jQuery("#gview_stockOutTable").css("font-size","20px");
	 jQuery("#pg_stockOutTableGrid table").css("font-size","20px");
	 jQuery("#gview_stockOutTable > div:eq(3)").css("font-size","23px");

	 
	 jQuery("#clientName" ).autocomplete({
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
							return  { value: capitaliseFirstLetter(elementOfArray.nombreClie), idItem:elementOfArray.idCliente,
									 itemDirec:elementOfArray.direccionClie, itemLocal:elementOfArray.localidadClie
							};											
						}));						
					}
				});
			},
			minLength: 2,
			select: function(event, ui){
				 
				jQuery("#clientDire").val(ui.item.itemDirec);
				jQuery("#clientLoc").val(ui.item.itemLocal);
				jQuery("#idClientHidden").val(ui.item.idItem);
			},
			open: function() {
				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
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
	  
	  
	});
</script>

</head>

<body>

	<jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>

	<div id="templatemo_wrapper">
	
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
	
	<div id="dialog-form" style="display: none"   title="Informacion de Factura">
			<form>
			<fieldset>
			<label for="name"><fmt:message key="message.cs.profitGet"/>:</label>
			<input type="text" disabled="disabled" id="totalProfit" />			
			<input type="hidden" id="hiddenIdDialog" name="hiddenIdDialog" />	
			</fieldset>
			</form>
			<table width="100%" >
			<tr><td align="center" >
			</td>
			</tr>
			</table>
	</div>
		
		<div id="templatemo_main_top"></div>
		<div id="templatemo_main">
			<div id="">
				<div class="content_box">
					<h2 style="margin-bottom:5px" ><label><fmt:message key="message.cs.bill"/></label></h2>
					<a href="http://www.templatemo.com/page/1" target="_parent"></a>
					<p><fmt:message key="message.cs.help"/>
					</p>
				
					<div id="settings-template">
						<div class="login-content">
						<fieldset style="border: 2px solid;" ><legend><fmt:message key="message.cs.client"/></legend> 
						<table id="tableClientOut" width="100%">
								<tr id="1" >
								<td width="40%">
								<label style="margin-top:0px" ><fmt:message key="message.cs.clientName"/></label>
								 <input id="clientName" name="clientName" value="" type="text" style="font-size:18px;padding: 4px" />
								 <input type="hidden" id="idClientHidden" value="" />
								</td>
								<td>
								<label style="margin-top:0px" ><fmt:message key="message.cs.requestNum"/></label>
								 <input id="requestNum" name="requestNum" value="0" type="text" style="font-size:18px;padding: 4px;width: 55px;" />
								</td>
								<td>
								<label style="margin-top:0px" ><fmt:message key="message.cs.actualDate"/></label>
								 <input id="actualDate" name="actualDate" value="${actualDate}" disabled="disabled" type="text" style="background-color:grey; font-size:18px;padding: 4px;width: 110px;" />
								</td>
								</tr>
								<tr>						
								<td>
								<label style="margin-top:0px" ><fmt:message key="message.cs.clientDirec"/></label>
								 <input id="clientDire" name="clientDire" value="" style="width:300px;font-size:18px;padding: 4px" type="text" />
								</td>
								<td>
								<label style="margin-top:0px" ><fmt:message key="message.cs.clientLoc"/></label>
								 <input id="clientLoc" name="clientLoc" value="" style="width:300px;font-size:18px;padding: 4px" type="text" />
								</td>	
								<td></td>							
								</tr>								 
						</table>		
						</fieldset>	
						</div>
						
             		<div style="padding: 0px; position: relative; left: -30px;">
  						 <table style="font-size: 25px" align="center" id="stockOutTable">
             			 </table>	
             			 <div id="stockOutTableGrid"></div>
             			 </div>
				<table width="930px"><tr align="right">
				<td></td>
				<td>
				<input id="resetBillButton" type="button" class="orange-button" value="<fmt:message key="message.cs.resetBillButtom"/>" />
				 <input id="generateBillButton" type="button" class="orange-button" value="<fmt:message key="message.cs.generateBillButtom"/>" />								 
				</td></tr></table>
				
				</div>
			</div>
			</div>		
			<div class="cleaner"></div>
		</div>

		<div id="templatemo_main_bottom"></div>
	</div>
	<!-- end of wrapper -->



	<jsp:include flush="true" page="footer.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>

</body>

</html>