<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%-- <%@page import="com.sun.org.apache.bcel.internal.generic.Select"%>--%>

<%!static int count1 = 0;%>

<%!static int total = 0;%>
<%!static String choix;%>
<%
	if (session.getAttribute("count") != null) {
		session.setAttribute("passage", 0);
		String name = (String) session.getAttribute("quizname");
		String ans = (String) session.getAttribute("ans");
		Integer count = (Integer) session.getAttribute("count");
		int pass = (Integer) session.getAttribute("pass");
		int id_test = (Integer) session.getAttribute("id_test");
		if ((String) request.getParameter("radio") != null) {
			choix = (String) request.getParameter("radio");
			System.out.println("Votre choix " + choix + "\n");
		}

		try {
			if (count1 == 0) {
				count1 = count - 1;
				System.out.println("Le nb du passage dans get1.jsp: " + pass + "\n");
				System.out.println("Le count dans get1.jsp: " + count + "\n");
				Class.forName("org.postgresql.Driver");
				String url = "jdbc:postgresql://localhost:5432/apprentissage";
				String user = "postgres";
				String passwd = "root";

				Connection con = DriverManager.getConnection(url, user, passwd);
				PreparedStatement ps = con
						.prepareStatement("select reponse from question where question_id='" + id_test + "'");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					String ans1 = rs.getString(1);
					System.out.println("1ER IF ans1 on c10=" + ans1);
					System.out.println("1ER IF ans on get1=" + choix);
					if (ans1.equals(choix)) {
						total = total + 1;
						System.out.println("total=" + total);
						System.out.println("Enfin c'est bon pour la 1er question !!!");
					}

				}

				con.close();
			}

			else {
				System.out.println("Le count dans le else de  get1.jsp: " + count + "\n");
				count1 = count - 2;
				System.out.print("count at get1:" + count);

				Class.forName("org.postgresql.Driver");
				String url = "jdbc:postgresql://localhost:5432/apprentissage";
				String user = "postgres";
				String passwd = "root";

				Connection con = DriverManager.getConnection(url, user, passwd);

				PreparedStatement ps = con
						.prepareStatement("select reponse from question where question_id='" + id_test + "'");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					String ans1 = rs.getString(1);
					System.out.println("2EME IF ans1=" + ans1);
					System.out.println("2EME IF ans on get1=" + choix);
					if (ans1.equals(choix)) {
						total = total + 1;
						System.out.println("total=" + total);
						System.out.println("Enfin c'est bon pour le deuxiéme if  !!!");

					}

				}
				con.close();
			}
			if (count > (Integer) session.getAttribute("max")) {
				request.setAttribute("total", total);

				Class.forName("org.postgresql.Driver");
				String url = "jdbc:postgresql://localhost:5432/apprentissage";
				String user = "postgres";
				String passwd = "root";
				Connection con = DriverManager.getConnection(url, user, passwd);
				 PreparedStatement ps1 = con.prepareStatement(
						"delete from evaluation where id_texte= '" + session.getAttribute("texte_id") + "' and id_enfant =" + session.getAttribute("user_id") + "");
				System.out.println("balise 01 ");
			
				System.out.println("balise 02 ");
				
				ps1.executeUpdate();
				PreparedStatement ps = con
						.prepareStatement("insert into evaluation (id_texte ,note , id_enfant  ) values (  '"
								+ session.getAttribute("texte_id") + "' ,'" + total + "', '"
								+ session.getAttribute("id_enfant") + "'  ) ");
			
				
				ps.executeUpdate();
			
				
				
				ps = con.prepareStatement("select niveau from texte where id_text ='" +session.getAttribute("texte_id") +" '");
				
				ResultSet rss = ps.executeQuery();
				int m=0; // niveau actuel du texte  qui a été lue avant de répondre au quiz asscié
				
				if (rss.next()){
					m = rss.getInt("niveau");
				} 

				ps = con.prepareStatement("select count(question_id) as nb from texte as txt join question as q on txt.id_text =q.text_id where niveau = '"+m+"'");
				
				ResultSet rss1 = ps.executeQuery();
				int v=0; // score max possible dans ce niveau
				if (rss1.next()){
					v = rss1.getInt("nb");
				} 
				total = 0;
				
				ps = con.prepareStatement("select sum(note) as note from evaluation AS e join texte AS txt on txt.id_text = e.id_texte where niveau = '"+m+"' and id_enfant ='" + session.getAttribute("id_enfant") + "' group by id_enfant") ;         
				
				ResultSet rss2 = ps.executeQuery();
				int note =0;// note cumulé de l'enfant dans ce niveau 
				if (rss2.next()){
					note = rss2.getInt("note");
				} 
				ps = con.prepareStatement("select niveau from etudiant where id_user ='"+session.getAttribute("id_enfant") +"'");
				
				rss2 = ps.executeQuery();
				int act=0; // le niveau actuel de l'enfant
				if (rss2.next()){
					act = rss2.getInt("niveau");
				} 
				
				System.out.println("Voici le score max"+ v+"  Pour le niveau "+m+" note de l'enfant cumulé dans ce niveau : "+note+" dont le niviea actuel est" +act);

				if (act == m)
				{
					System.out.println("1er if ");
					if (note >= v/2 )
					{
						act =act+1;
						System.out.println("2eme if ");
						ps = con.prepareStatement("update etudiant set niveau = niveau+1 where id_user= '"+session.getAttribute("id_enfant") +"' ");
						ps.executeUpdate();
						session.setAttribute("passage", 1);
					}
				}
					
				
				con.close();
%>

<jsp:forward page="result.jsp"></jsp:forward>
<%
	}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
%>
<jsp:forward page="get.jsp"></jsp:forward>