package com.ut.dph.service;

import java.math.BigInteger;
import java.util.List;

import com.ut.dph.model.custom.LookUpTableItems;
import com.ut.dph.model.custom.LookUpTable;


/** 
 * 1. sysAdminManager should handle the adding, deleting and modifying lu_ table items
 * 2. It should 
 * 
 * @author gchan
 *
 */

public interface sysAdminManager {

	/** 
	 * about 90% of our tables falls into the standard table category, which is
	 * id, displayText, description, status and isCustom) 

	 */
	
	List <LookUpTable> getTableLits(int maxResults, int page);
	
	Integer findTotalLookUpTable();
	
	List <LookUpTable> findLookUpTables(String searchTerm);
	
}
