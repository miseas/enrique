<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<html>

<head profile="http://gmpg.org/xfn/11">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>INV.CONTINUO</title>
       
        
		<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/templatemo_style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/dropdown-menu.css" type="text/css" media="screen" />                
        <link rel="stylesheet" type="text/css" media="screen" href="css/jquery-ui-1.8.16.custom.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
	    <link rel="stylesheet" href="css/ui.notify.css" type="text/css"/>
	    
        
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.pack.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="js/jcarousellite1.0.1_min.js"></script>
    	<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
		<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>		
		<script type="text/javascript" src="js/jquery.notify.js"></script>
		<script type="text/javascript" src="js/notifycation.js"></script>
		
		
        
        
<!-- jquery slider -->
<script type="text/javascript">
jQuery(function() {
	jQuery("#j_username").focus();

<sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	jQuery("div[lang='loginDivData']").hide();
	jQuery("div[lang='alreadyLoggued']").show();
</sec:authorize>

});
</script>

</head>
	
<body>		

<jsp:include flush="true" page="header.jsp">
	<jsp:param name="left" value="1" />
</jsp:include>



	<div id="templatemo_wrapper">
  
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main" lang="loginDivData" >
    <span>
    <img src="css/images/templatemo_vertical_divider.png" style="height: 100%; position: absolute; width: 2px;" />
    </span>
<!--     <span id="main_bottom"></span> -->
        <div id="templatemo_sidebar">                
        	<div class="sidebar_box">
            	<div align="center" class="sb_title"><fmt:message key="message.loginTitle"/></div>
                <div class="sb_content">
                	<div id="login_form">
  						<form action="j_spring_security_check" method="post">
                        	<p><span><fmt:message key="message.userName"/>:</span>
                            <input type="text" id="j_username" name="j_username" class="login_input" />
                            </p>
                            <p><span><fmt:message key="message.userPassword"/>:</span>
                            <input type="password" id="j_password" name="j_password" class="login_input" />
                            </p>
                            <div align="center">
                            <input type="submit" name="submit" class="orange-button" value="Login " />
                            </div>
                        </form>
					</div>                  
                </div>
                <div class="sb_bottom"></div>            
            </div>
 
            <div class="cleaner"></div>
        </div>
        
         <!-- end of sidebar -->
        
        <div id="templatemo_content">        	
            <div class="content_box">
            	<h2><fmt:message key="message.os.title"/></h2>
                <a href="http://www.templatemo.com/page/1" target="_parent"></a>
                <p><fmt:message key="message.os.info"/></p>
              <p><a href="#"><fmt:message key="message.os.help"/></a></p>    
                 
          </div>
        </div>
        
        <div class="cleaner"></div>    
    </div>
    
<!--     CUANDO YA SE LOGUEO! -->
    <div lang="alreadyLoggued" style="display: none" id="templatemo_main">
           
        <div align="center" id="">        	
            <div class="content_box">
            	<h2><fmt:message key="message.os.title"/></h2>
                <a target="_parent" href="http://www.templatemo.com/page/1"></a>
                <p><fmt:message key="message.os.info2"/>
                		 <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
						 <strong><sec:authentication property="principal.username"/></strong>
						 </sec:authorize>
					</br>
                	<fmt:message key="message.os.info3"/></p>
               	<c:url value="/logout" var="logoutUrl"/>	  
              <p><a href="${logoutUrl}" style="font-size: 20px;" ><fmt:message key="message.os.leave"/></a></p>    
                 
          </div>
        </div>
        
        <div class="cleaner"></div>    
    </div>
    
    <div id="templatemo_main_bottom">
    </div>

  
</div> <!-- end of wrapper -->




		<jsp:include flush="true" page="footer.jsp">
			<jsp:param name="left" value="1" />
		</jsp:include>
		
			</body>

</html>