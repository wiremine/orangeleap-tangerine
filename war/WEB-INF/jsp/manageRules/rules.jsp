<%@ include file="/WEB-INF/jsp/include.jsp"%>
<page:applyDecorator name="form">
    <spring:message code='manageRules' var="titleText" />
    <html>
        <head>
            <title><c:out value="${titleText}"/></title>
        </head>
        <body>
            <div class="simplebox">
           
            <form>
           
           	<input type="hidden" id="ruleEventType" name="ruleEventType" value="${ruleEventType}" />
	        <h4>Rules Definition to Manage</h4><br/>
           	
            <c:if test="${fn:length(rules) == 0}" >
            
	            There are no rules defined for this event type.<br/><br/>
            
            </c:if>
            
            <c:if test="${fn:length(rules) != 0}" >

	            <select  id="id" name="id"  onchange="hideShowEditButton();">
	               <c:forEach var="rule" items="${rules}">
	                 <option value="<c:out value='${rule.id}'/>" > <c:out value='${rule.ruleDesc}'/></option>
	               </c:forEach>
	            </select>
	            
	            <br/><br/>
	
	            <input id="editDescButton" type="button" class="button" value="Edit Description / Active Status"  onclick="window.location = 'ruleDesc.htm?ruleEventType=${ruleEventType}&id='+$('#id').val() ;  " />
	            <input type="button" value="Edit Conditions and Consequences" class="button"  onclick="window.location = 'editRuleSegments.htm?ruleEventType=${ruleEventType}&id='+$('#id').val() ;  " />

            </c:if>
            
            <input type="button" value="Create New Rule" class="button" onclick="createRule();  " /><br/>
           
            </form>
             
            <br/>
			<a href="ruleEventTypes.htm">&laquo;Back</a>
            
            </div>
            
             <script>
             	function createRule() {
                 	var ruleEventType = '${ruleEventType}';
                 	var params = 'id='+$('#id').val();
                    $.ajax({
                 	   type: "POST",
                 	   url: "ruleCreate.htm",
                 	   data: params,
                 	   success: function(msg){
                 	     window.location = "rules.htm?ruleEventType="+ruleEventType;
                 	   },
             	   	   error: function(){
                   	     window.location = "rules.htm?ruleEventType="+ruleEventType;
                   	   }
                 	 });
             	}
             </script>
            
           
        </body>
    </html>
</page:applyDecorator>
