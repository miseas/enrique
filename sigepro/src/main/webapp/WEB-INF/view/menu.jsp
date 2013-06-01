<div id="buttons">
	<div class="container">		
		<div class="span-24 last">
			
			<ul id="sddm">
			    <li><a href="#" 
			        onmouseover="mopen('m1')" 
			        onmouseout="mclosetime()">Visita</a>
			        <div id="m1" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
			        <a href="#">Sub1</a>
			        <a href="#">Sub2</a>
			        <a href="#">Sub3</a>
			        </div>
			    </li>
			    <li><a href="#" 
			        onmouseover="mopen('m2')" 
			        onmouseout="mclosetime()">Orden de compra</a>
			        <div id="m2" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
			        <a href="<%=request.getContextPath()%>/ordenCompra.htm">Nueva</a>
			        <a href="<%=request.getContextPath()%>/ordenCompraBuscar.htm">Buscar</a>
			        <a href="<%=request.getContextPath()%>/ordenCompraPagos.htm">Pagos</a>
			        </div>
			    </li>
			    <li><a href="#" 
			        onmouseover="mopen('m3')" 
			        onmouseout="mclosetime()">Presupuesto</a>
			        <div id="m3" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
			        <a href="#">Sub1</a>
			        <a href="#">Sub2</a>
			        <a href="#">Sub3</a>
			        </div>
			    </li>
			    <li><a href="#" 
			        onmouseover="mopen('m4')" 
			        onmouseout="mclosetime()">Cliente</a>
			        <div id="m4" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
						<a href="<%=request.getContextPath()%>/listClient.htm">Listado</a>
						<a href="<%=request.getContextPath()%>/addClient.htm">Agregar</a>
			        </div>
			    </li>
			    <li><a href="#" 
			        onmouseover="mopen('m5')" 
			        onmouseout="mclosetime()">Proveedor</a>
			        <div id="m5" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
						<a href="<%=request.getContextPath()%>/listProv.htm">Listado</a>
						<a  href="<%=request.getContextPath()%>/addprov.htm">Agregar</a>
			        </div>
			    </li>
			    <li><a href="#" 
			        onmouseover="mopen('m6')" 
			        onmouseout="mclosetime()">Caja</a>
			        <div id="m6" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
			        <a href="#">Sub1</a>
			        <a href="#">Sub2</a>
			        <a href="#">Sub3</a>
			        </div>
			    </li>
			    <li><a href="#" 
			        onmouseover="mopen('m7')" 
			        onmouseout="mclosetime()">Pedidos</a>
			        <div id="m7" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
			        <a href="#">Sub1</a>
			        <a href="#">Sub2</a>
			        <a href="#">Sub3</a>
			        </div>
			    </li>
			    
			</ul>
			<div style="clear:both"></div>
			
		</div>
	</div>
</div>