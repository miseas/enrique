/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.model.dto;



/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 14/01/2012 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
public class ReportData {

    String dateReport;
    String numPresupuesto;
    String dateDelivery;
    ClienteDTO client;
    String totalPriceOrder;
    String payCondition;
    
	public String getDateReport() {
		return dateReport;
	}
	public void setDateReport(String dateReport) {
		this.dateReport = dateReport;
	}
	public String getDateDelivery() {
		return dateDelivery;
	}
	public void setDateDelivery(String dateDelivery) {
		this.dateDelivery = dateDelivery;
	}
	public ClienteDTO getClient() {
		return client;
	}
	public void setClient(ClienteDTO client) {
		this.client = client;
	}
	public String getTotalPriceOrder() {
		return totalPriceOrder;
	}
	public void setTotalPriceOrder(String totalPriceOrder) {
		this.totalPriceOrder = totalPriceOrder;
	}
	public String getPayCondition() {
		return payCondition;
	}
	public void setPayCondition(String payCondition) {
		this.payCondition = payCondition;
	}
	public String getNumPresupuesto() {
		return numPresupuesto;
	}
	public void setNumPresupuesto(String numPresupuesto) {
		this.numPresupuesto = numPresupuesto;
	}
    
	
}
