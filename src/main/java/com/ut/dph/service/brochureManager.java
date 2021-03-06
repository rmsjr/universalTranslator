package com.ut.dph.service;

import java.util.List;

import com.ut.dph.model.Brochure;

public interface brochureManager {
	
	Integer createBrochure(Brochure brochure);
	
	void updateBrochure(Brochure brochure);
	
	void deleteBrochure(int brochureId);
		  
	Brochure getBrochureById(int brochureId);
	  
	List<Brochure> findBrochures(int orgId, String searchTerm);

}
