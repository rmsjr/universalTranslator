
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 class="panel-title"><c:choose><c:when test="${crosswalkDetails.id > 0}">View</c:when><c:when test="${btnValue == 'Create'}">Add</c:when></c:choose> Crosswalk ${success}</h3>
		</div>
		<div class="modal-body">
			<form:form id="crosswalkdetailsform" commandName="crosswalkDetails" modelAttribute="crosswalkDetails" enctype="multipart/form-data" method="post" role="form">
				<form:hidden path="id" id="id" />
				<form:hidden path="dateCreated" />
				<form:hidden path="fileDelimiter" value="1" />
				<div class="form-container">
					<spring:bind path="name">
						<div id="crosswalkNameDiv" class="form-group ${status.error ? 'has-error' : '' }">
							<label class="control-label" for="name">Crosswalk Name*</label>
							<c:choose>
								<c:when test="${crosswalkDetails.id > 0 }">
									<br />${crosswalkDetails.name}
								</c:when>
								<c:otherwise>
									<form:input path="name" id="name" class="form-control" type="text" maxLength="45" />
									<span id="crosswalkNameMsg" class="control-label"></span>
								</c:otherwise>
							</c:choose>
						</div>
					</spring:bind>
					<spring:bind path="file">
						<div id="crosswalkFileDiv" class="form-group ${status.error ? 'has-error' : '' }">
							<label class="control-label" for="crosswalkFile">Crosswalk File *</label>
							<c:choose>
								<c:when test="${crosswalkDetails.id > 0 }">
									<br />${crosswalkDetails.fileName}
								</c:when>
								<c:otherwise>
									<form:input path="file" id="crosswalkFile" type="file"  />
									<span id="crosswalkFileMsg" class="control-label"></span>
								</c:otherwise>
							</c:choose>
						</div>
					</spring:bind>
					<c:if test="${crosswalkDetails.id == 0}">
						<div class="form-group">
							<input type="button" id="submitCrosswalkButton" rel="${btnValue}" class="btn btn-primary" value="${btnValue}"/>
						</div>
					</c:if>
					
					<c:if test="${crosswalkDetails.id > 0}">
						<div id="crosswalkNameDiv" class="form-group">
							<label class="control-label" for="data">Crosswalk Data</label>
							<br />
							<table class="table table-striped table-hover table-default">
								<thead>
									<tr>
										<th scope="col">Actual Value</th>
										<th scope="col">Description Value</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${crosswalkData}" var="cwalkData" varStatus="dStatus">
										<tr>
											<td scope="row">${crosswalkData[dStatus.index][0]}</td>
											<td>${crosswalkData[dStatus.index][1]}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
						</div>
					</c:if>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function() {
	    $("input:text,form").attr("autocomplete","off");

	    
	});

</script>