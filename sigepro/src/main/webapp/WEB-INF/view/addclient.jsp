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


<script type="text/javascript" src="js/jquery-1.7.min.js"></script>

<script type="text/javascript" src="js/mopTip-2.2.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>

<script type="text/javascript" src="js/excanvas.js" ></script>
<script type="text/javascript" src="js/jquery.bt.min.js" ></script>  
<script type="text/javascript" src="js/jquery.validate.js" ></script>  
<script type="text/javascript" src="js/jquery.alerts.js"></script>
<script type="text/javascript" src="js/jquery.raty.min.js"></script>

<script type="text/javascript">
jQuery(function() {
	loadLastClientId();
	
	 $.fn.raty.defaults.path = 'css/images';
	 	jQuery('#puntuacionStart').raty({
	 		  size     : 24,
	 		  starHalf : 'star-half-big.png',
	 		  starOff  : 'star-off-big.png',
	 		  starOn   : 'star-on-big.png',
	 		  target: '#hint',
	 		  hints: ['Malo', 'Aceptable','Bueno', 'Muy bueno', 'Excelente']
	 	});
		
	 	
	cleanScreenAdd();
jQuery("#addClientForm").validate({
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
		  		/*
		  		var listElements = new Array(); 		  		
		  		jQuery("#tableAdd tbody>tr").each(function(index) {
		 
		  			var newProduct = {'productName':'','productQuantity':'','productPrice':''};
		  			newProduct.productName = jQuery(this).find("input:eq(0)").val();
		  			if (newProduct.productName ==''){
		  				return true;
		  			}
		  			newProduct.productQuantity = jQuery(this).find("input:eq(2)").val();
		  			newProduct.productPrice = jQuery(this).find("input:eq(1)").val().replace(",",".");
					listElements.push(newProduct);
		  		 });
		  		 */
		  		var nombreNew = jQuery("#nombreC").val();
		  		var apellidoNew = jQuery("#apellidoC").val();
		  		var direccionNew = jQuery("#direccionC").val();
		  		var localidadNew = jQuery("#localidadC").val();
		  		var emailNew = jQuery("#emailC").val();
		  		var telNew = jQuery("#telC").val();
		  		var cuitNew = jQuery("#cuitC").val();
		  		var puntuaNew = jQuery('#puntuacionStart input[name=score]').val();
		  		var comentNew = jQuery("#comentC").val();
		  		var cuentaCNew = jQuery("#ccC").val();
		  		
		  		var newClient = {'nombre':nombreNew,'apellido':apellidoNew,'direccion':direccionNew,
		  					    'localidad':localidadNew,'email':emailNew,'telefono':telNew,
		  						'notas':comentNew,'ccNro':cuentaCNew,'puntuacion':puntuaNew, 'cuit':cuitNew};		  		 
		  		 
                jQuery.ajax({
                     url: '<c:url value="/addNewClient.htm" />',
                     type: "POST",
                     dataType: "json",
                     contentType: "application/json",
                     data: JSON.stringify( newClient ), 
                     success: function(resp){                                       
                    	 if(resp!=-1){ 
                 			jSuccess("Operacion realizada exitosamente", "Guardar",function(){
                 				cleanScreenAdd();
                 				loadLastClientId();
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

function cleanScreenAdd(){
	     jQuery("#nombreC").val("");
	  	 jQuery("#apellidoC").val("");
		 jQuery("#direccionC").val("");
		 jQuery("#localidadC").val("");
		 jQuery("#emailC").val("");
		 jQuery("#telC").val("");
		 jQuery("#cuitC").val("");
		 jQuery('#puntuacionStart').raty('cancel', false);
		 jQuery("#comentC").val("");
		 jQuery("#ccC").val("");

}
</script>
 
<div id="nav">
	<div class="container">	
			</br>
			<h2>Agregar un cliente</h2>
			<hr></hr>
        <form id="addClientForm" action="" method="post">

	        	<div class="span-8">    
					<label for="nombreC">Nombre</label></br>
						<input type="text" class="text2" id="nombreC" name="nombreC" /></br>
					<label for="apellidoC">Apellido</label></br>
						<input type="text" class="text2" id="apellidoC" name="apellidoC" /></br>
					<label for="direccionC">Dirección</label></br>
						<input type="text" class="text2" id="direccionC" name="direccionC" /></br>
				</div>
				<div class="span-8">    
					<label for="localidadC">Localidad</label></br>
						<input type="text" class="text2" id="localidadC" name="localidadC" /></br>
					<label for="emailC">Correo electrónico</label></br>
						<input type="text" class="text2" id="emailC" name="emailC" /></br>
					<label for="telC">Teléfono</label></br>
						<input type="text" class="text2" id="telC" name="telC" /></br>			  
				</div>	
				<div class="span-8 last">		  
					<label for="ccC">CC</label></br>
						<input type="text" class="text2" id="ccC" name="ccC" /></br>
					<label for="cuitC">CUIT</label></br>
						<input type="text" class="text2" id="cuitC" name="cuitC" /></br>
					<label for="puntuacionC">Puntuación</label></br>
					<div id="puntuacionStart" style="margin-top:5px; float: left;"></div><span style="font-size: 18px" id="hint"></span>
				</div>				 
				<div class="span-24 last">							 
					<label for="comentC">Comentario</label></br>
				  		<textarea name="comentC" id="comentC" rows="5" cols="20"></textarea>
				</div>
				<div class="span-4 prepend-20 prepend-top append-bottom last">						
		              <input type="button" onclick="jQuery('#addClientForm').submit();"  value="Guardar" />
		              <input type="button" onclick="cleanScreenAdd();" value="Borrar" />	
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


</body>
</html>