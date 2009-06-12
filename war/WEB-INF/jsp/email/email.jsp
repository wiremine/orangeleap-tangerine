<%@ include file="/WEB-INF/jsp/include.jsp"%>

<mp:page pageName='email' />

<c:choose>
	<c:when test="${!empty emails}">
		<div class="searchResultsHeader">
			<h4 class="searchResults"><spring:message code='emails'/></h4>
		</div>
		<mp:page pageName='email' />
		<c:forEach var="sectionDefinition" items="${sectionDefinitions}">
			<c:forEach items="${emails}" var="row">
				<mp:section sectionDefinition="${sectionDefinition}" />
				<c:set var="totalFields" value="${sectionFieldCount}" />
				<c:forEach var="sectionField" items="${sectionFieldList}" varStatus="status">
					<mp:field sectionField='${sectionField}' sectionFieldList='${sectionFieldList}' model="${row}" />
					<c:if test="${fieldVO.fieldValue!=null}">
						<c:choose>
							<c:when test="${fieldVO.fieldName=='creditCardExpiration'}">
								<p style="margin: 0;">
									<c:out value='${fieldVO.labelText}'/>: <fmt:formatDate pattern="MM/yyyy" value="${fieldVO.fieldValue}" />
								</p>
							</c:when>
							<c:when test="${fieldVO.fieldType == 'DATE'}">
                               <c:choose>
                                    <c:when test="${fieldVO.fieldName =='seasonalStartDate' || fieldVO.fieldName == 'seasonalEndDate'}">
                                        <p style="margin: 0;">
                                            <c:out value='${fieldVO.labelText}'/>: <fmt:formatDate pattern="MMM-dd" value="${fieldVO.fieldValue}" />
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                         <p style="margin: 0;">
									        <c:out value='${fieldVO.labelText}'/>:  <fmt:formatDate pattern="MM/dd/yyyy" value="${fieldVO.fieldValue}" />
								        </p>
                                    </c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<p style="margin: 0;"><c:out value='${fieldVO.labelText}'/>:  <c:out value='${fieldVO.displayValue}'/></p>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				<a href="emailManagerEdit.htm?emailId=${row.id}&personId=${person.id}""><spring:message code='edit'/></a>
				<hr />
			</c:forEach>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="searchResultsHeader">
			<h4 class="searchResults"><spring:message code='emails'/></h4>
		</div>
		<p style="margin: 8px 0 6px 0;"><spring:message code='noEmailsEntered'/></p>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${!empty currentEmails}">
		<div class="searchResultsHeader">
			<h4 class="searchResults"><spring:message code='currentEmails'/></h4>
		</div>
		<mp:page pageName='email' />
		<c:forEach var="sectionDefinition" items="${sectionDefinitions}">
			<c:forEach items="${currentEmails}" var="row">
				<mp:section sectionDefinition="${sectionDefinition}" />
				<c:set var="totalFields" value="${sectionFieldCount}" />
				<c:forEach var="sectionField" items="${sectionFieldList}" varStatus="status">
					<mp:field sectionField='${sectionField}' sectionFieldList='${sectionFieldList}' model="${row}" />
					<c:if test="${fieldVO.fieldValue!=null}">
						<c:choose>
							<c:when test="${fieldVO.fieldName=='creditCardExpiration'}">
								<p style="margin: 0;">
									<c:out value='${fieldVO.labelText}'/>: <fmt:formatDate pattern="MM/yyyy" value="${fieldVO.fieldValue}" />
								</p>
							</c:when>
							<c:when test="${fieldVO.fieldType == 'DATE'}">
								 <c:choose>
                                    <c:when test="${fieldVO.fieldName =='seasonalStartDate' || fieldVO.fieldName == 'seasonalEndDate'}">
                                        <p style="margin: 0;">
                                            <c:out value='${fieldVO.labelText}'/>: <fmt:formatDate pattern="MMM-dd" value="${fieldVO.fieldValue}" />
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                         <p style="margin: 0;">
									        <c:out value='${fieldVO.labelText}'/>:  <fmt:formatDate pattern="MM/dd/yyyy" value="${fieldVO.fieldValue}" />
								        </p>
                                    </c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<p style="margin: 0;"><c:out value='${fieldVO.labelText}'/>:  <c:out value='${fieldVO.displayValue}'/></p>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				<a href="emailManagerEdit.htm?emailId=${row.id}&personId=${person.id}""><spring:message code='edit'/></a>
				<hr />
			</c:forEach>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="searchResultsHeader">
			<h4 class="searchResults"><spring:message code='currentEmails'/></h4>
		</div>
		<p style="margin: 8px 0 6px 0;"><spring:message code='noCurrentEmailsEntered'/></p>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${!empty currentCorrespondenceEmails}">
		<div class="searchResultsHeader">
			<h4 class="searchResults"><spring:message code='currentCorrespondenceEmails'/></h4>
		</div>
		<mp:page pageName='email' />
		<c:forEach var="sectionDefinition" items="${sectionDefinitions}">
			<c:forEach items="${currentCorrespondenceEmails}" var="row">
				<mp:section sectionDefinition="${sectionDefinition}" />
				<c:set var="totalFields" value="${sectionFieldCount}" />
				<c:forEach var="sectionField" items="${sectionFieldList}" varStatus="status">
					<mp:field sectionField='${sectionField}' sectionFieldList='${sectionFieldList}' model="${row}" />
					<c:if test="${fieldVO.fieldValue!=null}">
						<c:choose>
							<c:when test="${fieldVO.fieldName=='creditCardExpiration'}">
								<p style="margin: 0;">
									<c:out value='${fieldVO.labelText}'/>: <fmt:formatDate pattern="MM/yyyy" value="${fieldVO.fieldValue}" />
								</p>
							</c:when>
							<c:when test="${fieldVO.fieldType == 'DATE'}">
								<p style="margin: 0;">
									<c:out value='${fieldVO.labelText}'/>:  <fmt:formatDate pattern="MM/dd/yyyy" value="${fieldVO.fieldValue}" />
								</p>
							</c:when>
							<c:otherwise>
								<p style="margin: 0;"><c:out value='${fieldVO.labelText}'/>:  <c:out value='${fieldVO.displayValue}'/></p>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				<a href="emailManagerEdit.htm?emailId=${row.id}&personId=${person.id}""><spring:message code='edit'/></a>
				<hr />
			</c:forEach>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="searchResultsHeader">
			<h4 class="searchResults"><spring:message code='currentCorrespondenceEmails'/></h4>
		</div>
		<p style="margin: 8px 0 6px 0;"><spring:message code='noCurrentCorrespondenceEmailsEntered'/></p>
	</c:otherwise>
</c:choose>
