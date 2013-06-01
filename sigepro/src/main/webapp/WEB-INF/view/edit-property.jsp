<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>

	

	
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>
	<script type="text/javascript" src="js/layout.js"></script>

<script type="text/javascript" src="js/utilities.js"></script>

<link type="text/css" href="css/jquery-ui-1.7.3.custom.css" rel="stylesheet" />
<link type="text/css" href="css/demos.css" rel="stylesheet" />

<link type="text/css" href="css/mopTip/mopTip-2.2.css" rel="stylesheet" />
<link rel="stylesheet" href="css/estilos.css" type="text/css" />
<link rel="stylesheet" href="css/tablas_datos.css" type="text/css"/>
<script type="text/javascript" src="js/excanvas.js" ></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script>  

<script src="js/jquery.alerts.js" type="text/javascript"></script>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />

<link href="css/ui.jqgrid.css" rel="stylesheet" type="text/css" charset="ISO-8859-1" media="screen" />
<script src="js/i18n/grid.locale-sp.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript" src="js/dwr/dwrConsultPatient.js"></script>
<style>
.loading {
				background: url(images/load.gif) no-repeat center center;
				height:50px;
				display:none;
			}
			
.redPoint{
color: red;
}			
</style>

<script type="text/javascript">

var catalogMessage= <%= request.getAttribute("MESSAGE_CATALOG") %>;

$(document).ready(function(){
	

	jQuery("#taskStart").jqGrid({
	datatype: "local",
	height:'auto',
	colNames:[ 'Nro Operativo', '<fmt:message key="message.employee.nroTask"/>','<fmt:message key="message.employee.activityTask"/>', '<fmt:message key="message.employee.inmTask"/>',
	          '<fmt:message key="message.employee.dateTask"/>','<fmt:message key="message.employee.ownerTask"/>'],
	colModel:[ {name:'nroOperative',index:'nroOperative', width:130, sorttype:"int"},
	           {name:'nroTask',index:'nroTask', width:130, sorttype:"int"}, 
	           {name:'activityTask',index:'activityTask', width:130, sorttype:"int"},
	           {name:'inmTask',index:'inmTask', width:150,align:"center"}, 
	           {name:'dateTask',index:'dateTask', width:150, align:"center"},
	           {name:'ownerTask',index:'ownerTask', width:150, align:"center"},
	           ],
	//ondblClickRow: function(id){ getAffiliateFullInfo(id);},
	imgpath: 'css/', 
	autowidth: true, 
	onSelectRow: function(id){ 
		if (jQuery("#tabs ul li").size()!=2){		
			jQuery("#tabs").tabs( "add" ,"#hideResultProperty"  , "Informacion Inmueble",1 );
			jQuery('#hideResultProperty').show();	
			}
		else if (jQuery("#tabs ul li").size()==2){		
			jQuery("#tabs").tabs( "remove" , 1 );			
			//jQuery('#hideResultProperty').show();
			jQuery("#tabs").tabs( "add" ,"#hideResultProperty"  , "Informacion Inmueble",1 );
			}
	},
	rownumbers: true,
	hiddengrid: false,
	editurl:'consults.htm',
	viewrecords: true,
	pager:'#pagerTaskStart',
	caption: '<fmt:message key="message.employee.pendTask"/>' })
	.navGrid('#pagerTaskStart',{add:false,refresh: false, edit: false, del:false},{},{},{onclickSubmit:function(){}}); 

	
	
	jQuery("#form1").validate({
	    rules: {
	    	nombreApelTitular: {required: true},
	    	superficeEdi:{required: true,digits:true},
	    	superficeTe: {required: true,digits:true},
	    	typeDoc:{required: true},
	    	nroDoc:{required: true,digits:true},
	    	teleNumber:{required: true,digits:true}
  
        },
	    messages: {
	    	nombreApelTitular: {required: "campo obligatorio"},
	    	superficeEdi: {required: "campo obligatorio",digits:"campo debe ser numerico"},
	    	superficeTe: {required: "campo obligatorio",digits:"campo debe ser numerico"},	
	    	typeDoc: {required: "campo obligatorio"},
	    	nroDoc: {required: "campo obligatorio",digits:"campo debe ser numerico"},
	    	teleNumber: {required: "campo obligatorio",digits:"campo debe ser numerico"},
	    	superficeTe: {required: "campo obligatorio",digits:"campo debe ser numerico"}
	    },
  	submitHandler: function() { guardarTodo(); }
	         
	 });

});


