<%@ include file="/WEB-INF/jsp/include.jsp" %>
<spring:message code='giftsInKind' var="titleText" />
<tiles:insertDefinition name="base">
	<tiles:putAttribute name="browserTitle" value="${titleText}" />
	<tiles:putAttribute name="primaryNav" value="People" />
	<tiles:putAttribute name="secondaryNav" value="Edit" />
	<tiles:putAttribute name="sidebarNav" value="Gifts-In-Kind" />
	<tiles:putAttribute name="mainContent" type="string">
		<mp:page pageName='giftInKindList' />
		<c:set var="person" value="${person}" scope="request" />
		<c:if test="${person.id!=null}">
			<c:set var="viewingPerson" value="true" scope="request" />
		</c:if>
		<div class="content760 mainForm">

		<jsp:include page="../snippets/personHeader.jsp">
			<jsp:param name="currentFunctionTitleText" value="${titleText}" />
		</jsp:include>
			
		<c:choose>
			<c:when test="${!empty list}">
				<div class="searchResultsHeader">
					<h4 class="searchResults"><spring:message code='giftsInKind'/>&nbsp;<strong>1 - ${listSize}</strong>&nbsp;<spring:message code='of'/>&nbsp;<strong>${listSize}</strong></h4>
				</div>

				<mp:page pageName='giftInKindList' />
				<c:forEach var="sectionDefinition" items="${sectionDefinitions}">
					<table id="giftInKindListTable" class="tablesorter" cellspacing="0" cellpadding="0">
						<thead>
							<c:forEach items="${list}" var="row" begin="0" end="0">
								<tr>
									<th>&nbsp;</th>
									<%@ include file="/WEB-INF/jsp/snippets/gridResultsHeader.jsp" %>
								</tr>
							</c:forEach>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="row">
								<tr>
									<td><a href="giftInKind.htm?giftInKindId=${row.id}&personId=${row.person.id}"><spring:message code='view'/></a></td>
									<%@ include file="/WEB-INF/jsp/snippets/gridResults.jsp" %>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:forEach>
				<p style="padding-top:12px;text-align:right;"><a class="newLink" href="giftInKind.htm?personId=${person.id}"><spring:message code='enterNewGiftInKind'/></a></p>
			</c:when>
			<c:when test="${list ne null}">
				<p style="margin:8px 0 6px 0;"><spring:message code='noGiftsInKindEntered'/></p>
				<p><spring:message code='wouldYouLikeTo'/> <a href="giftInKind.htm?personId=${person.id}"><spring:message code='createNewGiftInKind'/></a>?</p>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>