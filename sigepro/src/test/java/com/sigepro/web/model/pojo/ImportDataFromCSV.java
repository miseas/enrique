package com.sigepro.web.model.pojo;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.supercsv.cellprocessor.Optional;
import org.supercsv.cellprocessor.constraint.NotNull;
import org.supercsv.cellprocessor.constraint.StrRegEx;
import org.supercsv.cellprocessor.constraint.UniqueHashCode;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvListReader;
import org.supercsv.io.ICsvListReader;
import org.supercsv.prefs.CsvPreference;

import com.sigepro.web.dao.ClientDAO;
import com.sigepro.web.dao.impl.DAOLocator;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:appcontext-text.xml"})
public class ImportDataFromCSV {
	
	final int TOTAL_IMPORT = 724;
	
    private ClientDAO getClientDAO() {
        return DAOLocator.getInstance().lookup(ClientDAO.class.getName());
    }		
	final String  VARIABLE_CSV_FILENAME = "/com/sigepro/web/model/pojo/importData.csv";
	static List<Localidad> localidades;
	
	@Test
	public void importData() throws IOException, URISyntaxException{
		
		
		 ICsvListReader listReader = null;
		 List<Cliente> listNewClientes = new ArrayList<Cliente>();
	        try {
	        	URI uri;
	        	uri = new URI(this.getClass().getResource(VARIABLE_CSV_FILENAME).getPath());
	        	
	                listReader = new CsvListReader(new FileReader(new File(uri.getPath())), CsvPreference.EXCEL_NORTH_EUROPE_PREFERENCE);
	                	                
	                while( (listReader.read()) != null ) {
	                        
	                        // use different processors depending on the number of columns
	                        final CellProcessor[] processors = getProcessors();
	         
	                        
	                        final List<Object> clientList = listReader.executeProcessors(processors);
	                        System.out.println(String.format("lineNo=%s, rowNo=%s, columns=%s, clientList=%s",
	                                listReader.getLineNumber(), listReader.getRowNumber(), clientList.size(), clientList));
	                        
	                        listNewClientes.add(createClient(clientList));
	                }
	                
	        }
	        finally {
	                if( listReader != null ) {
	                        listReader.close();
	                }
	               if (listNewClientes.size()==TOTAL_IMPORT){
	            	   ClientDAO clientDAO = getClientDAO();
	            	   for (Cliente cliente : listNewClientes) {
						clientDAO.saveNewClient(cliente);
					}
	               }
	        }
		
	}
	

	
	
private Cliente createClient(List<Object> clientList) {
	Cliente cliente = new Cliente();	
	cliente.setIdcliente(Integer.parseInt(clientList.get(0).toString()));
	cliente.setNumerocli(clientList.get(0).toString());
	cliente.setNombre(clientList.get(1).toString());
	cliente.setDireccion(clientList.get(2).toString());
	cliente.setLocalidad(getLocalidad(clientList.get(3)));
	cliente.setCp(clientList.get(4).toString());
	
	setClientTel(clientList.get(5), cliente);
	
	if (clientList.get(6)!=null){
		cliente.setEmail(clientList.get(6).toString());
	}
	if (clientList.get(7)!=null){
		cliente.setCuit(clientList.get(7).toString());
		CatDnitipo catDnitipo = new CatDnitipo();
		catDnitipo.setIddnitipo(0);
		cliente.setCatDnitipo(catDnitipo);
	}
	if (clientList.get(8)!=null){
		cliente.setCuit(clientList.get(8).toString());
		CatDnitipo catDnitipo = new CatDnitipo();
		catDnitipo.setIddnitipo(1);
		cliente.setCatDnitipo(catDnitipo);
	}

	
	//Set estado del cliente a Activo	
	EstadoCli estadoCli = new EstadoCli();
	estadoCli.setIdestadocli(1);
	cliente.setFechaAgregado(Calendar.getInstance().getTime());
	cliente.setEstadoCli(estadoCli);
	
		return cliente;
	}


private void setClientTel(Object object, Cliente cliente) {
	if (object!=null){
		String[] telefonos = object.toString().split("/");
		if (telefonos.length==3){
			cliente.setTelefono(telefonos[0]);
			cliente.setTelefono2(telefonos[1]);
			cliente.setTelefono3(telefonos[2]);
		}		
		else if (telefonos.length==2){
			cliente.setTelefono(telefonos[0]);
			cliente.setTelefono2(telefonos[1]);
		}
		else if (telefonos.length==1){
			cliente.setTelefono(telefonos[0]);
		}
		
	}
	
}




public List<Localidad> getCatologoLocalidades(){
	if(localidades==null){
		localidades = 	getClientDAO().loadAllLocalidades();
	}
	return localidades;
}



private Localidad getLocalidad(Object object) {
	String localidadString = object.toString();
	for (Localidad localidad : getCatologoLocalidades()) {
		if (localidad.getDescripcion().toLowerCase().contains(localidadString.subSequence(0, 3).toString().toLowerCase())){
			return localidad;
		}
	}
	
	Localidad localidad = new Localidad();
	localidad.setIdlocalidad(5000);
	return localidad ;
}




private static CellProcessor[] getProcessors() {
        
        final String emailRegex = "[a-z0-9\\._]+@[a-z0-9\\.]+"; // just an example, not very robust!
        StrRegEx.registerMessage(emailRegex, "must be a valid email address");
        
         CellProcessor[] processors = new CellProcessor[] { 
                new UniqueHashCode(), // customerNo (must be unique)
                new NotNull(), // firstName
                new NotNull(), // lastName
                new Optional(),
                //new ParseDate("dd/MM/yyyy"), // birthDate
                new NotNull(), // mailingAddress
                new Optional(),
                new Optional(),
                new Optional(),
                new Optional()
                //new Optional(new ParseBool()), // married
                //new Optional(new ParseInt()), // numberOfKids
                //new NotNull(), // favouriteQuote
                //new StrRegEx(emailRegex), // email
                //new LMinMax(0L, LMinMax.MAX_LONG) // loyaltyPoints
        };
        
        return processors;
}

}
