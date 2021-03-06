package com.ut.dph.service;

import java.util.List;

import com.ut.dph.model.configurationFormFields;
import com.ut.dph.model.configurationTransport;

public interface configurationTransportManager {
	
	List<configurationTransport> getTransportDetails(int configId);
	
	configurationTransport getTransportDetailsByTransportMethod(int configId, int transportMethod);
	
	void updateTransportDetails(configurationTransport transportDetails);
	
	List<configurationFormFields> getConfigurationFields(int configId, int transportDetailId);
	
	void updateConfigurationFormFields(configurationFormFields formField);
	 
	@SuppressWarnings("rawtypes")
	List getTransportMethods();
	
	void setupOnlineForm(int configId, int messageTypeId);

}
