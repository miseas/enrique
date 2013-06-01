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

<!-- jquery slider -->
<script type="text/javascript">
	jQuery(function() {
		
		function updateAlert(row){
			
		 var alertObject = {'idProd':row.idProd,'idAlerta':row.idAlerta,'cantminAlerta':row.cantminAlerta};
		 			 
		     jQuery.ajax({
		          url: '<c:url value="/addAlert.htm" />',
		          type: "POST",
		          dataType: "json",
		          contentType: "application/json",
		          data: JSON.stringify( alertObject ), 
		          success: function(resp){                                       
					jQuery("#searchResultTable").trigger('reloadGrid');
		          }
		        });
			
		}
		
		 function delAlert(idAlertParam){
			   jQuery.ajax({
			          url: '<c:url value="/delAlert.htm" />',
			          type: "GET",
			          dataType: "json",
			          contentType: "application/json",
			          data: {idAlert:idAlertParam}, 
			          success: function(resp){                                       
						jQuery("#searchResultTable").trigger('reloadGrid');
			          }
			        });	 
		 }

		
		jQuery("#searchResultTable").jqGrid(
				{
					height : 'auto',
					width: 500,
					url: '<c:url value="/loadAllAlerts.htm"/>',
			        datatype: 'json',
			        mtype: 'GET',
					colNames : [ '','','','<fmt:message key="message.ss.name"/>', '<fmt:message key="message.ls.quantityMin"/>'],
					colModel : [
						{name: 'myac',
						 width:80, 
						 fixed:true, 
						 sortable:false, 
						 resize:false, 
						 formatter:'actions', 
						 formatoptions:{keys:true,afterSave:function(idrow,data){
							// var value = jQuery('#searchResultTable').jqGrid('getCell',idrow,"cantminAlerta");
							 var row = jQuery('#searchResultTable').jqGrid('getRowData',idrow);
							 
							 updateAlert(row);							 
						 }, delOptions: {
							 beforeSubmit:function(formid){
								 		 var idAlert = jQuery('#searchResultTable').jqGrid('getCell',formid,"idAlerta");
								 		 delAlert(idAlert);
										 return [true,''];}} }
					}, {
						name : 'idProd',
						index : 'idProd',
						width : 1,						
						hidden:true
					}, {
						name : 'idAlerta',
						index : 'idAlerta',
						width : 1,						
						hidden:true
					}, {
						name : 'nombreProd',
						index : 'nombreProd',
						width : 130
					}, {
						name : 'cantminAlerta',
						index : 'cantminAlerta',
						formatter:'integer',						
						width : 130,
						sorttype : "int",
						editable: true
					} ],
					//ondblClickRow: function(id){ getAffiliateFullInfo(id);},
					emptyrecords: "Empty records",											    							
					imgpath : 'css/',
					autowidth : true,
				    jsonReader : {
		                  root: "rows",
		                  page: "page",
		                  total: "total",
		                  records: "records",
		                  repeatitems: false,
		                  id: "id"
		              },
					onSelectRow : function(id) {
						//alert(jQuery("#tabs ul li").size());
						/*if (jQuery("#tabs ul li").size() != 2) {
							jQuery("#tabs").tabs("add", "#hideResultProperty",
									"Informacion Inmueble", 2);
							loadDummyData(id);
							jQuery('#hideResultProperty').show();
							jQuery("#tabs").tabs("select", 2);
							jQuery("#tabs ul > li:eq(1) a").trigger('click');
						} else if (jQuery("#tabs ul li").size() == 2) {
							//jQuery("#tabs").tabs( "remove" , 1 );			
							//jQuery('#hideResultProperty').show();
							loadDummyData(id);
							jQuery("#tabs ul > li:eq(1)").show();
							jQuery("#tabs").tabs("select", 2);
							jQuery("#tabs ul > li:eq(1) a").trigger('click');
							//jQuery("#tabs").tabs( "add" ,"#hideResultProperty"  , "Informacion Inmueble",1 );
						}*/
					},
					rownumbers : true,
					hiddengrid : false,
					editurl : 'dummy.htm',
					viewrecords : true,
					pgbuttons: false,
					pginput:false,
					rowList: {},
					pager : '#pagersearchResultTable',
					caption : '<fmt:message key="message.ls.alerts"/>'
				}).navGrid('#pagersearchResultTable', {
			add : false,
			refresh : true,
			edit : false,
			del : false,
			search: false
		}, {}, {}, {
			onclickSubmit : function() {
			}
		});
		
		
		 for(var i=1; i<2;i++){
			 jQuery("#searchResultTable").addRowData(i,{});
			 }

		
	 var lastProductId;
	 jQuery( "#nameProduct" ).autocomplete({
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
						//alert(dwr.util.toDescriptiveString(data,2));
						response( jQuery.map( data, function (elementOfArray, indexInArray){							
							return { value: elementOfArray.productName, idItem: elementOfArray.productId
							};											
						}));						
					}
				});
			},
			minLength: 2,
			select: function( event, ui ) {	
				lastProductId = ui.item.idItem;
			},
			open: function() {
				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
		});
	 
	 
	 jQuery("#searchButton").click(function(){
		 var name = jQuery("#nameProduct").val();
	       jQuery("#searchResultTable").jqGrid('setGridParam',{url:"<c:url value="/searchProduct.htm" />?name="+name,page:1}).trigger('reloadGrid');
	       jQuery("#showHideTable").fadeIn(); 
	 });
	 
	 jQuery("#addAlertButton").click(function(){

		 var quantityMin =  jQuery("#quantityAdd").val();
		 var alertObject = {'idProd':lastProductId,'cantminAlerta':quantityMin};		
			
     jQuery.ajax({
          url: '<c:url value="/addAlert.htm" />',
          type: "POST",
          dataType: "json",
          contentType: "application/json",
          data: JSON.stringify( alertObject ), 
          success: function(resp){                                       
			jQuery("#searchResultTable").trigger('reloadGrid');
			jQuery("#nameProduct").val("");
			jQuery("#quantityAdd").val("");
          }
        });
		 
	 });
	 
	 
	 function getAlertActual(){
	 
	  jQuery.ajax({
          url: 'getAlertProducts.htm',
          type: "GET",
          dataType: "json",
          contentType: "application/json",
          data: {}, 
          success: function(resp){      
        	  jQuery.each(resp,function(i,item){
        		  
        		  jQuery("#actualAlerts")
        		  .append('<p style="color:red;">El producto <b>'+item.nombreProd+'</b> solo tiene <b>'+item.cantProducto+'</b> unidades en stock.(minima de '+item.cantminAlerta+' productos)</p>');
		  		    				 
        	  });
        	  
     }});
	  
	 }
	 
	 getAlertActual();
	 
	 
	 jQuery("#switchAlert").click(function(){
		 var state=1;
			   if (jQuery("#switchAlert:checked").length==1){
				   var state=0;		   
			   } 
				   jQuery.ajax({
				          url: 'setEnaDisAlert.htm',
				          type: "GET",
				          dataType: "json",
				          contentType: "application/json",
				          data: {state:state}, 
				          success: function(resp){      
				        	  jSuccess("Operacion realizada exitosamente", "Habilitar/Deshabilitar",function(){
                  				//var url = "/Examen/empleadoTask.htm?parametro=1";    
                  				//$(location).attr('href',url);
                  				cleanScreenAdd();
                  			},["Aceptar"]);
				        	  
				     }});
			   

		 
	 });
	 
	});
