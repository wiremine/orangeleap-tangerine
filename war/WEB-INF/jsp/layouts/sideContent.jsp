<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:useAttribute name="sidebarNav" ignore="true" />
<div class="sideBar">
	<div class="wrapper">
		<div class="innerContent" style="height:600px;">
			<c:if test="${viewingConstituent}">
				<h3>
					<c:out value='${constituent.displayValue}'/>:
				</h3>
				
				<%-- TODO: Refactor the way sidebarNav works!!!! --%>
				
				<div class="accountOptions">
					<div class="navGroup">
						<a class="groupHeader"><spring:message code="profile"/></a>
						<span class="secondary ${sidebarNav == 'Profile' ? 'active' : ''}">
							<a class="${sidebarNav == 'Profile' ? 'active' : ''}" href="constituent.htm?constituentId=${constituent.id}"><spring:message code="summary"/></a>
							<a class="${sidebarNav == 'Address Manager' ? 'active' : ''}" href="addressManager.htm?constituentId=${constituent.id}"><spring:message code="addresses"/></a>
							<a class="${sidebarNav == 'Email Manager' ? 'active' : ''}" href="emailManager.htm?constituentId=${constituent.id}"><spring:message code="emails"/></a>
							<a class="${sidebarNav == 'Phone Manager' ? 'active' : ''}" href="phoneManager.htm?constituentId=${constituent.id}"><spring:message code="phoneNumbers"/></a>
         				    <a class="${sidebarNav=='Relationships'?'active':''}" href="relationships.htm?constituentId=${constituent.id}"><spring:message code="relationships"/></a>
						</span>
					</div>
					<div class="navGroup">
						<a class="groupHeader"><spring:message code="giftManager"/></a>
			            <span class="secondary ${sidebarNav=='Gifts'?'active':''}">
				            <a class="${sidebarNav=='New Gift'?'active':''}" href="gift.htm?constituentId=${constituent.id}"><spring:message code="newGift"/></a>
							<c:if test="${pageAccess['/giftList.htm']!='DENIED'}">
			            		<a class="${sidebarNav=='Gifts'?'active':''}" href="giftList.htm?constituentId=${constituent.id}"><spring:message code="gifts"/></a>
							</c:if>
							<a class="${sidebarNav=='New Recurring Gift'?'active':''}" href="recurringGift.htm?constituentId=${constituent.id}"><spring:message code="newRecurringGift"/></a>
				            <c:if test="${pageAccess['/recurringGiftList.htm']!='DENIED'}">
								<a class="${sidebarNav=='Recurring Gifts'?'active':''}" href="recurringGiftList.htm?constituentId=${constituent.id}"><spring:message code="recurringGifts"/></a>
				            </c:if>
							<a class="${sidebarNav=='New Pledge'?'active':''}" href="pledge.htm?constituentId=${constituent.id}"><spring:message code="newPledge"/></a>
				            <c:if test="${pageAccess['/pledgeList.htm']!='DENIED'}">
								<a class="${sidebarNav=='Pledges'?'active':''}" href="pledgeList.htm?constituentId=${constituent.id}"><spring:message code="pledges"/></a>
				            </c:if>
				            <%--
							<a class="${sidebarNav=='New Membership'?'active':''}" href="membership.htm?constituentId=${constituent.id}&type=membership"><spring:message code="newMembership"/></a>
				            <c:if test="${pageAccess['/membershipList.htm']!='DENIED'}">
								<a class="${sidebarNav=='Memberships'?'active':''}" href="membershipList.htm?constituentId=${constituent.id}&type=membership"><spring:message code="memberships"/></a>
				            </c:if>
				            --%>
							<a class="${sidebarNav=='New Gift-In-Kind'?'active':''}" href="giftInKind.htm?constituentId=${constituent.id}"><spring:message code="newGiftInKind"/></a>
				            <c:if test="${pageAccess['/giftInKindList.htm']!='DENIED'}">
								<a class="${sidebarNav=='Gifts-In-Kind'?'active':''}" href="giftInKindList.htm?constituentId=${constituent.id}"><spring:message code="giftsInKind"/></a>
				            </c:if>
			            </span>
		            </div>
					<div class="navGroup">
						<a class="groupHeader"><spring:message code="paymentManager"/></a>
						<span class="secondary ${sidebarNav == 'Payment Manager' ? 'active' : ''}">
							<a class="${sidebarNav == 'Payment Methods' ? 'active' : ''}" href="paymentManager.htm?constituentId=${constituent.id}"><spring:message code="paymentMethods"/></a>
							<a class="${sidebarNav == 'Payment History' ? 'active' : ''}" href="paymentHistory.htm?constituentId=${constituent.id}"><spring:message code="paymentHistory"/></a>
						</span>
					</div>					
					<div class="navGroup">
						<a class="groupHeader"><spring:message code="touchPoints"/></a>
						<span class="secondary ${sidebarNav == 'Journal' ? 'active' : ''}">
				            <a class="${sidebarNav=='communicationHistory'?'active':''}" href="communicationHistory.htm?constituentId=${constituent.id}"><spring:message code="enterNewCommunicationHistory"/></a>
			            	<a class="${sidebarNav=='communicationHistoryList'?'active':''}" href="communicationHistoryList.htm?constituentId=${constituent.id}"><spring:message code="communicationHistoryEntries"/></a>
						</span>
					</div>					
					<c:if test="${pageAccess['/audit.htm']=='ALLOWED'}">
						<a class="${sidebarNav=='Audit'?'active':''}" href="audit.htm?object=constituent&id=${constituent.id}"><spring:message code='audit'/></a>
				    </c:if>
				</div>
			</c:if>
            <h3><spring:message code="myAccounts"/></h3>
            <div class="myTasks">
                <a href="#" id="sbAllAccountsLink"><spring:message code="allAccounts"/>&nbsp;<span class="taskCount" id="sbAllAccounts"></span></a>
            </div>
		</div>
	</div>
</div>