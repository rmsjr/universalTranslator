package com.ut.dph.service;

import java.util.List;

import com.ut.dph.model.Provider;
import com.ut.dph.model.providerAddress;

public interface providerManager {
	
  Integer createProvider(Provider provider);
	
  void updateProvider(Provider provider);
  
  void deleteProvider(int providerId);
	  
  Provider getProviderById(int providerId);
  
  List<Provider> findProviders(int orgId, String searchTerm);
  
  List<providerAddress> getProviderAddresses(int providerId);

}
