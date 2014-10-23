<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="teacher_master.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grade Report</title>
</head>
<body>

	<%@ page import="org.sms.util.util"%>
	<%@ page import="java.sql.*"%>
	<%!util utilobj = new util();
	Connection conn = utilobj.connect();%>
	<% String teacher_Id = (String) session.getAttribute("teacher_Id"); %>
	<div style="left: 13%; top: 100px; position: absolute;">
		<font color="#006699" face="Californian FB" size="+4">Grade Report </font>
	</div>
	<div
		style="width: 750px; top: 100px;  position: absolute; left: 13%;"
		class="shadow-div">
		<form action="controllers/GradeReport" method="post">
		<table ><tr><td>Select Classroom:</td><td>
		<select name="c_Id">
		<%
								Statement stmt = conn.createStatement();
								String query = "select cm.classroom_Id,cm.section,gm.name from grade_mst gm, classroom_mst cm where cm.teacher_Id='"+ teacher_Id +"' and cm.grade_Id=gm.grade_Id";
								ResultSet rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
									String sec = rs.getString("section");
									String c_Id = rs.getString("classroom_Id");
							%>
							<option value="<%=c_Id%>"><%=str%> <%=sec %></option>
							<%
								}
							%>
		</select>
		</td>
		<td>Select Exam:</td><td>
		<select name="exam_Id">
		<%
								 stmt = conn.createStatement();
								 query = "select exam_Id,name from exam_mst";
								 rs = stmt.executeQuery(query);
								while (rs.next()) {
									String str = rs.getString("name");
									
									String exam_Id = rs.getString("exam_Id");
							%>
							<option value="<%=exam_Id%>"><%=str%></option>
							<%
								}
							%>
		</select>		
		</td>
		<td>
		<input type="submit" style="visibility: hidden;" id="getstudents">
		<a
					href="javascript:void(0)"
					onclick="document.getElementById('getstudents').click()"
					class="button rounded cyan">Get Students
				</a>
		</td>
		</tr>
		
		</table>
	</div>
</body>
</html>