<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
	System.out.println("inside AjouterQuizzProcess.jsp process !");
	boolean status = false;

	try {

		Class.forName("org.postgresql.Driver");
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/apprentissage";
		String user = "postgres";
		String passwd = "root";

		Connection con = DriverManager.getConnection(url, user, passwd);
		int  nb_questions = Integer.parseInt(request.getParameter("nb_questions"));
		String titre = request.getParameter("titre");
		String domaine = request.getParameter("domaine");
		String contenu = request.getParameter("texte");
		int niveau = Integer.parseInt(request.getParameter("niveau"));
		PreparedStatement ps = con.prepareStatement(
				"INSERT INTO texte ( domaine,contenu,id_text ,id_expert,titre,niveau) VALUES (?, ?,nextval('texte_sequence') ,?,?,?)");
		System.out.println("Ajouter quiz Process 31 !");
		ps.setString(1, domaine);
		ps.setString(2, contenu);
		ps.setInt(3, Integer.valueOf((String) session.getAttribute("user_id")));
		ps.setString(4, titre);
		ps.setInt(5, niveau);
		System.out.println("Ajouter quiz Process 37 !");
		/*ps.setInt(3, 14);
		ps.setInt(4,1);*/
		System.out.println("inside AjouterQuizzProcess.jsp process prepare request");
		int rs = ps.executeUpdate();
		System.out.println("inside AjouterQuizzProcess.jsp process après exec de request");
		if (rs == 1) {
		for(int i = 1; i <= nb_questions; i++) 
		{
		System.out.println("inside AjouterQuizzProcess.jsp process data recover line40");
		String question = request.getParameter("question"+i);
		String reponse = request.getParameter("reponse"+i);	
		String choix1 = request.getParameter("choix1"+i);
		String choix2 = request.getParameter("choix2"+i);
		String choix3 = request.getParameter("choix3"+i);
		System.out.println("inside AjouterQuizzProcess.jsp process data recover line46");
		ps = con.prepareStatement(
					"INSERT INTO question  (  question_id  ,text_id, enonce , reponse ,choix1 ,choix2 ,choix3 ) VALUES (nextval('question_sequance'),currval('texte_sequence') ,?,?,?,?,?)");
		System.out.println("inside AjouterQuizzProcess.jsp process data recover line49");
			ps.setString(1, question);
			ps.setString(2, reponse);
			ps.setString(3, choix1);
			ps.setString(4, choix2);
			ps.setString(5, choix3);
			System.out.println("inside AjouterQuizzProcess.jsp process data recover line45");
			rs = ps.executeUpdate();
		System.out.println("inside AjouterQuizzProcess.jsp process data recover line57");

		}
		
		/*System.out.println("inside AjouterQuizzProcess.jsp process data recover line28");
		
		
			System.out.println("inside AjouterQuizzProcess.jsp process inside question insert");
			ps = con.prepareStatement(
					"INSERT INTO question  (  question_id  ,text_id, enonce , reponse ,choix1 ,choix2 ,choix3 ) VALUES (nextval('question_sequance'),currval('texte_sequence') ,?,?,?,?,?)");
			ps.setString(1, question);
			ps.setString(2, reponse);
			ps.setString(3, choix1);
			ps.setString(4, choix2);
			ps.setString(5, choix3);
			System.out.println("3 !");
			rs = ps.executeUpdate();*/
%>
<jsp:forward page="quizzs.jsp"></jsp:forward>
<%
	} else {
			// redirect Ã  une page d erreur
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
%>