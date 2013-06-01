<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form2" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<jsp:include flush="true" page="header.jsp">
		<jsp:param name="left" value="1" />
	</jsp:include>

<link rel="stylesheet" type="text/css" media="screen"	href="css/jquery-ui-1.8.16.custom.css" />
<link type="text/css" href="css/demos.css" rel="stylesheet" />
<link rel="stylesheet" href="css/tablas_datos.css" type="text/css"/>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />


<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="js/excanvas.js" ></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript" src="js/jquery.alerts.js"></script>


<script type="text/javascript">
jQuery(function() {
	//loadLastClientId();
	cleanScreenAdd();
jQuery("#addNewProviderForm").validate({
				focusInvalid:false,
			    rules: {
			    	nombreC:{required: true},
					apellidoC:{required: true},
					emailC:{email:true},
					cuitC:{digits:true}
		        },
			    messages: {
			    	nombreC: {required: "campo obligatorio"},	
			    	apellidoC: {required: "campo obligatorio"},
			    	emailC:{email:"email incorrecto"},
			    	cuitC:{digits:"campo numerico"}
			    },
		  	submitHandler: function() { 	  	
		  		var razonProv = jQuery("#rzprov").val();
		  		var nameProv = jQuery("#nameprov").val();
		  		var telContactProv = jQuery("#telcontprov").val();
		  		var localProv = jQuery("#localprov").val();
		  		var emailProv = jQuery("#emailprov").val();
		  		var telProv = jQuery("#telprov").val();
		  		var cuitProv = jQuery("#cuitprov").val();
		  		var ccProv = jQuery("#ccprov").val();
		  		var direProv = jQuery("#direProv").val();
		  		
		  		var newProvider = {'razonsocial':razonProv,'telefono':telProv,'direccion':direProv,
		  					    'localidad':localProv,'email':emailProv,'ccNro':ccProv,'cuitTipo':'CUIT', 'cuit':cuitProv,
		  					  'nombreContacto':nameProv,'telefonoContacto':telContactProv};		  		 
		  		 
                jQuery.ajax({
                     url: '<c:url value="/addNewProvider.htm" />',
                     type: "POST",
                     dataType: "json",
                     contentType: "application/json",
                     data: JSON.stringify( newProvider ), 
                     success: function(resp){                                       
                    	 if(resp!=-1){ 
                 			jSuccess("Operacion realizada exitosamente", "Guardar",function(){
                 				cleanScreenAdd();
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
	
	function cleanScreenAdd(){
			 jQuery("#rzprov").val("");
	  	  	 jQuery("#nameprov").val("");
	  		 jQuery("#telcontprov").val("");
	  		 jQuery("#localprov").val("");
	  		 jQuery("#emailprov").val("");
	  		 jQuery("#telprov").val("");
	  		 jQuery("#cuitprov").val("");
	  		 jQuery("#ccprov").val("");
	  		 jQuery("#direProv").val("");	  		
	}
	
	function loadLastClientId(){
    jQuery.ajax({
        url: '<c:url value="/loadLastClientId.htm" />',
        type: "GET",
        dataType: "json",
        contentType: "application/json",
        data: "", 
        success: function(resp){                                       
       			jQuery("#ccC").val(resp+1);        
        }
      });
	}
	
	
});
</script>
   
<div id="nav">
	<div class="container">	
			</br>
			<h2>Agregar un proveedor</h2>
			</hr>
        <form id="addNewProviderForm" action="" method="post">
        		<div class="span-8">    
					<label for="rzprov">Razón social</label></br>
						<input type="text" class="text2" id="rzprov" name="rzprov" /></br>
					<label for="nameprov">Nombre de contacto</label></br>
						<input type="text" class="text2" id="nameprov" name="nameprov" /></br>
					<label for="telprov">Teléfomo de contacto</label></br>
						<input type="text" class="text2" id="telcontprov" name="telcontprov" /></br>
				</div>
				<div class="span-8">    
					<label for="direProv">Dirección</label></br>
						<input type="text" class="text2" id="direProv" name="direProv" /></br>
					<label for="localprov">Localidad</label></br>
						<input type="text" class="text2" id="localprov" name="localprov" /></br>
					<label for="telprov">Teléfono</label></br>
						<input type="text" class="text2" id="telprov" name="telprov" /></br>			  
				</div>	
				<div class="span-8 last">		  
					<label for="emailprov">Correo electrónico</label></br>
						<input type="text" class="text2" id="emailprov" name="emailprov" /></br>
					<label for="cuitprov">CUIT</label></br>
						<input type="text" class="text2" id="cuitprov" name="cuitprov" /></br>
					<label for="ccprov">Cuenta corriente nro</label></br>
						<input type="text" class="text2" id="ccprov" name="ccprov" /></br>						
				</div>				 
				<div class="span-4 prepend-20 prepend-top append-bottom last">						
		            <input type="button" onclick="jQuery('#addNewProviderForm').submit();"  value="Guardar" />
		            <input type="reset" value="Borrar" />
				</div>
        </form>
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