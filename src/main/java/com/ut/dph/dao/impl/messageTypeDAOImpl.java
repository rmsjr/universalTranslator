package com.ut.dph.dao.impl;

import java.util.List;

import org.hibernate.Criteria; 
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions; 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ut.dph.dao.messageTypeDAO;
import com.ut.dph.model.Crosswalks;
import com.ut.dph.model.messageType;
import com.ut.dph.model.messageTypeDataTranslations;
import com.ut.dph.model.messageTypeFormFields;

/**
 * The brochureDAOImpl class will implement the DAO access layer to handle
 * updates for organization brochures
 * 
 * 
 * @author chadmccue
 *
 */


@Repository
public class messageTypeDAOImpl implements messageTypeDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * The 'createMessageType" function will create the new brochure 
	 * 
	 * @Table	messageTypes
	 * 
	 * @param	messageType	This will hold the messageType object from the form
	 * 
	 * @return 	The function will return the id of the new messageType
	 * 
	 */
	@Override
	public Integer createMessageType(messageType messageType) {
		Integer lastId = null;
			
		lastId = (Integer) sessionFactory.getCurrentSession().save(messageType);
		
		return lastId;
	}
	
	
	/**
	 * The 'updateMessageType' function will update the selected message type with the changes
	 * entered into the form.
	 * 
	 * @param	messageType	This will hold the messagetype object from the message type form
	 * 
	 * @return 			the function does not return anything
	 */
	@Override
    public void updateMessageType(messageType messageType) {
		sessionFactory.getCurrentSession().saveOrUpdate(messageType);
	}
	

	/**
	 * The 'deleteMessageType' function will delete the selected brochure
	 * 
	 * @param	messageTypeId	This will hold the id of the message type to delete
	 * 
	 * @return 			the function does not return anything
	 */
	@Override
    public void deleteMessageType(int messageTypeId) {
		Query deleteMessageType = sessionFactory.getCurrentSession().createQuery("delete from messageType where id = :messageTypeId");
		deleteMessageType.setParameter("messageTypeId",messageTypeId);
		deleteMessageType.executeUpdate();
	}
	
	
	/**
	 * The 'getMessageTypeById' function will return a single message type object based on the messageTypeId
	 * passed in.
	 * 
	 * @param	messageTypeId	This will be id to find the specific message type
	 * 
	 * @return			The function will return a messageType object 
	 */
	@Override
	public messageType getMessageTypeById(int messageTypeId) {
      return (messageType) sessionFactory.getCurrentSession().get(messageType.class, messageTypeId);
	}
	
	/**
	 * The 'getMessageTypeById' function will return a single message type object based on the messageTypeId
	 * passed in.
	 * 
	 * @param	messageTypeId	This will be id to find the specific message type
	 * 
	 * @return			The function will return a messageType object 
	 */
	@Override
	public messageType getMessageTypeByName(String name) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(messageType.class);  
	    criteria.add(Restrictions.like("name", name));  
	    return (messageType) criteria.uniqueResult();   
	}
	
	/**
	 * The 'getMessageTypes' function will return the list of message types in the system.
	 * 
	 * @Table	messageTypes
	 * 
	 * @Param	page		This will hold the current page to view
	 * 			maxResults	This will hold the total number of results to return back to the list page
	 * 
	 * @Return	This function will return a list of message type objects
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<messageType> getMessageTypes(int page, int maxResults) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from messageType order by name asc");
		
		int firstResult = 0;
		
		//Set the parameters for paging
		//Set the page to load
		if(page > 1) {
			firstResult = (maxResults*(page-1));
		}
		query.setFirstResult(firstResult);
		//Set the max results to display
		query.setMaxResults(maxResults);
		
		return query.list();
		
	}
	
	/**
	 * The 'getLatestMessageTypes' function will return the list of the latest message types in the system.
	 * 
	 * @Table	messageTypes
	 * 
	 * @Param	maxResults	This will hold the total number of results to return back to the page
	 * 
	 * @Return	This function will return a list of message type objects
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<messageType> getLatestMessageTypes(int maxResults) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from messageType order by dateCreated desc");
	
		//Set the max results to display
		query.setMaxResults(maxResults);
		
		return query.list();
		
	}
	
	/**
	 * The 'getActiveMessageTypes' function will return the list of the active message types in the system.
	 * 
	 * @Table	messageTypes
	 * 
	 * @Return	This function will return a list of active message type objects
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<messageType> getActiveMessageTypes() {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from messageType where status = 1 order by name asc");
	
		return query.list();		
	}
	
	/**
	 * The 'findMessageTypes' function will return a list of message type objects based on a search term. 
	 * The search will look for message types whose title or file name match the search term provided.
	 * 
	 * @param	searchTerm	This will be used to query the title and file name field
	 * 
	 * @return		The function will return a list of message type objects
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<messageType> findMessageTypes(String searchTerm) {
	    //Order by title
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(messageType.class)
	    	.add(Restrictions.or(
	    			Restrictions.like("name", "%"+searchTerm+"%"),
	    			Restrictions.like("templateFile", "%"+searchTerm+"%")
	     		)
	     	)
	     	.addOrder(Order.asc("name"));
	     
	     return criteria.list();  
	}
	
	/**
	 * The 'findTotalMessageTypes' function will return the total number of message types in the system
	 * 
	 * @Table	messageTypes
	 * 
	 * 
	 * @Return	This function will return the total number of message types set up in the system
	 */
	@Override
	public Long findTotalMessageTypes() {
		
		Query query = sessionFactory.getCurrentSession().createQuery("select count(*) as totalMessageTypes from messageType");
		
		Long totalMessageTypes = (Long) query.uniqueResult();
		
		return totalMessageTypes;
	}
	
	/**
	 * The 'findTotalCrosswalks' function will return the total number of generic crosswalks in the system
	 * 
	 * @Table	crosswalks
	 * 
	 * 
	 * @Return	This function will return the total number of generic crosswalks set up in the system
	 */
	@Override
	public Long findTotalCrosswalks() {
		
		Query query = sessionFactory.getCurrentSession().createQuery("select count(*) as totalCrosswalks from Crosswalks where orgId = 0");
		
		Long totalCrosswalks = (Long) query.uniqueResult();
		
		return totalCrosswalks;
	}
	
	/**
	* The 'getMessageTypeFields' function will return all the form fields associated to the selected message type.
	* 
	* @Table messageTypeFormFields
	* 
	* @Return This function will return a list of fields
	*/
	@Override
	@SuppressWarnings("unchecked")
	public List<messageTypeFormFields> getMessageTypeFields(int messageTypeId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(messageTypeFormFields.class)
			.add(Restrictions.eq("messageTypeId",messageTypeId))
			.addOrder(Order.asc("bucketNo"))
	     	.addOrder(Order.asc("bucketDspPos"));
		
		return criteria.list();
	}
	
	/**
	* The 'updateMessageTypeFields' function will update the selected message type field mappings
	* 
	* @Table messagTypeFormFields
	* 
	* @Return This function does not return anything
	*/
	@Override
	@Transactional
	public void updateMessageTypeFields(messageTypeFormFields formField) {
		sessionFactory.getCurrentSession().update(formField);
	}
	
	/**
	* The 'getInformationTables' function will return a list of all available information tables where we
	* can associate fields to an actual table and column.
	*/
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional
	public List getInformationTables() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT distinct table_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'universalTranslator' and (TABLE_NAME LIKE 'info\\_%' or TABLE_NAME LIKE 'message\\_%')");
		
		return query.list();
	}
	
	/**
	* The 'getTableColumns' function will return a list of columns from the passed in table name 
	* 
	*/
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional
	public List getTableColumns(String tableName) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'universalTranslator' AND TABLE_NAME = :tableName")
			.setParameter("tableName", tableName);
		
		return query.list();
	}
	
	/**
	* The 'getValidationTypes' function will return a list of available field validation types
	* 
	*/
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional
	public List getValidationTypes() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT id, validationType FROM ref_validationTypes order by validationType asc");
		
		return query.list();
	}
	
	/**
	* The 'getDelimiters' function will return a list of available file delimiters
	* 
	*/
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional
	public List getDelimiters() {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT id, delimiter FROM ref_delimiters order by delimiter asc");
		
		return query.list();
	}
	
	/**
	* The 'getDelimiterChar' will return the actual character of the delimiter for the id passed
	* into the function
	* 
	* @param id	The id will hold the delimiter ID to retrieve its associated character
	* 
	* @returns string
	*/
	@Transactional
	public String getDelimiterChar(int id) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT delimChar FROM ref_delimiters where id = :id");
			query.setParameter("id",id);
			
		String delimChar = (String) query.uniqueResult();
		
		return delimChar;
	}
	
	/**
	* The 'getTotalFields' function will return the number of fields for a passed in message type.
	* 
	* @Param messageTypeId			The message type to search
	* 
	* @Return	Long		The total number of fields for the message type
	*/
	public Long getTotalFields(int messageTypeId) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("select count(*) as totalFields from messageTypeFormFields where messageTypeId = :messageTypeId")
			.setParameter("messageTypeId", messageTypeId);
		
		Long totalFields = (Long) query.uniqueResult();
		
		return totalFields;
		
	}
	
	/**
	 * The 'getCrosswalks' function will return the list of available crosswalks to associate a
	 * message types to. This function will only return crosswalks not associated to a specific
	 * organization.
	 * 
	 * @param 	page	The current crosswalk page
	 * @param	maxResults	The maximum number of crosswalks to return from each query
	 * @param	orgId	The organization id (default 0) 
	 * 
	 * @Table	crosswalks
	 * 
	 * @Return	This function will return a list of crosswalks
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Crosswalks>  getCrosswalks(int page, int maxResults, int orgId) {
		
		Query query = null;
		
		if(orgId == 0) {
			query = sessionFactory.getCurrentSession().createQuery("from Crosswalks where orgId = 0 order by name asc");
		}
		else {
			query = sessionFactory.getCurrentSession().createQuery("from Crosswalks where (orgId = 0 or orgId = :orgId) order by name asc");
			query.setParameter("orgId", orgId);
		}
		
		int firstResult = 0;
		
		//Set the parameters for paging
		//Set the page to load
		if(page > 1) {
			firstResult = (maxResults*(page-1));
		}
		query.setFirstResult(firstResult);
		
		//Set the max results to display
		//If 0 is passed then we want all crosswalks
		if(maxResults > 0) {
			query.setMaxResults(maxResults);
		}
		
		return query.list();
		
	}
	
	/**
	 * 
	 */
	@Override
	@Transactional
	public Long checkCrosswalkName(String name, int orgId) {
		Query query = null;
		
		if(orgId > 0) {
			query = sessionFactory.getCurrentSession().createQuery("select count(id) as total from Crosswalks where name = :name and orgId = :orgId");
			query.setParameter("name", name);
			query.setParameter("orgId", orgId);
		}
		else {
			query = sessionFactory.getCurrentSession().createQuery("select count(id) as total from Crosswalks where name = :name");
			query.setParameter("name",name);
		}
		
	    Long cwId = (Long) query.uniqueResult();
		
		return cwId;
	}
	
	/**
	 * The 'createCrosswalk" function will create the new crosswalk 
	 * 
	 * @Table	crosswalks
	 * 
	 * @param	crosswalkDetails	This will hold the crosswalk object from the form
	 * 
	 * @return 	The function will return the id of the new crosswalk
	 * 
	 */
	@Override
	public Integer createCrosswalk(Crosswalks crosswalkDetails) {
		Integer lastId = null;
			
		lastId = (Integer) sessionFactory.getCurrentSession().save(crosswalkDetails);
		
		return lastId;
	}
	
	
	/**
	 * The 'getCrosswalk' function will return a single crosswalk object based on the id
	 * passed in.
	 * 
	 * @param	cwId	This will be id to find the specific crosswalk
	 * 
	 * @return			The function will return a crosswalk object 
	 */
	@Override
	public Crosswalks getCrosswalk(int cwId) {
      return (Crosswalks) sessionFactory.getCurrentSession().get(Crosswalks.class, cwId);
	}
	
	/**
	* The 'getDelimiters' function will return a list of available file delimiters
	* 
	* @param	cwId	This will be the id of the crosswalk to return the associated
	* 					data elements for
	* 
	* @return		The function will return a list of data objects for the crosswalk
	* 
	*/
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional
	public List getCrosswalkData(int cwId) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT sourceValue, targetValue, descValue FROM rel_crosswalkData where crosswalkId = :crosswalkid order by id asc");
			  query.setParameter("crosswalkid", cwId);
		
		return query.list();
	}
	
	/**
	* The 'saveDataTranslations' function will save the submitted translations
	* for the selected message type
	* 
	* @param translations	the messagetypedatatranslations object
	* 
	*/
	@Override
	@Transactional
	public void saveDataTranslations(messageTypeDataTranslations translations) {
		sessionFactory.getCurrentSession().save(translations);
	}
	
	/**
	* The 'deleteDataTranslations' function will remove all data translations for the
	* passed in message type.
	* 
	* @param	messageTypeId	The id of the message type to remove associated translations
	* 
	*/
	@Override
	@Transactional
	public void deleteDataTranslations(int messageTypeId) {
		Query deleteTranslations = sessionFactory.getCurrentSession().createQuery("delete from messageTypeDataTranslations where messageTypeId = :messageTypeId");
		deleteTranslations.setParameter("messageTypeId",messageTypeId);
		deleteTranslations.executeUpdate();
	}
	
	/**
	* The 'getMessgeTypeTranslations' function will return a list of data translations saved
	* for the passed in message type.
	* 
	* @param	messageTypeId	The id of the message type we want to return associated translations
	* 							for.
	* 
	* @return	This function will return a list of translations
	*/
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<messageTypeDataTranslations> getMessageTypeTranslations(int messageTypeId) {
		Query query = sessionFactory.getCurrentSession().createQuery("from messageTypeDataTranslations where messageTypeId = :messageTypeId order by processOrder asc");
			  query.setParameter("messageTypeId",messageTypeId);
		
		return query.list();
	}
	
	/**
	 * The 'getFieldName' function will return the name of a field based on the fieldId passed in.
	 * This is used for display purposes to show the actual field lable instead of a field name.
	 * 
	 * @param fieldId	This will hold the id of the field to retrieve
	 * 
	 * @Return This function will return a string (field name)
	 */
	@Override
	@Transactional
	public String getFieldName(int fieldId) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT fieldDesc FROM messageTypeFormFields where id = :fieldId")
				.setParameter("fieldId", fieldId);
			
		String fieldName = (String) query.uniqueResult();
		
		return fieldName;
	}
	
	/**
	 * The 'getCrosswalkName' function will return the name of a crosswalk based on the id passed in.
	 * 
	 * @param cwId		This will hold the id of the crosswalk to retrieve
	 * 
	 * @Return 	This function will return a string (crosswalk name).
	 */
	@Override
	@Transactional
	public String getCrosswalkName(int cwId) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery("SELECT name FROM crosswalks where id = :cwId")
				.setParameter("cwId", cwId);
			
		String cwName = (String) query.uniqueResult();
		
		return cwName;
	}
	

}
