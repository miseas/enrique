/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.FileResolver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sigepro.web.model.dto.ReportData;
import com.sigepro.web.service.ReportGeneratorService;



/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 03/05/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Service
public class ReportGeneratorServiceImpl implements ReportGeneratorService {
	
	Logger LOG = LoggerFactory.getLogger(ReportGeneratorServiceImpl.class);

	/* (non-Javadoc)
	 * @see com.decorart.web.service.impl.ReportGeneratorService#generateReport(com.decorart.web.model.pojo.ReportData)
	 */
	public ByteArrayOutputStream generateReport(ReportData reportData) {
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();

	    FileResolver fileResolver = new FileResolver() {
			
	        public File resolveFile(String fileName) {
	           URI uri;
	           String path= "/com/sigepro/web/report/";
	           try {
	             uri = new URI(this.getClass().getResource(path+fileName).getPath());
	             return new File(uri.getPath());
	           } catch (URISyntaxException e) {
	             e.printStackTrace();
	             return null;
	           }
	       }
		};
	    
	    
		JRBeanCollectionDataSource dataSource;
		JasperReport jasperReport;
		JasperPrint jasperPrint = null;
		Map<String, Object> pars = new HashMap<String, Object>();
		//pars.put("LOGO_URL", "logo.gif");
		pars.put("REPORT_FILE_RESOLVER", fileResolver);
		pars.put("P_TITULO", "Reporte de universidades inscritas");         
//          pars.put("ACTUALDATE", sim.format(date));
		pars.put("TOTALSUM", reportData.getTotalPriceOrder());
		String nombre = reportData.getClient().getNombre();
		if ( reportData.getClient().getApellido()!=null){
			nombre= nombre+" "+reportData.getClient().getApellido();
		}
		pars.put("NOMBRE", nombre.toUpperCase());
		pars.put("DIRECCION", reportData.getClient().getDireccion());
		pars.put("LOCALIDAD", reportData.getClient().getLocalidad());
		pars.put("EMAIL", reportData.getClient().getEmail());
		pars.put("TELEFONO", reportData.getClient().getTelefono());
		pars.put("CUIT", reportData.getClient().getCuit());
		pars.put("CONDPAGO", reportData.getPayCondition());
		pars.put("FECHAREPORTE", reportData.getDateReport());
		pars.put("FECHAENTREGA", reportData.getDateDelivery());
		pars.put("PRESU_NUM", reportData.getNumPresupuesto());
		try {
			ArrayList<String> data = new ArrayList<String>();
			data.add("hola");
		    //1-Llenar el datasource con la informacion de la base de datos o de donde este, en este caso "hardcode"
		    dataSource = new JRBeanCollectionDataSource(data);

		    //2-Compilamos el archivo XML y lo cargamos en memoria
		    jasperReport = JasperCompileManager.compileReport(this.getClass().getClassLoader()
		            .getResourceAsStream("com/sigepro/web/report/report_contrato_alta.jrxml"));
		    //JasperCompileManager.compileReport(reportName + ".jrxml");

		    //3-Llenamos el reporte con la informaci�n de la coleccion y par�metros necesarios para la consulta
		    jasperPrint = JasperFillManager.fillReport(jasperReport, pars,dataSource);

		    //4-Exportamos el reporte a pdf y lo guardamos en disco
		    //JasperExportManager.exportReportToPdfFile(jasperPrint, "C://" + reportName + ".pdf");
		    JasperExportManager.exportReportToPdfStream(jasperPrint, baos);
		} catch (Exception e) {
		    e.printStackTrace();
		    LOG.error(e.getMessage());
		}
		
		return baos;
	}

}
