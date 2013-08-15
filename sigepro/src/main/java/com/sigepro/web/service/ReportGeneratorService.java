package com.sigepro.web.service;

import java.io.ByteArrayOutputStream;

import com.sigepro.web.model.dto.ReportData;


public interface ReportGeneratorService {

	ByteArrayOutputStream generateReport(ReportData reportData);

}