<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-default actions-nav" role="navigation">
	<div class="contain">
		<div class="navbar-header">
			<h1 class="section-title navbar-brand">
				<c:choose>
					<c:when test="${param['page'] == 'listConfigs'}">
						<a href="javascript:void(0);" title="Configuration List" class="unstyled-link">Configurations</a>
					</c:when>
					<c:when test="${param['page'] == 'configDetails'}">
						<a href="javascript:void(0);" title="Configuration Details" class="unstyled-link">
							<c:choose>
								<c:when test="${not empty id}">
									Edit Configuration
								</c:when>
								<c:otherwise>
									Create New Configuration
								</c:otherwise>
							</c:choose>
						</a>
					</c:when>
					<c:when test="${param['page'] == 'transport'}">
						<a href="javascript:void(0);" title="Configuration Transport Details" class="unstyled-link">Configuration Transport Details</a>
					</c:when>
					<c:when test="${param['page'] == 'mappings'}">
						<a href="javascript:void(0);" title="Configuration Field Mappings" class="unstyled-link">Configuration Field Mappings</a>
					</c:when>
					<c:when test="${param['page'] == 'chooseFields'}">
						<a href="javascript:void(0);" title="Configuration Choose Fields" class="unstyled-link">Configuration Choose Fields</a>
					</c:when>
					<c:when test="${param['page'] == 'translations'}">
						<a href="javascript:void(0);" title="Configuration Data Translations" class="unstyled-link">Configuration Data Translations</a>
					</c:when>
					<c:when test="${param['page'] == 'connections'}">
						<a href="javascript:void(0);" title="Configuration Connections" class="unstyled-link">Configuration Connections</a>
					</c:when>
				</c:choose>
			</h1>
		</div>
		<ul class="nav navbar-nav navbar-right navbar-actions">
			<c:choose>
				<c:when test="${param['page'] == 'listConfigs'}">
					<li><a href="create" title="Create New Configuration"><span class="glyphicon icon-stacked glyphicon glyphicon-plus"></span>Create New</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:void(0);" id="saveDetails" title="Save this Organization"><span class="glyphicon glyphicon-ok icon-stacked"></span> Save </a></li>
					<c:if test="${not empty id}"><li><a href="javascript:void(0);" id="next" title="Save and Proceed to the Next Step"><span class="glyphicon glyphicon-forward icon-stacked"></span>Next Step</a></li></c:if>
					<c:if test="${not empty id}"><li><a href="#confirmationOrgDelete" data-toggle="modal" rel="${id}" title="Delete this Organization"><span class="glyphicon glyphicon-remove icon-stacked"></span>Delete</a></li></c:if>
					<li><a href="<c:url value='/administrator/configurations/list' />" title="Cancel"><span class="glyphicon icon-stacked custom-icon icon-cancel"></span>Cancel</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>

