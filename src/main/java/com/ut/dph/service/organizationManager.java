package com.ut.dph.service;

import java.util.List;

import com.ut.dph.model.Organization;

public interface organizationManager {
	
  Integer createOrganization(Organization organization);
	
  void updateOrganization(Organization organization);
	  
  Organization getOrganizationById(int orgId);
  
  List<Organization> getOrganizationByName(String cleanURL);
  
  List<Organization> findOrganizations(String searchTerm);
  
  List<Organization> getOrganizations(int firstResults, int maxResults);

}
