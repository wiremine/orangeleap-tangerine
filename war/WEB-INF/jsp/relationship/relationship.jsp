<%@ include file="/WEB-INF/jsp/include.jsp"%>
<tiles:insertDefinition name="base">
	<tiles:putAttribute name="browserTitle" value="Manage Relationships" />
	<tiles:putAttribute name="primaryNav" value="Relationships" />
	<tiles:putAttribute name="secondaryNav" value="Relationships" />
	<tiles:putAttribute name="mainContent" type="string">
		<div class="content760 mainForm">

		<div class="simplebox">
		    <h4>Maintain relationships for <c:out value='${form.person.fullName}'/>: <c:out value='${form.fieldLabel}'/></h4><br/>
		<div >

		<span style="color: red;" ><c:out value="${message}" /></span>
		
		<form method="post" action="relationship.htm">
		    <input type=hidden name="personId" value="${form.person.id}" />
	        <input type=hidden name="fieldDefinitionId" value="${form.fieldDefinition.id}" />
			<table class="customFields">
			  <tr >
				<th nowrap>Value</td>
				<th nowrap>Start Date</td>
				<th nowrap>End Date</td>
				<th nowrap>&nbsp;&nbsp;Customize</td>
			  </tr>
			 <c:forEach var="customField" varStatus="status" items="${form.customFieldList}" >
			  <tr rowindex="${status.count}">
				<td>
				<input id="cfFieldValue-${status.count}-" name="cfFieldValue[${status.count}]" size="32" value="<c:out value='${customField.value}'/>"  />
				</td>
				<td>
				<input id="cfStartDate-${status.count}-" name="cfStartDate[${status.count}]" value="<c:out value='${customField.displayStartDate}'/>" dateinput="true"  />
				</td>
				<td>
				<input id="cfEndDate-${status.count}-" name="cfEndDate[${status.count}]" value="<c:out value='${customField.displayEndDate}'/>" dateinput="true" />
				</td>
				<td>&nbsp;&nbsp;<a href="relationshipCustomize.html?id=${form.fieldDefinition.id}">+</a></td>
			  </tr>
			 </c:forEach>
			</table>
			<br/>
			<input type="button" value="Add" class="saveButton" onclick="GenericCustomizer.addNewRow(); decorateDateInputs();" />
			<input type="submit" value="Save" class="saveButton" />
		</form>
		</div>

		</div>

		</div>
		
		<script>
		
		function decorateDateInputs() {
			
		   $("input[dateinput]:not(.done)").each(

				function(i) {

					//alert('decorating '+this.id);

					$(this).parent().children("img").remove();
					
					new Ext.form.DateField({
 			          applyTo: this.id,
  			          id: name + "-wrapper",
  			          format: ('m/d/Y'),
  				    });

					$(this).addClass('done');
				}

		   );
		
		};

		decorateDateInputs();

		</script>
		
	</tiles:putAttribute>
</tiles:insertDefinition>