function returntoListTask(){
	var url = "/Examen/empleadoTask.htm";    
	$(location).attr('href',url);

}


function guardarTodo(){
	var nombreApelTitular = jQuery("#nombreApelTitular").val();
	var razonSocial = jQuery("#razonSocial").val();
	var typeDoc = jQuery("#typeDoc").val();
	var nroDoc = jQuery("#nroDoc").val();
	var teleNumber = jQuery("#teleNumber").val();
	
	var arrayT = [nombreApelTitular,razonSocial,typeDoc,nroDoc,teleNumber];
	
	var nroForm = jQuery("#nroForm").val();
	var superficeTe = jQuery("#superficeTe").val();
	var superficeEdi = jQuery("#superficeEdi").val();
	var selectDestino = jQuery("#selectDestino").val();
	var txtObservationRecipe = jQuery("#txtObservationRecipe").text();
	var localidad = jQuery("#localidad").val();
	var codpostal = jQuery("#codpostal").val();
	var calleIn = jQuery("#calleIn").val();
	var nroPuerta = jQuery("#nroPuerta").val();
	var piso = jQuery("#piso").val();
	var dpto = jQuery("#dpto").val();
	
	var torre = jQuery("#torre").val();
	var selectComplejidad = jQuery("#selectComplejidad").val();
	var accesoComp = jQuery("#accesoComp").val();
	var baldioEdi = jQuery("#baldioEdi").val();
	var ampliacion = jQuery("#ampliacion").val();
	var reciclado = jQuery("#reciclado").val();
	var supRelevada = jQuery("#supRelevada").val();
	var selectTipo = jQuery("#selectTipo").val();
	
	
	var selectbaPP = jQuery("#selectbaPP").val();
	var selectbaSS = jQuery("#selectbaSS").val();
	var selectPavTipo = jQuery("#selectPavTipo:selected").val();
	var selectPavClase = jQuery("#selectPavClase:selected").val();
	var txtPavimientoData = jQuery("#txtPavimientoData").text();
	var selectTipoAscensor = jQuery("#selectTipoAscensor").val();
	var selectNroParadas = jQuery("#selectNroParadas").val();
	var ascCantidad = jQuery("#ascCantidad").val();
	
	
	var arrayI = [nroForm,superficeTe,superficeEdi,selectDestino,txtObservationRecipe,localidad,codpostal,calleIn,nroPuerta,piso,dpto,torre,selectComplejidad,
	              accesoComp,baldioEdi,ampliacion,reciclado,supRelevada,selectTipo,selectbaPP,selectbaSS,selectPavTipo,selectPavClase,txtPavimientoData,selectTipoAscensor,
	              selectNroParadas,ascCantidad];

	Proxy.saveDataI("1", arrayT, arrayI,responsesaveDataI);
	
}


function responsesaveDataI(){
	jSuccess("Los cambios se realizaron exitosamente", "Actualización",function(){
		var url = "/Examen/empleadoTask.htm?parametro=1";    
		$(location).attr('href',url);
	},["Aceptar"]);


}

</script>


</head>

<body>
    <table width="100%"><tr><td width="100%"  valign="middle">
    <div style="position: absolute; top: 20px; left: 15px "  id="" class="ui-state-default2"><span>Usuario: ${username}</span>
    </div>
    <div style="position: absolute; top: 35px; left: 15px "  id="" class="ui-state-default2"><span>Fecha: ${fecha}</span>
    </div>
    <img height="56" width="100%" alt="" src="images/layout_nuevo.gif" />  
    </td></tr></table>
    <input id="messageOptionError" type="hidden" value="<fmt:message key='message.error.options' />" />
    
	<div id="tabs">
	<ul>
	<li><a href="#tab-1">Formulario Inmueble</a></li>
	<li><a href="#tab-2">Estructura</a></li>
	<li><a href="#tab-3">Baño</a></li>
	<li><a href="#tab-4">Pavimiento</a></li>
	<li><a href="#tab-5">Ascensores</a></li>
	<li><a href="#tab-6">Otros</a></li>
	</ul>      
	<form id="form1">	       
    <div id="tab-1">    
	<fieldset>
	<legend>Datos del Titular</legend>
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Nombre y Apellido<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input  type="text" value="${mymodel.auxTitular.name}" id="nombreApelTitular" name="nombreApelTitular" />
	</td>
	<td align="right">
	<label>Razon social<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input  type="text" id="razonSocial" name="razonSocial" value="${mymodel.auxTitular.lastName}" />
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Tipo documento<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input  type="text" id="typeDoc" name="typeDoc" value="${mymodel.auxTitular.typeDNI}" />
	</td>
	<td align="right">
	<label>Nro Documento<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input type="text" id="nroDoc" name="nroDoc"  value="${mymodel.auxTitular.numberDNI}" />
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Nro telefono:</label>
	</td>
	<td>
	<input type="text" id="teleNumber" name="teleNumber"  value="${mymodel.auxTitular.telNum}" />	
	</td>	
