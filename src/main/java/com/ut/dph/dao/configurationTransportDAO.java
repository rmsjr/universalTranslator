package com.ut.dph.dao;

import java.util.List;

import com.ut.dph.model.configurationFormFields;
import com.ut.dph.model.configurationTransport;

public interface configurationTransportDAO {
	
	List<configurationTransport> getTransportDetails(int configId);
	
	Integer updateTransportDetails(configurationTransport transportDetails, int clearFields);
	
	configurationTransport getTransportDetailsByTransportMethod(int configId, int transportMethod);
	
	List<configurationFormFields> getConfigurationFields(int configId, int transportDetailId);
	
	void updateConfigurationFormFields(configurationFormFields formField);
	
	@SuppressWarnings("rawtypes")
	List getTransportMethods();
	
	void setupOnlineForm(int configId, int messageTypeId);

}
