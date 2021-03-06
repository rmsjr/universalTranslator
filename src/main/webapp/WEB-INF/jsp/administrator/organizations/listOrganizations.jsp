<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>


<div class="main clearfix full-width" role="main">
	<div class="col-md-12">
		
		<c:if test="${not empty savedStatus}" >
			<div class="alert alert-success">
				<strong>Success!</strong> 
				<c:choose>
					<c:when test="${savedStatus == 'updated'}">The organization has been successfully updated!</c:when>
					<c:when test="${savedStatus == 'created'}">The organization has been successfully added!</c:when>
					<c:when test="${savedStatus == 'deleted'}">The organization has been successfully removed!</c:when>
				</c:choose>
			</div>
		</c:if>
	
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="table-actions">
					<form:form class="form form-inline" action="/administrator/organizations/list" method="post">
						<div class="form-group">
							<label class="sr-only" for="searchTerm">Search</label>
							<input type="text" name="searchTerm" id="searchTerm" value="${searchTerm}" class="form-control" id="search-organizations" placeholder="Search"/>
						</div>
						<button id="searchOrgBtn" class="btn btn-primary btn-sm" title="Search Organizations">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</form:form>
				</div>

				<div class="form-container scrollable">
					<table class="table table-striped table-hover table-default">
						<thead>
							<tr>
								<th scope="col">Organization Name ${result}</th>
								<th scope="col">Contact Information</th>
								<th scope="col" style="text-align:center"># of Users</th>
								<th scope="col" style="text-align:center"># of Configurations</th>
								<th scope="col" style="text-align:center">Date Created</th>
								<th scope="col" style="text-align:center">Access Level</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								  <c:when test="${not empty organizationList}">
								    <c:forEach var="org" items="${organizationList}">
										<tr id="orgRow" rel="${org.cleanURL}" style="cursor: pointer">
											<td scope="row">
												<a href="javascript:void(0);" title="Edit this organization">${org.orgName}</a>
												<br />(<c:choose><c:when test="${org.status == true}">active</c:when><c:otherwise>inactive</c:otherwise></c:choose>)
											</td>
											<td>
												${org.address} <c:if test="${not empty org.address2}"><br />${org.address2}</c:if>
												<br />${org.city} ${org.state}, ${org.postalCode}
											</td>
											<td class="center-text">
												${orgFunctions.findTotalUsers(org.id)}
											</td>
											<td class="center-text">
											 	${orgFunctions.findTotalConfigurations(org.id)}
											</td>
											<td class="center-text"><fmt:formatDate value="${org.dateCreated}" type="date" pattern="M/dd/yyyy" /></td>
											<td class="center-text">
												<c:choose>
													<c:when test="${org.publicOrg == true}">
														Public
													</c:when>
													<c:otherwise>
														Private
													</c:otherwise>
												</c:choose>
											</td>
											<td class="actions-col">
												<a href="javascript:void(0);" class="btn btn-link" title="Edit this organization">
													<span class="glyphicon glyphicon-edit"></span>
													Edit	
												</a>
											</td>
										</tr>
									</c:forEach>
								  </c:when>
								  <c:otherwise>
								   	<tr><td colspan="4" class="center-text">There are currently no organizations set up.</td></tr>
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
	
		$(document).on('click','#orgRow',function() {
			window.location.href= $(this).attr('rel')+'/';
		});

		$('#searchOrgBtn').click(function() {
			$('#searchForm').submit();
		});

		/*$("#searchTerm").keyup(function(event) {
			var term = $(this).val();

			if(term.length >= 3 || term.length == 0) {
				if(searchTimeout) {clearTimeout(searchTimeout);}
				searchTimeout = setInterval("orglookup()",500);
			}
		});*/
		
	});

	/*function orglookup() {
		if(searchTimeout) {clearTimeout(searchTimeout);}

		var term = $('#searchTerm').val().toLowerCase();

		if(term.length >= 3 || term.length == 0) {
			$('#searchForm').submit();
		}
	}*/

	
</script>
