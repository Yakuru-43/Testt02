<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<%

 try {
 
String name= request.getParameter("name");
String email= request.getParameter("email");
String phone= request.getParameter("phone");
String message= request.getParameter("message");
 
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://localhost:5432/apprentissage";
String user="postgres";
String passwd="root";

Connection con=DriverManager.getConnection(url,user,passwd);

PreparedStatement ps=con.prepareStatement("insert into quizcontact values(?,?,?,?)");
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,message);

int s= ps.executeUpdate();


}
catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="home.jsp"></jsp:forward>
