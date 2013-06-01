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
<script type="text/javascript" src="js/jquery.history.js"></script>


<!-- jquery slider -->
<script type="text/javascript">


	/*jQuery(function() {
	 
		jQuery("#helpLink").click(function(){
			
 			jQuery('#dinamicLoadDiv').load('help2.htm');
		});
		
		jQuery("#helpLinkImages").click(function(){
			
 			jQuery('#dinamicLoadDiv').load('help3.htm');
		});
		
		
	});*/
	
	
	function pageload(hash) {
		// hash doesn't contain the first # character.
		if(hash) {
		// restore ajax loaded state
		jQuery("#dinamicLoadDiv").load(hash);
		} else {
		// start page
		jQuery("#dinamicLoadDiv").load("help1.htm");
		}
	}

	
	jQuery(function() {

	// Initialize history plugin.	
	jQuery.history.init(pageload);
	// set onlick event for buttons
	jQuery("#helpLink").click(function(){
		jQuery.history.load("help2.htm");
	return false;
	});
	jQuery("#helpLinkImages").click(function(){
		jQuery.history.load("help3.htm");
	return false;
	});
	
	});
</script>




</head>

<body>

    <div id="header">
    
    <ul id="navigation" class="nav-main">
	<li><a href="<%=request.getContextPath()%>/help.htm">Inicio</a></li>
    <li><a href="#" id="helpLink" >Ayuda1</a></li>
    <li><a href="#" id="helpLinkImages" >Ayuda2</a></li>
    <li style="float: left; position: absolute; left: 785px; width: 1px; cursor: auto;" ></li>
    </ul>
     </div>



	<div id="templatemo_wrapper">

		<div id="templatemo_main_top"></div>
		<div id="templatemo_main">
			<div id="dinamicLoadDiv">
				<div class="content_box">
					<h2><label><fmt:message key="message.hs.helpTitle"/></label></h2>
					<p><fmt:message key="message.hs.help"/>
					</p>
					<p style="color: black;"><b>*<fmt:message key="message.hs.help3"/></b></p>
					<p style="color: black;"><b>*<fmt:message key="message.hs.help4"/></b></p>
					<div id="settings-template">
						<div class="login-content">
					</div>

				</div>
			</div>
			</div>		
			<div class="cleaner"></div>
		</div>

		<div id="templatemo_main_bottom"></div>
	</div>
	<!-- end of wrapper -->

</body>

</html>