</tr>
</table>


	</fieldset>
	
	<fieldset><legend>Datos básicos del inmueble</legend>
	<table width="100%" align="center">
	<tr>
	<td width="100%" valign="top" height="100%">
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Nro Formulario<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input  type="text" id="nroForm" name="nroForm" value="${mymodel.auxInmueble.nroFormulario}"  />
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Superfice Terreno<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input  type="text" id="superficeTe"  name="superficeTe" value="${mymodel.auxInmueble.superficeTe}" /> m2
	</td>
	<td align="right">
	<label>Superfice Edificada<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input type="text" id="superficeEdi"  name="superficeEdi" value="${mymodel.auxInmueble.superficeEdi}" /> m2
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Destino del bien<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<select  id="selectDestino" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectDestino == 1}">
							selected="selected"
							</c:if> >Destino1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectDestino == 2}">
							selected="selected"
							</c:if> >Destino2</option>	
	</select>
	</td>
	<td align="right" valign="top">
	<label>Descripcion:</label>
	</td>
	<td rowspan="4">
	<textarea style="font: 10px Arial; height: 80px; width: 100% " 
		name="txtObservationRecipe" id="txtObservationRecipe">${mymodel.auxInmueble.descripcion}</textarea>
	</td>
</tr>
<tr>
	<td align="right" height="60px"></td>
</tr>
<tr>
	<td align="right"></td>
</tr>
</table>
		</td>
		</tr>
    	</table>
		</fieldset>
	<fieldset><legend>Domicilio del inmueble</legend>
	<table width="100%" align="center">
	<tr>
	<td width="100%" valign="top" height="100%">
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Localidad<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input type="text" id="localidad" value="${mymodel.auxInmueble.localidad}" />
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Codigo Postal<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input  type="text" id="codpostal" value="${mymodel.auxInmueble.codpostal}" />
	</td>
	<td align="right">
	<label>Calle<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input type="text" id="calleIn"   value="${mymodel.auxInmueble.calleIn}"/>
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Nro de Puerta<span class="redPoint">*</span>:</label>
	</td>
	<td>
	<input type="text" id="nroPuerta" value="${mymodel.auxInmueble.nroPuerta}" />	
	</td>
	<td align="right">
	<label>Piso:</label>
	</td>
	<td>
	<input type="text" id="piso" value="${mymodel.auxInmueble.piso}" />	
	</td>
	</tr>
	<tr> 
	<td align="right">
	<label>Departamento:</label>
	</td>
	<td>
	<input type="text" id="dpto" value="${mymodel.auxInmueble.dpto}" />	
	</td>
	<td align="right">
	<label>Torre/Bloque:</label>
	</td>
	<td>
	<input type="text" id="torre" value="${mymodel.auxInmueble.torre}" />	
	</td>
	</tr>
</table>
</td>
</tr>
</table>
</fieldset>
</div>
<!-- COMIENZA TAB 2		 -->
<div id="tab-2">    
	<fieldset>	
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Complejidad:</label>
	</td>
	<td>
	<select  name='selectComplejidad' id="selectComplejidad" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectComplejidad == 1}">
							selected="selected"
							</c:if> >Complejidad1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectComplejidad == 2}">
							selected="selected"
							</c:if> >Complejidad2</option>	
	</select>
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Acceso:</label>
	</td>
	<td>
	<input  type="text" id="accesoComp" value="${mymodel.auxInmueble.accesoComp}" />
	</td>
	<td align="right">
	<label>Baldio Edificado</label>
	</td>
	<td>
	<input type="checkbox" id="baldioEdi" <c:if test="${mymodel.auxInmueble.baldioEdi == 1}">
							checked="checked"
							</c:if>  />
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Ampliacion:</label>
	</td>
	<td>
	<input type="text" id="ampliacion" value="${mymodel.auxInmueble.ampliacion}" />	
	</td>	
	<td align="right">
	<label>Reciclado:</label>
	</td>
	<td>
	<input type="text" id="reciclado" value="${mymodel.auxInmueble.reciclado}" />	
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Superficie relevada:</label>
	</td>
	<td>
	<input type="text" id="supRelevada" value="${mymodel.auxInmueble.supRelevada}" />	
	</td>	
	<td align="right">
	<label>Tipo:</label>
	</td>
	<td>
	<select  name='selectTipo' id="selectTipo" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectTipo == 1}">
							selected="selected"
							</c:if> >Tipo1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectTipo == 2}">
							selected="selected"
							</c:if> >Tipo2</option>	
	</select>
	</td>
	</tr>
