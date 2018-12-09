<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%try{

String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");
String email=request.getParameter("email");
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://localhost:5432/apprentissage";
String user="postgres";
String passwd="root";

Connection con=DriverManager.getConnection(url,user,passwd);

PreparedStatement ps=con.prepareStatement("insert into quizregister (username, userpass, category, email)values(?,?,?,?)");
System.out.println("\n registerprocess.jsp Ligne 17 : "+category+"M.");
ps.setString(1,username);
ps.setString(2,userpass);
String categorie ;
if(category.equals("Apprenant"))
{
categorie ="Student";
}
else
{
	if(category.equals("Expert metier"))
	{
		categorie ="Teacher";
	}
	else
	{
		categorie ="Parent";
	}

}
ps.setString(3,categorie);
ps.setString(4,email);
int s=ps.executeUpdate();


if (category.equals("Apprenant"))
{
	
	PreparedStatement ps0=con.prepareStatement("select max(id_user) as id_user from quizregister");

	ResultSet rs2 = ps0.executeQuery();
	
	int code=0;
	if (rs2.next())
	{
		code = rs2.getInt("id_user");
	}

	PreparedStatement ps1=con.prepareStatement("insert into etudiant (id_user,niveau) values (  "+code+ " , 1)");
	ps1.executeUpdate();
}

con.close();

}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="index.jsp"></jsp:forward>
