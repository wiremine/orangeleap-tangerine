<%@ include file="/WEB-INF/jsp/include.jsp" %>
<mp:page pageName='viewGift'/>

<form:form method="post" commandName="gift">

	<c:forEach var="sectionDefinition" items="${sectionDefinitions}">
		<h1>
			<mp:sectionHeader sectionDefinition="${sectionDefinition}"/>
		</h1>
		<div class="searchSection">
			<%@ include file="/WEB-INF/jsp/snippets/fieldLayout.jsp" %>
			<a href="viewGift.htm?giftId=${gift.id}" class="newAccountButton">Create New Gift &raquo; </a>
		</div>
	</c:forEach>
	
</form:form>