</table>
</fieldset>			
</div>

<!-- COMIENZA TAB 3		 -->
<div id="tab-3">    
	<fieldset>	
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Baños Principales:</label>
	</td>
	<td>
	<select  name='selectbaPP' id="selectbaPP" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectbaPP == 1}">
							selected="selected"
							</c:if> >BañoPrincipal1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectbaPP == 2}">
							selected="selected"
							</c:if> >BañoPrincipal2</option>	
	</select>
	</td>
	<td align="right">
	<label>Baños Secundarios:</label>
	</td>
	<td>
	<select  name='selectbaSS' id="selectbaSS" >
	<option value="-1">Seleccione una opción</option>
		<option value="1" <c:if test="${mymodel.auxInmueble.selectbaSS == 1}">
							selected="selected"
							</c:if> >BañoSecundario1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectbaSS == 2}">
							selected="selected"
							</c:if> >BañoSecundario2</option>
	</select></td>
	</tr>
</table>
</fieldset>			
</div>


<!-- COMIENZA TAB 4		 -->
<div id="tab-4">    
	<fieldset>	
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Pavimiento Tipo:</label>
	</td>
	<td>
	<select  name='selectPavTipo' id="selectPavTipo" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectPavTipo == 1}">
							selected="selected"
							</c:if> >BañoSecundario1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectPavTipo == 2}">
							selected="selected"
							</c:if> >BañoSecundario2</option>
	</select>
	</td>
	<td align="right">
	<label>Pavimiento Clase:</label>
	</td>
	<td>
	<select  name='selectPavClase' id="selectPavClase" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectPavClase == 1}">
							selected="selected"
							</c:if> >PavimentoClase1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectPavClase == 2}">
							selected="selected"
							</c:if> >PavimentoClase2</option>
	</select>
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Pavimento Data</label>
	</td>
	<td rowspan="4">
	<textarea style="font: 10px Arial; height: 80px; width: 100% "
		name="txtPavimientoData" id="txtPavimientoData"> ${mymodel.auxInmueble.txtPavimientoData}</textarea>
	</td>
	</tr>	
</table>
</fieldset>			
</div>

<!-- COMIENZA TAB 5		 -->
<div id="tab-5">    
	<fieldset>	
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Ascensor Tipo:</label>
	</td>
	<td>
	<select  name='selectTipoAscensor' id="selectTipoAscensor" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectTipoAscensor == 1}">
							selected="selected"
							</c:if> >TipoAscensor1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectTipoAscensor == 2}">
							selected="selected"
							</c:if> >TipoAscensor2</option>
	</select>
	</td>
	<td align="right">
	<label>Ascensor Nro Paradas:</label>
	</td>
	<td>
	<select  name='selectNroParadas' id="selectNroParadas" >
	<option value="-1">Seleccione una opción</option>
	<option value="1" <c:if test="${mymodel.auxInmueble.selectNroParadas == 1}">
							selected="selected"
							</c:if> >NroParadas1</option>
	<option value="2" <c:if test="${mymodel.auxInmueble.selectNroParadas == 2}">
							selected="selected"
							</c:if> >NroParadas2</option>
	</select>
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Ascensor Cantidad:</label>
	</td>
	<td rowspan="4">
	<input type="text" id="ascCantidad"  value="${mymodel.auxInmueble.ascCantidad}" />
	</td>
	</tr>	
</table>
</fieldset>			
</div>


