<%@ include file="/WEB-INF/jsp/include.jsp" %>
<mp:section sectionDefinition="${sectionDefinition}"/>
<c:forEach var="sectionField" items="${sectionFieldList}">
	<mp:field sectionField='${sectionField}' sectionFieldList='${sectionFieldList}' model='${row}' />
	<c:choose>
		<c:when test="${fieldVO.fieldType == 'HIDDEN'}">
			<td class="noDisplay">
				<input type="hidden" name="<c:out value='${gridCollectionName}'/>[<c:out value='${status.index}'/>].<c:out value='${fieldVO.fieldName}'/>" value="<c:out value='${fieldVO.fieldValue}'/>" id="<c:out value='${gridCollectionName}'/>-<c:out value='${status.index}'/>-<c:out value='${fieldVO.fieldId}'/>" />
			</td>
		</c:when>
		<c:otherwise>
			<td>
				<c:choose>
					<c:when test="${fieldVO.fieldType == 'DATE'}">
						<fmt:formatDate value="${fieldVO.fieldValue}" pattern="MM-dd-yy h:mm a" />
					</c:when>
					<c:when test="${fieldVO.fieldType == 'CODE' || fieldVO.fieldType == 'CODE_OTHER'}">
						<div class="lookupWrapper">
							<input value="<c:out value='${fieldVO.displayValue}'/>" class="text <c:out value='${fieldVO.fieldName}'/> code" lookup="<c:out value='${fieldVO.fieldName}'/>" 
								id="display-<c:out value='${gridCollectionName}'/>-<c:out value='${status.index}'/>-<c:out value='${fieldVO.fieldId}'/>"
								<c:if test="${fieldVO.fieldType == 'CODE_OTHER'}">
									otherFieldId="<c:out value='${gridCollectionName}'/>-<c:out value='${status.index}'/>-<c:out value='${fieldVO.otherFieldId}'/>"
								</c:if> 
								type="text"
								codeType="<c:out value='${fieldVO.fieldName}'/>" name="display-<c:out value='${gridCollectionName}'/>[<c:out value='${status.index}'/>].<c:out value='${fieldVO.fieldName}'/>" />
							<input value="<c:out value='${fieldVO.fieldValue}'/>" 
								id="hidden-<c:out value='${gridCollectionName}'/>-<c:out value='${status.index}'/>-<c:out value='${fieldVO.fieldId}'/>"
								type="hidden"
								name="<c:out value='${gridCollectionName}'/>[<c:out value='${status.index}'/>].<c:out value='${fieldVO.fieldName}'/>" />
							<a class="lookupLink" href="#"
								<c:choose>
									<c:when test="${fieldVO.fieldType == 'CODE_OTHER'}">
										onclick="Lookup.loadCodePopup(this, true)" 
									</c:when>
									<c:otherwise>
										onclick="Lookup.loadCodePopup(this)" 
									</c:otherwise>
								</c:choose> 
								alt="<spring:message code='lookup'/>" title="<spring:message code='lookup'/>"><spring:message code='lookup'/></a>
						</div>
					</c:when>
					<c:when test="${fieldVO.fieldType == 'PICKLIST'}">
						<select name="<c:out value='${fieldVO.fieldName}'/>" class="<c:if test="${fieldVO.cascading}">picklist </c:if><c:out value='${fieldVO.entityAttributes}'/>" 
							id="<c:out value='${fieldVO.fieldId}'/>">
							<option value="none"><spring:message code="none"/></option>
							<c:forEach var="code" varStatus="status" items="${fieldVO.augmentedCodes}">
								<option value="<c:out value='${code}'/>" 
									<c:if test="${fieldVO.fieldValue eq code}">selected="selected"</c:if>>
									<c:out value='${fieldVO.displayValues[status.index]}'/>
								</option>
							</c:forEach>
						</select>
					</c:when>
					<c:when test="${fieldVO.fieldType == 'CHECKBOX'}">
			            <input type="hidden" name="_<c:out value="${fieldVO.fieldName}"/>" value="visible" />
			            <input type="checkbox" value="true" 
			                   class="checkbox <c:out value='${fieldVO.entityAttributes}'/>" 
			                   name="<c:out value='${fieldVO.fieldName}'/>" 
			                   id="<c:out value='${fieldVO.fieldId}'/>"  
			                   <c:if test="${fieldVO.fieldValue}">checked="checked"</c:if>/>
					</c:when>
					<c:otherwise>
						<input value="<c:out value='${fieldVO.fieldValue}'/>" class="text <c:out value='${fieldVO.fieldName}'/> <c:if test="${fieldVO.fieldType == 'NUMBER'}"> number</c:if><c:if test="${fieldVO.fieldType == 'PERCENTAGE'}"> percentage</c:if>" 
							type="text" 
							name="<c:out value='${gridCollectionName}'/>[<c:out value='${status.index}'/>].<c:out value='${fieldVO.fieldName}'/>"
							id="<c:out value='${gridCollectionName}'/>-<c:out value='${status.index}'/>-<c:out value='${fieldVO.fieldId}'/>"/>
					</c:otherwise>
				</c:choose>
			</td>
		</c:otherwise>
	</c:choose>
</c:forEach>