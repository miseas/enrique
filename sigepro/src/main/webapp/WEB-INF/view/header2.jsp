<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>

<script type="text/javascript">
jQuery(function() {

jQuery("#logoutLink").hover(function(){
	//jQuery(this).css("background", "url('images/dropdown-bg-hover.gif') repeat-x scroll left top transparent");
	jQuery(this).css("font-weight", "bold");
},function(){
	jQuery(this).css("font-weight", "");
	
});
});
</script>


    <div id="header">
    
    <ul id="navigation" class="nav-main">
     <sec:authorize ifNotGranted="ROLE_USER,ROLE_ADMIN">    
	<li><a href="<%=request.getContextPath()%>/login.htm">Inicio</a></li>
    </sec:authorize>
     <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
    <li class="list"><a href="#">Control Stock</a>
	<ul class="nav-sub">
	     <sec:authorize access="hasRole('ROLE_ADMIN')" >    
	    <li><a href="<%=request.getContextPath()%>/addStock.htm">Agregar</a></li>
	    </sec:authorize>
		<li><a href="<%=request.getContextPath()%>/showStock.htm">Buscar</a></li>
		<li><a href="<%=request.getContextPath()%>/checkOutStock.htm">Facturar</a></li>
	</ul>
	</li>
	<sec:authorize access="hasRole('ROLE_ADMIN')" >
    <li class="list"><a href="#">Historial</a>
	<ul class="nav-sub">	         
	    <li><a href="<%=request.getContextPath()%>/historyCO.htm">Pedidos</a></li>	    
	</ul>
	</sec:authorize>    
    <li><a href="<%=request.getContextPath()%>/alerts.htm">Avisos</a></li>
    </sec:authorize>
    <li><a href="<%=request.getContextPath()%>/help.htm">Ayuda</a></li>
    <li><a href="<%=request.getContextPath()%>/contact.htm">Contacto</a></li>
    <sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
    <li style="float: left; position: absolute; left: 785px; width: 1px; cursor: auto;" ></li>
    <li id="loggued" style="float: left; position: absolute; left: 785px; cursor: auto; background: none; " >
	     <div id="infoLoggedUser" style="padding: 8px 10px 2px;" >
	     Logueado: <strong><sec:authentication property="principal.username"/></strong>
	     <c:url value="/logout" var="logoutUrl"/>
	     <div align="right" style="cursor:pointer;width: 140px;" >
	     	<a id="logoutLink" href="${logoutUrl}" style="display: block; padding: 4px 0px 0px 0px; height: 0px; color:white" >Salir</a></div>
	     </div>
     <%-- 		<c:url value="/logout" var="logoutUrl"/> --%>
	<%-- 		<li><a href="${logoutUrl}">Log Out</a></li> --%>
     </div>
    </a></li>
    </sec:authorize>
<%-- 	<sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN"> --%>
<%-- 		<c:url value="/logout" var="logoutUrl"/> --%>
<%-- 		<li><a href="${logoutUrl}">Log Out</a></li> --%>
<%-- 	</sec:authorize> --%>    

</ul>        
      
                
	</div>
<!--  <div style="clear:both"></div>  --> 