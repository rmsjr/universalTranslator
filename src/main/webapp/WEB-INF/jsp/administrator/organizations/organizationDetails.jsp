<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main clearfix" role="main">

	<div class="col-md-12">
	
		<c:if test="${not empty savedStatus}" >
			<div class="alert alert-success">
				<strong>Success!</strong> 
				<c:choose><c:when test="${savedStatus == 'updated'}">The organization has been successfully updated!</c:when><c:otherwise>The organization has been successfully created!</c:otherwise></c:choose>
			</div>
		</c:if>
	
		<form:form commandName="organization"  method="post" role="form">
			<input type="hidden" id="action" name="action" value="save" />
			<form:hidden path="id" id="orgId" />
			<form:hidden path="cleanURL" id="cleanURL" />
			<form:hidden path="dateCreated" />
			
			<section class="panel panel-default">
				
				<div class="panel-heading">
					<h3 class="panel-title">Details</h3>
				</div>
				<div class="panel-body">
					<div class="form-container">
						<div class="form-group">
							<label for="status">Status *</label>
							<div>
								<label class="radio-inline">
									<form:radiobutton id="status" path="status" value="true"/>Active 
								</label>
								<label class="radio-inline">
									<form:radiobutton id="status" path="status" value="false"/>Inactive
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="publicOrg">Viewable *</label>
							<div>
								<label class="radio-inline">
									<form:radiobutton id="publicOrg" path="publicOrg" value="true"/>Public
								</label>
								<label class="radio-inline">
									<form:radiobutton id="publicOrg" path="publicOrg" value="false"/>Private 
								</label>
							</div>
						</div>
						<spring:bind path="orgName">
							<div class="form-group ${status.error ? 'has-error' : '' } ${not empty esistingOrg ? 'has-error' : ''}">
								<label class="control-label" for="orgName">Name *</label>
								<form:input path="orgName" id="orgName" class="form-control" type="text" maxLength="255" />
								<form:errors path="orgName" cssClass="control-label" element="label" />
								<c:if test="${not empty existingOrg}">${existingOrg}</c:if>
							</div>
						</spring:bind>
						<spring:bind path="address">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="address">Address *</label>
								<form:input path="address" id="address" class="form-control" type="text" maxLength="45" />
								<form:errors path="address" cssClass="control-label" element="label" />
							</div>
						</spring:bind>
						<div class="form-group">
							<label for="Address 2">Address 2</label>
							<form:input path="address2" class="form-control" type="text" />
						</div>
						<spring:bind path="city">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="city">City *</label>
								<form:input path="city" id="city" class="form-control" type="text" maxLength="45" />
								<form:errors path="city" cssClass="control-label" element="label" />
							</div>
						</spring:bind>
						<spring:bind path="state">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="state">State *</label>
								<form:select id="state" path="state" cssClass="form-control half">
								     <option value="" label=" - Select - " ></option>
								     <form:options items="${stateList}"/>
								</form:select>
								<form:errors path="state" cssClass="control-label" element="label" />
							</div>
						</spring:bind>
						<spring:bind path="postalCode">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="postalCode">Postal Code *</label>
								<form:input path="postalCode" id="postalCode" class="form-control" type="text" maxLength="15" />
								<form:errors path="postalCode" cssClass="control-label" element="label" />
							</div>
						</spring:bind>
						<spring:bind path="phone">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="phone">Phone *</label>
								<form:input path="phone" id="phone" class="form-control" type="text" maxLength="45" />
								<form:errors path="phone" cssClass="control-label" element="label" />
							</div>
						</spring:bind>
						<div class="form-group">
							<label for="fax">Fax</label>
							<form:input path="fax" class="form-control" type="text" maxLength="45" />
						</div>
					</div>
				</div>
			</section>
		</form:form>
	</div>
</div>

<!-- The delete an organization modal -->
<div class="modal fade" id="confirmationOrgDelete" role="dialog" tabindex="-1" aria-labeledby="Delete Organization" aria-hidden="true" aria-describedby="Delete Organization">
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 class="panel-title">Organization Delete</h3>
		</div>
		<div class="modal-body">
			<p>
			Are you <strong>ABSOLUTELY</strong> sure?
			<br/><br />
			This action <strong>CANNOT</strong> be undone. This will delete all associated configurations, system users, providers and uploaded brochures.
			An alternative would be to make the organization inactive. This will set all system users and configurations to an inactive state.
			<br/><br />
			Please type in your username to confirm this deletion.
			</p>
			<form id="confirmOrgDelete" method="post" role="form" action="delete">
				<div id="confirmDiv" class="form-group" >
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" id="realUsername" name="realUsername" value="${pageContext.request.userPrincipal.name}" />
					<input type="text" id="username" name="username" class="form-control" maxLength="15"  />
					<span id="confirmMsg" class="control-label"></span>
				</div>
				<br/>
				<div class="form-group">
					<input type="button" disabled id="submitButton" class="btn btn-primary" value="I understand the consequences, delete this organization" />
				</div>
			</form>
		</div>
	</div>
</div>
</div>


<script type="text/javascript">

	$(document).ready(function() {
	    $("input:text,form").attr("autocomplete","off");
	})

	$(function() {
		//Fade out the updated/created message after being displayed.
		if($('.alert').length >0) {
			$('.alert').delay(2000).fadeOut(1000);
		}

		//When the user starts to enter their username make the delete button active
		$('#username').keyup(function(event) {
			if($('#username').val() == '') {
				$('#submitButton').attr("disabled", "disabled");
			}
			else {
				$('#submitButton').removeAttr("disabled"); 
			}
		});

		//Make sure the two values equal before the delete function is allowed
		$('#submitButton').click(function(event) {
			if($('#realUsername').val() != $('#username').val()) {
				$('#confirmDiv').addClass("has-error");
				$('#confirmMsg').html('That is not correct!');
			}
			else {
				$('#confirmOrgDelete').submit();
			}
			
		});
		
		$('#saveDetails').click(function(event) {
			$('#action').val('save');
			$("#organization").submit();
		});
		
		$('#saveCloseDetails').click(function(event) {
			$('#action').val('close');
        	$('#organization').submit();
		});

		//Need to set the organization clean url based off of the organization name
		$('#orgName').keyup(function(event) {
			var orgName = $(this).val();
			var strippedorgName = orgName.replace(/ +/g, '');
			$('#cleanURL').val(strippedorgName);
			$('#nameChange').val(1);
		});

	});
</script>
