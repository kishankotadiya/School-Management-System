<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%@page import="java.sql.*"%>
<%@ page import="org.sms.util.*" %>
       <%! util obj = new util(); %>
<%
String standard=request.getParameter("count");  
 String buffer="<select name='sections'  onchange='showCourse(this.value)' style='width: 150px;'>";  
 try{
   
 Connection con =   obj.connect();
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select section from classroom_mst where grade_Id='"+standard+"'  ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString("section")+"'>"+rs.getString("section")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
</body>
</html>