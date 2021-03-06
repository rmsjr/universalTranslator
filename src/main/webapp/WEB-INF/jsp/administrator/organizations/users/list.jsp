<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>


<div class="main clearfix" role="main" rel="listoforganizationusers">
	<div class="col-md-12">
		
		<c:if test="${not empty param.msg}" >
			<div class="alert alert-success">
				<strong>Success!</strong> 
				<c:choose><c:when test="${param.msg == 'updated'}">The system user has been successfully updated!</c:when><c:when test="${param.msg == 'created'}">The system user has been successfully added!</c:when></c:choose>
			</div>
		</c:if>
		<section class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">System Users</h3>
			</div>
			<div class="panel-body">
				<div class="table-actions">
					<div class="form form-inline pull-left">
						<form:form class="form form-inline" action="users" method="post">
							<div class="form-group">
								<label class="sr-only" for="searchTerm">Search</label>
								<input type="text" name="searchTerm" id="searchTerm" value="${searchTerm}" class="form-control" id="search-users" placeholder="Search"/>
							</div>
							<button id="searchOrgBtn" class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</form:form>
					</div>
					<a href="#systemUsersModal" id="createNewUser" data-toggle="modal" class="btn btn-primary btn-sm pull-right" title="Create a new system user">
						<span class="glyphicon glyphicon-plus"></span>
					</a>
				</div>

				<div class="form-container scrollable">
					<table class="table table-striped table-hover table-default">
						<thead>
							<tr>
								<th scope="col">Name</th>
								<th scope="col" style="text-align:center">Date Created</th>
								<th scope="col" style="text-align:center">Primary</th>
								<th scope="col" style="text-align:center">Secondary</th>
								<th scope="col" style="text-align:center">Times Logged In</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								  <c:when test="${not empty userList}">
								    <c:forEach var="user" items="${userList}">
										<tr id="userRow">
											<td scope="row"><a href="#systemUsersModal" data-toggle="modal" rel="${user.firstName}${user.lastName}?i=${user.id}" class="userEdit" title="Edit this user">${user.firstName} ${user.lastName}</a><br />(<c:choose><c:when test="${user.status == true}">active</c:when><c:otherwise>inactive</c:otherwise></c:choose>)</td>
											<td class="center-text"><fmt:formatDate value="${user.dateCreated}" type="date" pattern="M/dd/yyyy" /></td>
											<td class="center-text">
												<c:if test="${user.mainContact == 1}">X</c:if><c:if test="${user.mainContact != 1}">--</c:if>
											</td>
											<td class="center-text">
												<c:if test="${user.mainContact == 2}">X</c:if><c:if test="${user.mainContact != 2}">--</c:if>
											</td>
											<td class="center-text">${userFunctions.findTotalLogins(user.id)}</td>
											<td class="actions-col">
												<a href="#systemUsersModal" data-toggle="modal" rel="${user.firstName}${user.lastName}?i=${user.id}" class="btn btn-link userEdit" title="Edit this user">
													<span class="glyphicon glyphicon-edit"></span>
													Edit	
												</a>
											</td>
										</tr>
									</c:forEach>
								  </c:when>
								  <c:otherwise>
								   	<tr><td colspan="6" class="center-text">There are currently no organization users set up.</td></tr>
								  </c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<ul class="pagination pull-right" role="navigation" aria-labelledby="Paging ">
						<c:if test="${currentPage > 1}"><li><a href="?page=${currentPage-1}">&laquo;</a></li></c:if>
						<c:forEach var="i" begin="1" end="${totalPages}">
						<li><a href="?page=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${currentPage < totalPages}"><li><a href="?page=${currentPage+1}">&raquo;</a></li></c:if>
					</ul>
				</div>
			</div>
		</section>
	</div>		
</div>	
<p rel="${currentPage}" id="currentPageHolder" style="display:none"></p>

<!-- Providers modal -->
<div class="modal fade" id="systemUsersModal" role="dialog" tabindex="-1" aria-labeledby="Add System Users" aria-hidden="true" aria-describedby="Add new system users"></div>

<script>
	$.ajaxSetup({
		cache:false
	});

	//var searchTimeout;

	jQuery(document).ready(function($) {

		//Fade out the updated/created message after being displayed.
		if($('.alert').length >0) {
			$('.alert').delay(2000).fadeOut(1000);
		}
				
	    $("input:text,form").attr("autocomplete","off");

	    //This function will launch the new system user overlay with a blank screen
	    $(document).on('click','#createNewUser',function() {
	    	$.ajax({  
		        url: 'newSystemUser',  
		        type: "GET",  
		        success: function(data) {  
		            $("#systemUsersModal").html(data);           
		        }  
		    });  
		});

		//This function will launch the edit system user overlay populating the fields
		//with the data of the clicked user.
		$(document).on('click', '.userEdit',function() {
			var userDetailsAction = 'user/'+$(this).attr('rel');

			$.ajax({  
		        url: userDetailsAction,  
		        type: "GET",  
		        success: function(data) {  
		            $("#systemUsersModal").html(data);           
		        }  
		    });  
		});

		$('#searchOrgBtn').click(function() {
			$('#searchForm').submit();
		});


		//Function to submit the changes to an existing user or 
		//submit the new user fields from the modal window.
		$(document).on('click', '#submitButton',function(event) {
			var currentPage = $('#currentPageHolder').attr('rel');
			var passwordVal = $('#password').val();
			var confirmPasswordVal = $('#confirmPassword').val();

			if(passwordVal != confirmPasswordVal) {
				$('#confirmPasswordDiv').addClass("has-error");	
				$('#passwordDiv').addClass("has-error");
				$('#confimPasswordMsg').addClass("has-error");
				$('#confimPasswordMsg').html('The two passwords do not match.');
				event.preventDefault();
			    return false;
			}
			else {
				var formData = $("#userdetailsform").serialize();  

				var actionValue = $(this).attr('rel').toLowerCase();
				
				$.ajax({  
			        url: actionValue,  
			        data: formData,  
			        type: "POST",  
			        async: false,
			        success: function(data) { 
				        if(data.indexOf('userUpdated') != -1) {
					        if(currentPage > 0) {
					        	window.location.href="users?msg=updated&page="+currentPage;
							}
					        else {
					        	window.location.href="users?msg=updated";
							}
							
						}
				        else if(data.indexOf('userCreated') != -1) {
				        	if(currentPage > 0) {
					        	window.location.href="users?msg=created&page="+currentPage;
							}
					        else {
					        	window.location.href="users?msg=created";
							}
							
						}
				        else {
			        		$("#systemUsersModal").html(data);
				        }
			        }  
			    });  
				event.preventDefault();
				return false;
			}

		});
		
	});

	/*function orglookup() {
		if(searchTimeout) {clearTimeout(searchTimeout);}

		var term = $('#searchTerm').val().toLowerCase();

		if(term.length >= 3 || term.length == 0) {
			$('#searchForm').submit();
		}
	}*/

	
</script>
