<%@ include file="/WEB-INF/jsp/include.jsp" %>
<page:applyDecorator name="form">
	<spring:message code='enterCommunicationHistory' var="titleText" scope="request" />
	<spring:message code='submit' var="submitText" />
	<c:set var="headerText" value="${titleText}" scope="request"/>

	<html>
		<head>
			<title><c:out value="${titleText} - ${requestScope.constituent.firstLast}"/></title>
		</head>
		<body>
			<form:form method="post" commandName="${requestScope.commandObject}">
				<c:set var="topButtons" scope="request">
					<input type="submit" value="<c:out value='${submitText}'/>" class="saveButton" id="submitButton"/>
				</c:set>
				<%@ include file="/WEB-INF/jsp/includes/formHeader.jsp"%>

				<tangerine:fields pageName="communicationHistory"/>

				<div class="formButtonFooter constituentFormButtons">
					<input type="submit" value="<spring:message code='submit'/>" class="saveButton" />
					<c:if test="${pageAccess['/communicationHistoryList.htm']!='DENIED'}">
						<input type="button" value="<spring:message code='cancel'/>" class="saveButton" onclick="OrangeLeap.gotoUrl('communicationHistoryList.htm?constituentId=${constituent.id}')"/>
					</c:if>
					<c:if test="${form.domainObject.id > 0}">
						<a class="newAccountButton" href="communicationHistory.htm?constituentId=${constituent.id}"><spring:message code='enterNew'/></a>
					</c:if>
				</div>
			</form:form>
		</body>
	</html>
</page:applyDecorator>
