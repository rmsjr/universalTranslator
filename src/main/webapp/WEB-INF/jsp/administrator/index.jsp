<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- Actions Nav -->
<nav class="navbar navbar-default actions-nav" role="navigation">
	<div class="contain">
		<div class="navbar-header">
			<h1 class="section-title navbar-brand"><a href="" title="Section Title" class="unstyled-link">Dashboard</a></h1>
		</div>
	</div>
</nav>
<!-- End Actions Nav -->

	<div class="main clearfix full-width" role="main">

		<div class="row-fluid contain">
			<div class="col-md-12">
				<section class="panel panel-default panel-intro">
					<div class="panel-body" >
						<h2>Welcome <c:out value="${pageContext.request.userPrincipal.name}" />!</h2>
						<p>This is some intro text</p>
					</div>
				</section>
			</div>
		</div>

		<div class="row-fluid contain basic-clearfix">
			<div class="col-md-3 col-sm-3 col-xs-6">
				<section class="panel panel-default panel-stats">
					<div class="panel-body">
						<span class="stat-number"><a href="?page=organizations" title="">${totalOrgs}</a></span>
						<h3>Organizations</h3>
						<a href="administrator/organizations/list" title="Organization Manager" class="btn btn-primary btn-small">View all</a>
					</div>
				</section>
			</div>

			<div class="col-md-3 col-sm-3 col-xs-6">
				<section class="panel panel-default panel-stats">
					<div class="panel-body">
						<span class="stat-number"><a href="?page=configurations" title="">${totalConfigs}</a></span>
						<h3>Configurations</h3>
						<a href="administrator/configurations/list" title="Configuration Manager" class="btn btn-primary btn-small">View all</a>
					</div>
				</section>
			</div>

			<div class="col-md-3 col-sm-3 col-xs-6">
				<section class="panel panel-default panel-stats">
					<div class="panel-body">
						<span class="stat-number"><a href="?page=configurations" title="">${totalMessageTypes}</a></span>
						<h3>Message Types</h3>
						<a href="administrator/library/list" title="Message Type Library Manager" class="btn btn-primary btn-small">View all</a>
					</div>
				</section>
			</div>

			<div class="col-md-3 col-sm-3 col-xs-6">
				<section class="panel panel-default panel-stats">
					<div class="panel-body">
						<span class="stat-number"><a href="" title="">0</a></span>
						<h3>Files to Process</h3>
						<a href="" title="" class="btn btn-primary btn-small">View all</a>
					</div>
				</section>
			</div>
		</div>

		<div class="row-fluid contain basic-clearfix">
			<div class="col-md-6">
				<section class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Configurations</h3>
					</div>
					<div class="panel-body" >
						<p>This is some text that explains configurations... Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

						<h4>Latest Configurations:</h4>
							<table class="table table-striped table-hover table-default">
								<tbody>
									<tr>
										<td><a href="" title=""><strong>St. Joes Weight Loss</strong></a>
											<br/> <strong>Source:</strong> St. Joes Hospital
											<br/> <strong>Message Type:</strong>  Weight Loss
										</td>
										<td>
											8/20/2013
										</td>
										<td class="actions-col">
											<a href="?page=configurations-edit-details" class="btn btn-link">
												<span class="glyphicon glyphicon-edit"></span>
												Edit
											</a>
										</td>
									</tr>
									<tr>
										<td><a href="" title=""><strong>St. Joes Weight Loss</strong></a>
											<br/> <strong>Source:</strong> St. Joes Hospital
											<br/> <strong>Message Type:</strong>  Weight Loss
										</td>
										<td>
											8/20/2013
										</td>
										<td class="actions-col">
											<a href="?page=configurations-edit-details" class="btn btn-link">
												<span class="glyphicon glyphicon-edit"></span>
												Edit
											</a>
										</td>
									</tr>
									<tr>
										<td><a href="" title=""><strong>St. Joes Weight Loss</strong></a>
											<br/> <strong>Source:</strong> St. Joes Hospital
											<br/> <strong>Message Type:</strong>  Weight Loss
										</td>
										<td>
											8/20/2013
										</td>
										<td class="actions-col">
											<a href="?page=configurations-edit-details" class="btn btn-link">
												<span class="glyphicon glyphicon-edit"></span>
												Edit
											</a>
										</td>
									</tr>
								</tbody>
							</table>
					</div>
				</section>
			</div>

			<div class="col-md-6">
				<section class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Organizations</h3>
					</div>
					<div class="panel-body" >
						<p>This is some text that explains Organizations... Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

						<h4>Latest Organizations:</h4>
						<c:if test="${not empty latestOrgs}">
						<table class="table table-striped table-hover table-default">
								<tbody>
									<c:forEach var="org" items="${latestOrgs}">
										<tr>
											<td>
												<a href="administrator/organizations/${org.cleanURL}" title="Edit this Organization"><strong>${org.orgName}</strong></a>
												<address>
													${org.address} <c:if test="${not empty org.address2}"><br />${org.address2}</c:if>
													<br />${org.city} ${org.state}, ${org.postalCode}
												</address>
												<strong>Access Level:</strong> <c:choose>
													<c:when test="${org.publicOrg == true}">
														Public
													</c:when>
													<c:otherwise>
														Private
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<fmt:formatDate value="${org.dateCreated}" type="date" pattern="M/dd/yyyy" />
											</td>
											<td>
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
												<a href="administrator/organizations/${org.cleanURL}" class="btn btn-link" title="Edit this Organization">
													<span class="glyphicon glyphicon-edit"></span>
													Edit
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</div>
				</section>
			</div>
		</div>

		<div class="row-fluid contain">
			<div class="col-md-6">
				<section class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Message Types</h3>
					</div>
					<div class="panel-body" >
						<p>This is some text that explains Message Types... Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

						<h4>Latest Message Types:</h4>
						<c:if test="${not empty latestMessageTypes}">
							<table class="table table-striped table-hover table-default">
								<tbody>
									<c:forEach var="messageType" items="${latestMessageTypes}">
										<tr>
											<td>
												<a href="administrator/library/details?i=${messageType.id}" title="Edit this Organization"><strong>${messageType.name}</strong></a>
												<br /><strong>Status:</strong> <c:choose><c:when test="${messageType.status == 1}">active</c:when><c:when test="${messageType.status == 0}">inactive</c:when><c:otherwise>archived</c:otherwise></c:choose> 
											</td>
											<td>
												<fmt:formatDate value="${messageType.dateCreated}" type="date" pattern="M/dd/yyyy" />
											</td>
											<td class="actions-col">
												<a href="administrator/library/details?i=${messageType.id}" class="btn btn-link" title="Edit this Organization">
													<span class="glyphicon glyphicon-edit"></span>
													Edit
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</div>
				</section>
			</div>

			<div class="col-md-6">
				<section class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Scheduler</h3>
					</div>
					<div class="panel-body" >
						<p>This is some text that explains Organizations... Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

						<h4>Latest Schedules:</h4>
					</div>
				</section>
			</div>
		</div>
	</div>









