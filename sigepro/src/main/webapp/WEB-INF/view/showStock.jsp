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

<!-- jquery slider -->
<script type="text/javascript">


	jQuery(function() {

		jQuery("#searchResultTable").jqGrid(
				{
					height : 'auto',
					width: 500,
			        url:'',
			        datatype: 'json',
			        mtype: 'GET',
					colNames : [ '<fmt:message key="message.ss.name"/>', '<fmt:message key="message.ss.quantityInStock"/>', '<fmt:message key="message.ss.price"/>' ],
					colModel : [ {
						name : 'productName',
						index : 'productName',
						width : 130,
					}, {
						name : 'productQuantity',
						index : 'productQuantity',
						width : 130,
						sorttype : "int"
					}, {
						name : 'productPrice',
						index : 'productPrice',
						width : 130,
						sorttype : "int"
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
					editurl : 'consults.htm',
					viewrecords : true,
					pager : '#pagersearchResultTable',
					caption : '<fmt:message key="message.ss.product"/>'
				}).navGrid('#pagersearchResultTable', {
			add : false,
			refresh : false,
			edit : false,
			del : false
		}, {}, {}, {
			onclickSubmit : function() {
			}
		});


	function log( message ) {
			$( "<div/>" ).text( message ).prependTo( "#log" );
			$( "#log" ).scrollTop( 0 );
		}
	
	
	
	 
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
						/*response( $.map( data.geonames, function( item ) {
							return {
								label: item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName,
								value: item.name
							}
						}));*/
						//alert(dwr.util.toDescriptiveString(data,2));
						response( jQuery.map( data, function (elementOfArray, indexInArray){							
							return elementOfArray.productName;
						}));						
					}
				});
			},
			minLength: 2,
			select: function( event, ui ) {
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
	 
	 function searchProduct(){
		 
		 

		 /*jQuery.ajax({
             url: '<c:url value="/searchProduct.htm" />',
             type: "POST",
             dataType: "json",
             contentType: "application/json",
             data: {name:name}, 
             success: function(resp){                                       
               alert("volvio bien");                                      
             }
           });*/
	 }

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
					<h2><label><fmt:message key="message.ss.searchProducts"/></label></h2>
					<a href="http://www.templatemo.com/page/1" target="_parent"></a>
					<p><fmt:message key="message.ss.help"/>
					</p>
				


					<div id="settings-template">
						<div class="login-content">
						<table id="">
								<tr id="" >
								<td>
								<label><fmt:message key="message.ss.name"/></label>
								 <input  id="nameProduct" style="float:none" name="nameProduct" value="" type="text" /> 
								 <input id="searchButton" type="button" class="orange-button" value="<fmt:message key="message.ss.searchProducts"/>" />								 
								</td>
							</tr>
						</table>				
					</div>
							<div  align="center" id="showHideTable" style="display: none; margin:20px 0 0 0" >		
					     <table id="searchResultTable">
             			 </table>	
             			 <div id="pagersearchResultTable"></div>
             			 </div>

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