<!-- COMIENZA TAB 6		 -->
<div id="tab-6">    
	<fieldset>
	<legend>Inst. contra incendios</legend>	
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Numero de bocas:</label>
	</td>
	<td>
	<input type="text" id="nroBocas" value="${mymodel.auxInmueble.nroBocas}" />	
	</td>
	<td align="right">
	<label>Nro de rociadores:</label>
	</td>
	<td>
	<input type="text" id="nroRociadores" value="${mymodel.auxInmueble.nroRociadores}" />	
	</td>
	</tr>
	</table>
	</fieldset>	
	<fieldset>
	<legend>Calefaccion Central</legend>	
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Numero de radiadoress:</label>
	</td>
	<td>
	<input type="text" id="nroRadiadores" value="${mymodel.auxInmueble.nroRadiadores}" />	
	</td>
	<td align="right">
	<label>Superficie Rad.:</label>
	</td>
	<td>
	<input type="text" id="superRad"  value="${mymodel.auxInmueble.superRad}" />	
	</td>
	</tr>
	</table>
	</fieldset>	
	<fieldset>
	<legend>Cancha</legend>	
	<table border="0" width="100%">
	<tr>
	<td align="right">
	<label>Cancha de Polo:</label>
	</td>
	<td>
	<input type="checkbox" id="canchaPolo" <c:if test="${mymodel.auxInmueble.baldioEdi == 1}">
							checked="checked"
							</c:if> />	
	</td>
	<td align="right">
	<label>Superfice:</label>
	</td>
	<td>
	<input type="text" id="supcanchaPolo" value="${mymodel.auxInmueble.supcanchaPolo}"  />	
	</td>
	<td align="right">
	<label>Cancha de Pato:</label>
	</td>
	<td>
	<input type="checkbox" id="canchaPato" <c:if test="${mymodel.auxInmueble.canchaPato == 1}">
							checked="checked"
							</c:if> />	
	</td>
	<td align="right">
	<label>Superfice:</label>
	</td>
	<td>
	<input type="text" id="supcanchaPato" value="${mymodel.auxInmueble.supcanchaPato}" />	
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Cancha de Futbol:</label>
	</td>
	<td>
	<input type="checkbox" id="canchaFutbol" <c:if test="${mymodel.auxInmueble.canchaFutbol == 1}">
							checked="checked"
							</c:if>  />	
	</td>
	<td align="right">
	<label>Superfice:</label>
	</td>
	<td>
	<input type="text" id="supcanchaFutbol" value="${mymodel.auxInmueble.supcanchaFutbol}" />	
	</td>
	<td align="right">
	<label>Cancha de Tennis:</label>
	</td>
	<td>
	<input type="checkbox" id="canchaTennis" <c:if test="${mymodel.auxInmueble.canchaTennis == 1}">
							checked="checked"
							</c:if> />	
	</td>
	<td align="right">
	<label>Superfice:</label>
	</td>
	<td>
	<input type="text" id="supcanchaTennis" value="${mymodel.auxInmueble.supcanchaTennis}" />	
	</td>
	</tr>
	<tr>
	<td align="right">
	<label>Cancha de Paddle:</label>
	</td>
	<td>
	<input type="checkbox" id="canchaPaddle" <c:if test="${mymodel.auxInmueble.canchaPaddle == 1}">
							checked="checked"
							</c:if> />	
	</td>
	<td align="right">
	<label>Superfice:</label>
	</td>
	<td>
	<input type="text" id="supcanchaPaddle" value="${mymodel.auxInmueble.supcanchaPaddle}" />	
	</td>
	<td align="right">
	<label>Cancha de Golf:</label>
	</td>
	<td>
	<input type="checkbox" id="canchaGolf" <c:if test="${mymodel.auxInmueble.canchaGolf == 1}">
							checked="checked"
							</c:if> />	
	</td>
	<td align="right">
	<label>Superfice:</label>
	</td>
	<td>
	<input type="text" id="supcanchaGolf"  value="${mymodel.auxInmueble.supcanchaGolf}" />	
	</td>
	</tr>
	</table>
	</fieldset>	
		
</div>

  	<table width="100%">
    	<tr>
    	<td align="left"><span  class="redPoint">*</span>:Campos obligatorios </td>
    		<td colspan="3" align="right">
    		<div  style="position: relative; float:right;">
    		<input type="button" id="btnReturnConsult" value="<fmt:message key='message.cp.buttonReturn'/>" onclick="returntoListTask();"/>
	        <input type="submit" id="btnSubmit" value="Actualizar partida" onclick="" />    		
    		</div>
    		</td>
    	</tr>
    	</table>
 </form>
  

</div>
<div  align="center" style="display: none;cursor: help; " id="photo1">
<input id="context" type="hidden" value="<%=request.getContextPath()%>"/>
<img id="photoImgPatient" height="180" src=""></img></div>
</body>

</html>
