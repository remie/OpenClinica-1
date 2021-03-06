<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <c:choose>	   
		<c:when test="${panel.orderedData}">
		 <c:set var="count" value="0"/>
		 <c:set var="newEvent" value="0"/>
		  <c:set var="eventCount" value="0"/>		 
		  <c:forEach var='line' items="${panel.userOrderedData}">
			<c:if test="${line.colon}">
			 <c:choose>
			 <c:when test="${line.title=='Study Event'}">
             	<c:set var="first" value="1"/>  
			  
			  <c:if test="${count >0 && eventCount>0}">
			      </table>
	             </td>
               </tr>
			  </c:if>
			  <c:if test="${eventCount==0}">
			   <table class="infoside_table" border="0" cellpadding="0" cellspacing="0" width="140">
			  </c:if>
			  <c:set var="count" value="${count+1}"/>
			  <c:set var="newEvent" value="1"/>
			  <c:set var="eventCount" value="${eventCount+1}"/>
			  <tr>
	           <td valign="top" width="10" class="leftmenu"><a style="text-decoration: none" href="javascript:leftnavExpand('leftnavSubRow_SubSection<c:out value="${eventCount}"/>'); 
		          javascript:setImage('ExpandGroup<c:out value="${eventCount}"/>','images/bt_Collapse.gif');"><img 
		          name="ExpandGroup<c:out value="${eventCount}"/>" src="images/bt_Expand.gif" border="0"></a></td>
	            
	            <c:choose>
                 <c:when test="${!line.current}">
	              <td valign="top" class="leftmenu"><a style="text-decoration: none"
	              href="javascript:leftnavExpand('leftnavSubRow_SubSection<c:out value="${eventCount}"/>'); 
		            javascript:setImage('ExpandGroup<c:out value="${eventCount}"/>','images/bt_Collapse.gif');"><c:out value="${line.info}" escapeXml="false"/></a>
		          </td>
		         </c:when>
		         <c:otherwise>
		           <td valign="top" class="leftmenu"><span class='alert'><c:out value="${line.info}" escapeXml="false"/></span>
		          </td>
		         </c:otherwise>
		        </c:choose> 
		          
             </tr>
              <c:if test="${newEvent==1}">
                  <c:choose>
                   <c:when test="${!line.current}">
                      <tr id="leftnavSubRow_SubSection<c:out value="${eventCount}"/>" style="display: none" valign="top">	                
	               </c:when>
	               <c:otherwise> 
	                  <tr id="leftnavSubRow_SubSection<c:out value="${eventCount}"/>" style="display:" valign="top">
	               </c:otherwise>
	              </c:choose> 
	                <td colspan="3">
	                <table border="0" cellpadding="0" cellspacing="0" width="110">
               </c:if>  
             </c:when>
             <c:otherwise>
               <b><c:out value="${line.title}" escapeXml="false"/>: <c:out value="${line.info}" escapeXml="false"/></b>
               <c:if test="${line.title!='Study Events'}">
               </c:if>
                
             </c:otherwise>  
             </c:choose>           
             </c:if>
             <c:if test="${!line.colon}">
                <c:set var="newEvent" value="0"/>
                <c:set var="count" value="${count+1}"/>
                <tr>
                 <c:choose>
                   <c:when test="${line.lastCRF}">                  
		             <td valign="top" class="vline_B">
		           </c:when>
		           <c:otherwise>
		             <td valign="top" class="vline">
		          </c:otherwise> 
		         </c:choose>
		         <img src="images/leftbar_hline.gif"></td>
		         <c:choose>
               	 <c:when test="${studySubject.status.name != 'removed' && studySubject.status.name != 'auto-removed'}">
		         	<td valign="top" class="leftmenu"><c:out value="${line.title}" escapeXml="false"/>&nbsp;<c:out value="${line.info}" escapeXml="false"/></td>
	           	 </c:when>  
	           	 <c:otherwise>
               		<c:choose>
               		<c:when test="${first == 0}">  
		         		<td valign="top" class="leftmenu"><c:out value="<img src='images/icon_Invalid.gif' alt='Invalid'>" escapeXml="false"/>&nbsp;<c:out value="${line.info}" escapeXml="false"/></td>
	           	 	</c:when>
	           	 	<c:otherwise>
              			<c:set var="first" value="0"/>
	           	 		<td valign="top" class="leftmenu"><c:out value="${line.title}" escapeXml="false"/>&nbsp;<c:out value="${line.info}" escapeXml="false"/></td>
	           	 	</c:otherwise>
	           	 	</c:choose>  
	           	 </c:otherwise>
	           	 </c:choose>
	           </tr>
             </c:if>
			  
		  </c:forEach>
		   <c:if test="${count>0}">
		     </table>
	         </td>
            </tr>
		  </table>  
		  </c:if>
		</c:when>
		<c:otherwise>
			<c:forEach var='line' items="${panel.data}">
				<b><c:out value="${line.key}" escapeXml="false"/>:</b>&nbsp;
				<c:out value="${line.value}" escapeXml="false"/>
			   <br/><br/>
		    </c:forEach>
		</c:otherwise>
	  </c:choose>
