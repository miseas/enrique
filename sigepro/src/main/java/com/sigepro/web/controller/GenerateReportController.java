/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sigepro.web.model.dto.ReportData;
import com.sigepro.web.service.ClienteService;
import com.sigepro.web.service.ReportGeneratorService;

import fr.xebia.audit.Audited;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 25/12/2011 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Controller
public class GenerateReportController {

	Logger LOG = LoggerFactory.getLogger(GenerateReportController.class);

    @Autowired
    ClienteService clientService;
    
    @Autowired
    ReportGeneratorService reportGeneratorService;

    private String SOURCE_REPORT = "sourceReport";

    @Audited(message = "Accion: Facturar productos")
    @RequestMapping(value = "/dataReport")
    public @ResponseBody
    Integer getReport(@RequestBody ReportData reportData, HttpServletRequest request, HttpServletResponse response) {
       // Double profit = calculateCheckoutProducts(reportData);
       // clientService.saveClient(reportData.getClient(), profit);
    	Random randomGenerator = new Random();
    	Integer randomNumber = randomGenerator.nextInt(100000);
        request.getSession().setAttribute(SOURCE_REPORT+randomNumber, reportData);
        //Saving data in db
       // ordenCompraService.saveOrdenCompra(reportData);
        return randomNumber;
    }

    @RequestMapping(value = "/generateReport")
    public ModelAndView generateReport(@RequestParam(value = "cliId", required = true, defaultValue = "0") Integer cliId,
    		HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	//loading tmp data from session        
     	ReportData reportData = clientService.loadCPForReport(cliId);
        if (reportData != null) {
    		String reportName = "ContratoAbono_"+reportData.getClient().getApellido()+"-"+reportData.getNumPresupuesto();
            ByteArrayOutputStream baos = reportGeneratorService.generateReport(reportData);
		    response.setHeader("Content-Disposition", "attachment; filename=\"" + reportName + ".pdf\"");
		    //response.setContentType("application/pdf");
		    response.setContentLength(baos.size());
		    ServletOutputStream out1 = response.getOutputStream();
		    baos.writeTo(out1);
		    out1.flush();
        }

        
        return null;
    }

	

//    public Double calculateCheckoutProducts(ReportData reportData) {
//        System.out.println("ABMProductController.calculateCheckoutProducts()");
//        Double quantity = 0d;
//
//        try {
//            quantity = productService.calculateCheckOutProducts(reportData.getItems());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("GANANCIA OBTENIDA!!!:" + quantity);
//        return quantity;
//    }

}