</script>

</head>

<body>

	<jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>


	<div id="templatemo_wrapper">

		<div id="templatemo_main_top"></div>
		<div id="templatemo_main">
			<div id="">
				<div class="content_box">
					<h2><label><fmt:message key="message.ls.alerts"/></label></h2>
					<p><fmt:message key="message.ls.help"/>
					</p>
				


					<div id="settings-template">
						<div class="login-content">
						<table id="">
								<tr id="" >
								<td>
								<label><fmt:message key="message.ls.name"/></label>
								 <input  id="nameProduct" style="float:none" name="nameProduct" value="" type="text" /> 
								 </td>								
								<td> 
								<label style="margin-left: 1px" ><fmt:message key="message.ls.quantityMin"/></label>
								<input id="quantityAdd" name="quantityAdd" value="" maxlength="5" style="text-align:right; width:40px;margin-left: 10px" type="text" />
								</td>
								<td valign="bottom">
								<input id="addAlertButton" type="button" class="orange-button" value="<fmt:message key="message.ls.addAlert"/>" style="margin:0px"  />							
								</td>
							</tr>
						</table>								
					</div>
							<div  align="center" style="margin:20px 0 0 0" >		
					     <table id="searchResultTable">
             			 </table>	
             			 <div id="pagersearchResultTable"></div>
             			 </div>

				</div>
				<fieldset style="border: 1px solid;margin-top: 5px;">
				<div>				
				
								<label><fmt:message key="message.ls.switchAlerts"/></label>
								<input id="switchAlert"   <c:if test="${disableAlert}"> checked="checked"</c:if> type="checkbox"  />							
				</div>
				</fieldset>
				<div style="padding-top: 20px;font-size: 15px;"><p style="margin: 0px"><label><b><fmt:message key="message.ls.actualAlerts"/>:</b></label></p></div>
				<div id="actualAlerts"></div>
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