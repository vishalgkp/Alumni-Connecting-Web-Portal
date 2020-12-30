
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@include file="Top.jsp" %>
		<div id="home">
		<% List list=(List)session.getAttribute("friendList");
		if(list!=null){ 
			for(int i=0;i<list.size();i++){
			    String s=(String)list.get(i);%>
	      
	     <%=s %>&nbsp<a href="ViewProfileController?name=<%=s%>">View Profile</a>  <br>
	  
	  <%} %>
	<%} else{%>
	<%="Not Found" %>
	<%} %>
		</div>
		
<%@include file="Bottom.jsp" %>