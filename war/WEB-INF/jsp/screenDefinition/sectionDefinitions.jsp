<%@ include file="/WEB-INF/jsp/include.jsp"%>
<page:applyDecorator name="form">
    <spring:message code='manageScreenDefinitions' var="titleText" />
    <html>
        <head>
            <title><c:out value="${titleText}"/></title>
        </head>
        <body>
            <div class="simplebox">
           
           <form>
           
           	<input type="hidden" id="pageType" name="pageType" value="${pageType}" />
           	
            <c:if test="${fn:length(sectionNames) == 0}" >
            
            There are no editable sections for this page type.<br/>
            
            </c:if>
            
            <c:if test="${fn:length(sectionNames) > 0}" >
           
                <h4>Section Definition to Manage</h4><br/>
                <select  id="id" name="id"  onchange="hideShowEditButton();">
                   <c:forEach var="sectionName" items="${sectionNames}">
                     <option value="<c:out value='${sectionName.value}'/>" > <c:out value='${sectionName.key}'/></option>
                   </c:forEach>
                </select>
                
                <br/>
                <br/>
                
                <input type="button" value="Create Copy" class="button" onclick="copySection();  " />
                <input id="editRoleButton" type="button" class="button" value="Edit Role"  onclick="window.location = 'sectionDefinitionRoles.htm?pageType=${pageType}&id='+$('#id').val() ;  " />
                <input type="button" value="Edit Fields" class="button"  onclick="window.location = 'sectionDefinition.htm?pageType=${pageType}&id='+$('#id').val() ;  " />

            </c:if>
                
             </form>
             
             <script>
             <%-- Can only edit blank roles --%>
             function hideShowEditButton() {
                 var selectedOptionText = $('#id option:selected').text();
            	 if ( selectedOptionText.charAt( selectedOptionText.length-1 )  == ' ' ) {
                	 $('#editRoleButton').show(); 
            	 } else {
            		 $('#editRoleButton').hide();
            	 }
             }
             hideShowEditButton();
                 
             </script>

            <br/>
			<a href="pageTypes.htm">&laquo;Back</a>
            
            </div>
            
             <script>
             	function copySection() {
                 	var pageType = '${pageType}';
                 	var params = 'id='+$('#id').val();
                    $.ajax({
                 	   type: "POST",
                 	   url: "sectionDefinitionCopy.htm",
                 	   data: params,
                 	   success: function(msg){
                 	     window.location = "sectionDefinitions.htm?pageType="+pageType;
                 	   },
             	   	   error: function(){
                   	     window.location = "sectionDefinitions.htm?pageType="+pageType;
                   	   }
                 	 });
             	}
             </script>
            
           
        </body>
    </html>
</page:applyDecorator>
