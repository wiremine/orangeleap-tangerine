<%@ include file="/WEB-INF/jsp/include.jsp" %>

<tiles:insertDefinition name="base">
    <tiles:putAttribute name="customHeaderContent" type="string">
        <script type="text/javascript" src="js/personlist.js"></script>
    </tiles:putAttribute>

	<tiles:putAttribute name="browserTitle" value="All Constituents" />
	<tiles:putAttribute name="primaryNav" value="People" />
	<tiles:putAttribute name="secondaryNav" value="List" />
	<tiles:putAttribute name="mainContent" type="string">
		<div class="content760 mainForm">
			<mp:page pageName='personSearch'/>

			<div id="personListGrid"></div>

		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
