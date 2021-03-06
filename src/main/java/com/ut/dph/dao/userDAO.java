package com.ut.dph.dao;

import java.util.List;

import com.ut.dph.model.User;
import com.ut.dph.model.siteSections;
import com.ut.dph.model.userAccess;

public interface userDAO {
	
	Integer createUser(User user);
	
	void updateUser(User user);
	  
	User getUserById(int userId);
	
	List<User> findUsers(int orgId, String searchTerm);
	
	User getUserByUserName(String username);
	
	Long findTotalLogins(int orgId);
	
	void setLastLogin(String username);
	
	List<siteSections> getSections();
	
	List<userAccess> getuserSections(int userId);
	
}
