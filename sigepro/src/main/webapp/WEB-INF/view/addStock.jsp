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


<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>

<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
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
var alreadyAddedProducts = "''";

		 jQuery("input[name=nameProduct]" ).autocomplete({
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
									return  { value: capitaliseFirstLetter(elementOfArray.productName), idItem:elementOfArray.productId
									};											
								}));						
							}
						});
					},
					minLength: 2,
					select: function(event, ui){
						$.ajax({
							url: '<c:url value="/stockPriceProd.htm" />',
							dataType: "json",
							type: "POST",
							data: {
								idProduct: ui.item.idItem									
							},
							success: function(data) {										
								var trSelected = jQuery("#tableAdd tbody>tr div[class='divArrow arrowSelected']").parent().parent();
								
								trSelected.find(">td:last input").val(data.productQuantity);
								trSelected.find(">td:eq(2) input").val(data.productPrice);
								
							}
						});
						
						 jQuery("#tableAdd input[name='nameProduct']").each(function(i,element){						 		
						 		if (i==0){
							 		alreadyAddedProducts="'"+$(this).val().toLowerCase()+"'";
							 		}
							 		else{
							 		alreadyAddedProducts+=",'"+$(this).val().toLowerCase()+"'";
							 		};
							});		
					},
					open: function() {
						$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
					},
					close: function() {
						$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
					}
				});
		//VALIDATE AND SUBMIT FORM				
			jQuery("#form1").validate({
			    rules: {
			    	example:{required: true,digits:true}
		  
		        },
			    messages: {
			    	example: {required: "campo obligatorio",digits:"campo debe ser numerico"}			    	
			    },
		  	submitHandler: function() { 	  		
		  		var listElements = new Array(); 
		  		jQuery("#tableAdd tbody>tr").each(function(index) {
		  		/* 	if (index==2){
		  				return true;
		  			} */
		  			var newProduct = {'productName':'','productQuantity':'','productPrice':''};
		  			newProduct.productName = jQuery(this).find("input:eq(0)").val();
		  			if (newProduct.productName ==''){
		  				return true;
		  			}
		  			newProduct.productQuantity = jQuery(this).find("input:eq(2)").val();
		  			newProduct.productPrice = jQuery(this).find("input:eq(1)").val().replace(",",".");
					listElements.push(newProduct);
		  		 });
		  		 
                jQuery.ajax({
                     url: '<c:url value="/addNewProduct.htm" />',
                     type: "POST",
                     dataType: "json",
                     contentType: "application/json",
                     data: JSON.stringify( listElements ), 
                     success: function(resp){                                       
                    			jSuccess("Operacion realizada exitosamente", "Guardar",function(){
                    				//var url = "/Examen/empleadoTask.htm?parametro=1";    
                    				//$(location).attr('href',url);
                    				cleanScreenAdd();
                    			},["Aceptar"]);


                    	                                
                     }
                   });
		  		
		  	}
			         
			 });
			
		
	 function cleanScreenAdd(){
		 
		 jQuery("#tableAdd tbody>tr:gt(1)").remove();
		 var firstTr = jQuery("#tableAdd tbody>tr:eq(0)");
		 firstTr.find("input").each(function(index) {
			 jQuery(this).val("");
		 });
		 firstTr.find("input:eq(1)").val("0");
		 firstTr.find("input:eq(3)").val("0"); 
		 firstTr.find("input:eq(0)").focus();
		 alreadyAddedProducts ="''";
		 
	 }

			
	 jQuery("#tableAdd").keypress(function(event) {
		  if ( event.which == 13 ) {			
			  createNewColumAdd();
			  //var msg = "Handler for .keypress() called time(s).";
			  //alert(dwr.util.toDescriptiveString(event,2));
			   }
	 });
	 
	 var addCounterId=2;
	 function createNewColumAdd(){
		jQuery('#cloneExample').clone(true).insertAfter('#tableAdd tbody>tr:last').css("display","").attr("id",addCounterId++)
		.find("input[name=nameProduct]" ).autocomplete({
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
							return  { value: capitaliseFirstLetter(elementOfArray.productName), idItem:elementOfArray.productId
							};											
						}));						
					}
				});
			},
			minLength: 2,
			focus: function() {
				// prevent value inserted on focus
				return false;
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
						jQuery("#tableAdd tbody>tr div[class='divArrow arrowSelected']").parent().parent().find(">td:last input").val(data);
						//alert(dwr.util.toDescriptiveString(this,2));
					}
				});
				
			 jQuery("#tableAdd input[name='nameProduct']").each(function(i,element){						 		
			 		if (i==0){
				 		alreadyAddedProducts="'"+$(this).val().toLowerCase()+"'";
				 		}
				 		else{
				 		alreadyAddedProducts+=",'"+$(this).val().toLowerCase()+"'";
				 		};
				});						 		
		
			},
			open: function() {
				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
		});
	 }
	 
	 jQuery("#tableAdd tbody>tr").hover(
			 function(){ 
				 var div = jQuery(this).find(">td:first div");
				 if (!div.hasClass("arrowSelected")){
					 div.addClass("arrowUnused");
				 }
				 },
			 function(){ 				 
				  jQuery(this).find(">td:first div").removeClass("arrowUnused");
				
	 });
	 
	 jQuery("#tableAdd tbody>tr input").click(function(){
		 jQuery("#tableAdd tbody>tr").find(">td:first div").removeClass("arrowSelected");	 
		 jQuery(this).parents("tr").find(">td:first div").removeClass("arrowUnused").addClass("arrowSelected");
	 });
	 
	 jQuery("#tableAdd tbody>tr input").focus(function(){
		 jQuery("#tableAdd tbody>tr").find(">td:first div").removeClass("arrowSelected");	 
		 jQuery(this).parents("tr").find(">td:first div").removeClass("arrowUnused").addClass("arrowSelected");
	 });
	 
	 jQuery("#tableAdd input[name=quantityAdd]").each( function(){	
			jQuery(this).bind("keypress",function(event) {
		    var chars = "0123456789.";
		    var chr = String.fromCharCode(event.charCode == undefined ? event.keyCode : event.charCode);
		    return event.ctrlKey || (chr < ' ' || !chars || chars.indexOf(chr) > -1);
			});}
	 );
	 
	 jQuery("#tableAdd input[name=priceAdd]").each( function(){	
			jQuery(this).bind("keypress",function(event) {
		    var chars = "0123456789.,";
		    var chr = String.fromCharCode(event.charCode == undefined ? event.keyCode : event.charCode);
		    return event.ctrlKey || (chr < ' ' || !chars || chars.indexOf(chr) > -1);
			});}
	 );
	 
	 
	 function capitaliseFirstLetter(string)
	 {
	     return string.charAt(0).toUpperCase() + string.slice(1);
	 }


	}); //end doc.Ready
