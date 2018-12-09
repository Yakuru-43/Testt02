<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String username = request.getParameter("username");
String userpass = request.getParameter("userpass");
String category = request.getParameter("category");
String email = request.getParameter("email");

boolean status = false;
try {
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/apprentissage",
	"postgres", "root");
	PreparedStatement ps = con.prepareStatement("select * from quizregister where username=? and userpass=? ");
	ps.setString(1, username);
	ps.setString(2, userpass);
	ResultSet rs = ps.executeQuery();
	status = rs.next();
	if (status) {
		
		username = rs.getString(1);
		session.setAttribute("id_enfant",rs.getString(5)); // user_id from Salah
		session.setAttribute("user_id", rs.getString(5));
		session.setAttribute("email",rs.getString(4));
		session.setAttribute("username", String.valueOf(username));
		session.setAttribute("islogin", "plz sign in first");
		session.setAttribute("category", rs.getString(3));
		
		if(rs.getString(3).compareTo("Teacher")==0) {			
			%> <jsp:forward page="ExpertHome.jsp"></jsp:forward> <%
		} 
		else { 

			if(rs.getString(3).compareTo("Parent")==0) {			
			%> <jsp:forward page="ParentHome.jsp"></jsp:forward> <%
			}

			%> <jsp:forward page="home.jsp"></jsp:forward> <%
		} 
	} else {
		System.out.print("hi login process Error");
		request.setAttribute("Error",
		"Sorry! Username or Password Error. plz Enter Correct Detail or Register");
		session.setAttribute("Loginmsg", "plz sign in first");
		%> <jsp:forward page="index.jsp"></jsp:forward> <%
	}
}

catch (Exception e) {
	e.printStackTrace();
}
%>
