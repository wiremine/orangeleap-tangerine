<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="base">
	<tiles:putAttribute name="browserTitle" value="Person" />
	<tiles:putAttribute name="primaryNav" value="People" />
	<tiles:putAttribute name="secondaryNav" value="Edit" />
	<tiles:putAttribute name="sidebarNav" value="List Gifts" />
	<tiles:putAttribute name="mainContent" type="string">
		<div class="content760 mainForm">
			<c:choose>
			<c:when test="${!empty giftList}">
				<div class="searchResultsHeader">
					<div class="pagination"><span class="disabled">� Previous</span> <span class="current">1</span> <a href="#">2</a> <a href="#">3</a> <a href="#">Next �</a></div>
					<h4 class="searchResults">Gifts <strong>1 - ${giftListSize}</strong> of <strong>${giftListSize}</strong></h4>
				</div>

				<mp:page pageName='giftList' />
				<c:forEach var="sectionDefinition" items="${sectionDefinitions}">
					<table id="giftListTable" class="tablesorter" cellspacing="0" cellpadding="0">
						<thead>
							<c:forEach items="${giftList}" var="gift" begin="0" end="0">
								<tr>
									<th>&nbsp;</th>
									<%@ include file="/WEB-INF/jsp/snippets/gridResultsHeaderGift.jsp" %>
								</tr>
							</c:forEach>
						</thead>
						<tbody>
							<c:forEach items="${giftList}" var="gift">
								<tr>
									<td><a href="giftView.htm?giftId=${gift.id}">View</a></td>
									<%@ include file="/WEB-INF/jsp/snippets/gridResultsGift.jsp" %>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:forEach>



			</c:when>
			<c:when test="${giftList ne null}">
				<p style="margin:8px 0 6px 0;">Your search returned no results.</p>
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>