</script>

</head>

<body>

	<jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>



	<div id="templatemo_wrapper">

		<div id="templatemo_main_top"></div>
		<div id="templatemo_main">
		<form id="form1">
			<div id="">
				<div class="content_box">
					<h2><label><fmt:message key="message.as.addProducts"/></label></h2>
					<a href="http://www.templatemo.com/page/1" target="_parent"></a>
					<p><fmt:message key="message.as.help"/>
					</p>
				


					<div id="settings-template">
						<div class="login-content">
						<table id="tableAdd">
								<tr id="1" >
								<td>
								<label></label>
								<div title="arrow" class="divArrow arrowSelected"></div>
								</td>
								<td>
								<label><fmt:message key="message.as.name"/></label>
								 <input name="nameProduct" value="" type="text" />
								</td>
								<td> 
								<label style="margin-left: 10px" ><fmt:message key="message.as.price"/></label>
								<input name="priceAdd" value="0" maxlength="5" style="text-align:right; width:40px;margin-left: 10px" type="text" />								
								</td>
								<td> 
								<label style="margin-left: 10px" ><fmt:message key="message.as.quantity"/></label>
								<input name="quantityAdd" value="" maxlength="5" style="text-align:right; width:40px;margin-left: 10px" type="text" />								
								</td>
								<td> 
								<label style="margin-left: 10px"><fmt:message key="message.as.quantityInStock"/></label>
								<input name="inStockAdd" disabled="disabled" value="0" maxlength="5" style="background:#CEC6C6; text-align:right; width:40px; margin-left: 10px" type="text" />								
								</td>
								</tr> 
								<tr id="cloneExample" style="display: none">
								<td>
								<label></label>
								<div title="arrow" class="divArrow"></div>
								</td>
								<td>
								<label><fmt:message key="message.as.name"/></label>
								 <input name="nameProduct" value="" type="text" />
								</td>
								<td> 
								<label style="margin-left: 10px" ><fmt:message key="message.as.price"/></label>
								<input name="priceAdd" value="0" maxlength="5" style="text-align:right; width:40px;margin-left: 10px" type="text" />								
								</td>
								<td> 
								<label style="margin-left: 10px" ><fmt:message key="message.as.quantity"/></label>
								<input name="quantityAdd" value="" maxlength="5" style="text-align:right; width:40px;margin-left: 10px" type="text" />								
								</td>
								<td> 
								<label style="margin-left: 10px"><fmt:message key="message.as.quantityInStock"/></label>
								<input   name="inStockAdd" disabled="disabled" value="0" maxlength="5" style="background:#CEC6C6; text-align:right; width:40px; margin-left: 10px" type="text" />								
								</td>
								</tr> 
						</table>
						</div>
					</div>

				</div>
							<table width="100%"><tr ><td width="100%" align="right">
			<input type="button" onclick="jQuery('#form1').submit();" class="orange-button" value="Guardar" />
			</td></tr>
			</table>
			</div>		
		</form>
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