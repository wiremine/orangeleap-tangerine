<%@ include file="/WEB-INF/jsp/include.jsp"%>

<mp:page pageName='person' />
<c:set var="person" value="${person}" scope="request" />
<c:if test="${person.id!=null}">
	<c:set var="viewingPerson" value="true" scope="request" />
</c:if>

<form:form method="post" commandName="person">
	<c:if test="${id != null}">
		<input type="hidden" name="id" value="${id}" />
	</c:if>

	<div class="columns iconHeader">
		<div class="column">
			<img src="images/dude2.gif" />
		</div>
		<div class="column">
		<c:choose>
		<c:when test="${viewingPerson}">
			<h2 class="personEdit">
				${person.lastName}<c:if test="${!empty person.lastName && !empty person.firstName}">, </c:if>${person.firstName}<c:if test="${person.majorDonor}"><span class="majorDonor">(Major Donor)</span></c:if>
			</h2>
		</c:when>
		<c:otherwise>
			<h2 class="personEdit">
				New Person
			</h2>
		</c:otherwise>
		</c:choose>
			<h3 id="currentFunctionTitle" class="personEdit">
				Profile<c:if test="${saved}"><span id="savedMarker">Saved</span></c:if>
			</h3>
		</div>
		<div class="columnRight" style="padding:19px 19px 0 0;">
			<input type="submit" value="Save Changes" />
		</div>
		<div class="clearColumns"></div>
	</div>
	
	<form:errors path="*">
		<div class="globalFormErrors">
			<h5>Please correct the following errors on this page:</h5>
			<ul>
			<c:forEach items="${messages}" var="message">
				<li>${message}</li>
			</c:forEach>
			</ul>
		</div>
	</form:errors>

	<c:forEach var="sectionDefinition" items="${sectionDefinitions}">
		<h4 class="formSectionHeader"><mp:sectionHeader sectionDefinition="${sectionDefinition}" /></h4>
		<%@ include file="/WEB-INF/jsp/snippets/fieldLayout.jsp" %>
	</c:forEach>
	<div class="formButtonFooter personFormButtons">
		<input type="submit" value="Save Changes" class="saveButton" />
		<a class="newAccountButton" href="person.htm">Create Another Person � </a>
	</div>
</form:form>