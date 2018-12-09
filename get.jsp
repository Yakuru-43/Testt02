<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%--<%@page import="com.sun.org.apache.bcel.internal.generic.Select"--%>
<%!static int count = 0;%>
<%!static int count1 = 0;%>
<%!static int pass  = 0;%> <%--  cette variable sert à indique le numéro de la question en cours --%>
<%!static int id_test = 0;%>  <%-- cette variable correspond à l'identifiant de la question--%>
<%
	int name =  Integer.parseInt(request.getParameter("text_id"));

	try {

		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/apprentissage";
		String user = "postgres";
		String passwd = "root";

		Connection con = DriverManager.getConnection(url, user, passwd);
		if (count == 0) {
			PreparedStatement ps1 = con.prepareStatement("select min(question_id) from question where text_id='" + name + "'");
			PreparedStatement ps2 = con.prepareStatement("select max(question_id) from question where text_id='" + name + "'");
			ResultSet rs1 = ps1.executeQuery();
			ResultSet rs2 = ps2.executeQuery();
			if (rs2.next()) {
				count1 = rs2.getInt(1);
				
				session.setAttribute("max", count1);
			}
			if (rs1.next()) {
				count = rs1.getInt(1);
				session.setAttribute("min", count);

			}
		}
		System.out.println(count);
		if (count > 0) {
			PreparedStatement ps = con.prepareStatement("select question_id,enonce,reponse,choix1,choix2,choix3,text_id from question where text_id='" + name +"' and question_id='" + count + "' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				id_test = rs.getInt(1);
				String question = rs.getString(2);
				String option1 = rs.getString(3);
				String option2 = rs.getString(4);
				String option3 = rs.getString(5);
				String option4 = rs.getString(6);
				session.setAttribute("question", question);
				session.setAttribute("option1", option1);
				session.setAttribute("option2", option2);
				session.setAttribute("option3", option3);
				session.setAttribute("option4", option4);
			}
		}
		pass++;
		System.out.println("Le nb du passage dans get.jsp: "+ pass +"\n");
		session.setAttribute("pass", pass);
		session.setAttribute("id_test", id_test);
		count++;
		session.setAttribute("count", count);
		if (count > (Integer) session.getAttribute("max")) {
			count = 0;
			session.setAttribute("ans", null);
		}
		con.close();

	} catch (Exception e) {
		e.printStackTrace();
	}
	//end of if
%>
<jsp:forward page="start.jsp?text_id=<% System.out.println( name ); %>"></jsp:forward>