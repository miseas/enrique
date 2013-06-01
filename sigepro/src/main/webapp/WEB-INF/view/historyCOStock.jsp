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
<!-- jquery slider -->
<script type="text/javascript">

var alreadyAddedProducts = "''";

	jQuery(function() {

		
	 jQuery("#stockOutTable").jqGrid({
				 url:'<c:url value="/viewRequestHistory.htm" />', 
				 datatype: "json", 
				 width : 600,
				 height : 460,
				 colNames : ['<fmt:message key="message.ph.requestNum"/>',  '<fmt:message key="message.ph.nameClient"/>', '<fmt:message key="message.ph.profit"/>', '<fmt:message key="message.ph.date"/>' ],
					colModel : [ 
					{
						name : 'nroPed',
						index : 'nroPed',
						width : 80,
						align:'right'
					}, {
						name : 'nombreClie',
						index : 'nombreClie',
						width : 300,
					}, {
						name : 'gananciaPed',
						index : 'gananciaPed',
						width : 75,
						formatter:'integer',
						align:'right'
					}, {
						name : 'fechaPed',
						index : 'fechaPed',
						width : 100
					}],
					ondblClickRow: function(id ){},
				  rowNum:10, 
				  rowList:[10,20,30], 
				  pager: '#stockOutTableGrid',
				  pgbuttons: false,
				  pginput:false,
				  rowList: {},
				  jsonReader : {
	                  root: "rows",
	                  page: "page",
	                  total: "total",
	                  records: "records",
	                  repeatitems: false,
	                  id: "id"
	              },				   
				  onSelectRow:function(){},
				  viewrecords: true, 
				  sortorder: "desc", 
				  caption:'<fmt:message key="message.ph.requestTable"/>', 
				  editurl: "dummy.htm"
				  });
	 
	 jQuery("#stockOutTable").jqGrid('bindKeys', {"onEnter":function( rowid ) { onSelectRowTable(rowid); }} );

	 
	 jQuery("#gview_stockOutTable").css("font-size","15px");
	 jQuery("#pg_stockOutTableGrid table").css("font-size","15px");
	 
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
					<h2><label><fmt:message key="message.ph.title"/></label></h2>
					<p><fmt:message key="message.ph.help"/>
					</p>
				
					<div id="settings-template">
						<div class="login-content">
						</div>
						
             		<div style="" align="center">
  						 <table style="font-size: 20px" align="center" id="stockOutTable">
             			 </table>	
             			 <div id="stockOutTableGrid"></div>
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