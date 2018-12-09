<%@ page language="java" contentType="text/html; charset=ISO-8859-4"
	pageEncoding="UTF-8"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="zxx">
<%
	boolean status = false;
	try {
		Class.forName("org.postgresql.Driver");
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/apprentissage";
		String user = "postgres";
		String passwd = "root";

		Connection con = DriverManager.getConnection(url, user, passwd);

		PreparedStatement ps = con.prepareStatement("SELECT (id_enfant) FROM son_of where  id_parent =?  ");
		int id_parent = Integer.parseInt((String) session.getAttribute("user_id"));
		ps.setInt(1,id_parent );
		ResultSet rs = ps.executeQuery();

		
%>
<head>
<title>Parent :: Suivre mes enfants</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Learn" />
<link rel="stylesheet" href="css/creditly.css" type="text/css"
	media="all" />
	<link rel="stylesheet" href="css/stats.css" type="text/css"
	media="all" />
	
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<!-- shop css -->
<link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
<link href="css/checkout.css" type="text/css" rel="stylesheet"
	media="all">
<!-- easy-responsive-tabs css -->
<link rel="stylesheet" href="css/easy-responsive-tabs.css"
	type="text/css" media="all" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style2.css" type="text/css" rel="stylesheet" media="all">
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //Custom Theme files -->
<!-- online-fonts -->
<!-- logo -->
<link href="//fonts.googleapis.com/css?family=Fredericka+the+Great"
	rel="stylesheet">
<!-- titles -->
<link
	href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i"
	rel="stylesheet">
<!-- body -->
<link
	href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<!-- //online-fonts -->
</head>


<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<div id="home">
		<!-- header -->
		<!-- navbar -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="main-nav">
				<div class="container">

					<div class="navbar-header page-scroll">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-ex1-collapse">
							<span class="sr-only">FunLearn</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<h1>
							<a class="navbar-brand" href="index.jsp">FunLearn</a>
						</h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-ex1-collapse nav-right">
						<ul class="nav navbar-nav navbar-left cl-effect-15">
							<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
							<li class="hidden"><a class="page-scroll" href="#page-top"></a>
							</li>
							<li>
                                <a href="index.jsp">Se déconnecter</a>
                            </li>
							
							 <li>
                                <a href="about.jsp">A PROPOS</a>
                            </li>
                            
                            <li>
                                <a href="contact.jsp">CONTACTEZ-NOUS</a>
                            </li>
                          
							<%
								String buf = (String) session.getAttribute("category");
										if (buf.compareTo("Parent") == 0) {
							%>
							
							<%
								} else {
							%>
							
							
							<%
								}
							
							%>
							
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<div class="clearfix"></div>
				</div>
				<!-- /.container -->
			</div>
		</nav>
		<!-- //navbar ends here -->
		
		
	</div>
	<!-- my part -->
	<div class="innerf-pages section">
			<div class="container">
				<!--/tabs-->
				<div class="responsive_tabs innfpage-tabs">
					<div id="horizontalTab">
						<ul class="resp-tabs-list">
							<li>Mes Enfant </li>
						</ul>
							<!-- //childs -->
							
						<div class="resp-tabs-container">
							<!--/tab_one-->
							<div class="tab1">
							<div class="pay_info">
							</div>
							<%
							while (rs.next()) {

								int id_Enfnats = ((Number) rs.getObject(1)).intValue();
								
								
								PreparedStatement ps2 = con
										.prepareStatement("select * FROM quizregister where id_user =? ");
								ps2.setInt(1, id_Enfnats);
								ResultSet rs2 = ps2.executeQuery();
								%>
								<div class="niv">
								<button class="niveau"
											style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; "
											onclick="C_On_boutton_niveau(this.parentNode)">
											<span>  <% 
											if(rs2.next()){
											  String s3 = rs2.getString(1); //( String )rs2.getObject("username")
												out.println(s3);
											  %>
											  </span>
										</button>
								<!--  Stats -->
								<%
								
								PreparedStatement ps3 = con.prepareStatement("select MAX(niveau) FROM texte ");
								

								ResultSet rs3 = ps3.executeQuery();
								
								int nb_niveau ;
								if (rs3.next()) {

								 nb_niveau = ((Number) rs3.getObject(1)).intValue();
								 
								}
								else {
									nb_niveau= 0;
								}
								PreparedStatement ps6 = con.prepareStatement("select niveau FROM etudiant where id_user= ? ");
								ps6.setInt(1,id_Enfnats );

								ResultSet rs6 = ps6.executeQuery();
							 
								int niv_enfant  =0;
								if (rs6.next()) {
								 niv_enfant = ((Number) rs6.getObject(1)).intValue() ;
								}
								else{
							
								}
								

								for (int i = 1; i < nb_niveau + 1; i++) {

									//int nb_niveau = ((Number) rs3.getObject(1)).intValue();

									
								//for (int i = 1; i < nb_niveau + 1; i++)
								//{
								float note_niv =0 ;
								if(i<= niv_enfant){
								PreparedStatement ps5 = con.prepareStatement("SELECT SUM(note) FROM texte INNER JOIN evaluation ON (texte.id_text = evaluation.id_texte) where niveau = ? and id_enfant = ? ");
								ps5.setInt(1,i );
								ps5.setInt(2,id_Enfnats );
								
								ResultSet rs5 = ps5.executeQuery();
								
								int note =0 ;
								if (rs5.next()) {
								 note = ((Number) rs5.getObject(1)).intValue() ; 
								}

								
								PreparedStatement ps7 = con.prepareStatement("SELECT COUNT(question_id) FROM texte INNER JOIN question ON (texte.id_text = question.text_id) where niveau = ?  ");
								ps7.setInt(1,i );
								
								int nb_question_niv = 0;
								ResultSet rs7 = ps7.executeQuery();
								
								if (rs7.next()) {
								 nb_question_niv = ((Number) rs7.getObject(1)).intValue() ; 
								}
									 note_niv = (float) ((note*100/nb_question_niv)) ;
								}
								


									
								
								 
								
								%>
								
<div class="container2" hidden>
<table>
 <tr>
  <th style="width: 20%;">
<button class="niveau"
											style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 14px;width : 100%;"
											onclick="C_On_boutton_niveau(this.parentNode.parentNode.parentNode.parentNode.parentNode)" >
											<span>  
											Niveau  <%  out.println( i );  %>
											  </span>
										</button>
	</th>
	<th style="width: 80%;">
	<div class="skills nivrating" style="width: 100%;">
	
	</div>

  <%  out.println(  "<div class=\"skills nivrating\" style=\"width: "+note_niv+"% ;  ");
  if(note_niv<25)
  {
  			out.println ("background-color: #f44336 ;");
  }
  else
  {
  	if(note_niv<50)
  	{
  		out.println ("background-color: #FF4500 ;");
  	}
  	else
  	{
	  	if(note_niv<75)
	  	{
			out.println ("background-color: #ADFF2F ;");
	  	}
	  	else
	  	{
	  		out.println ("background-color: #4CAF50 ;");
	  	}

  	}
  }
  out.println(" \" >  "+note_niv+"%  </div> " ); %>

</th>
 <tr>
</table>

	<table hidden >
	  <tr>
	    <th style="width:20%;"><%  out.println("Quiz ("+")" ); %> </th>
	    <th style="width:80%; ">Note</th>
	 
	  </tr>

	 <%
	

	

	 PreparedStatement ps4 = con.prepareStatement("select titre , note ,id_text  FROM texte INNER JOIN evaluation ON (texte.id_text = evaluation.id_texte) where niveau = ? and id_enfant = ?  ");
	
	 int niv = i ;
								ps4.setInt(1, niv);
								ps4.setInt(2, id_Enfnats);

								ResultSet rs4 = ps4.executeQuery();
	float text_note =0;

				while (rs4.next()) {
	%>
	 <tr>
		<td> <% out.println(rs4.getString(1)); %></td>
	    <td> <% 
	    int note_quiz = ((Number) rs4.getObject(2)).intValue();
	    int text_id = ((Number) rs4.getObject(3)).intValue();
	   
	     PreparedStatement ps8 = con.prepareStatement("select COUNT(question_id) FROM question where text_id = ?  ");
	 	ps8.setInt(1, text_id);
	 
	 	ResultSet rs8 = ps8.executeQuery();
	 
	 	int nb_question_text =0 ;
	 	if (rs8.next()) {
								 nb_question_text = ((Number) rs8.getObject(1)).intValue() ; 
								} 
	 	
	 	text_note = (float)((note_quiz*100)/nb_question_text);
	 	
	      out.println(  "<div class=\"skills nivrating\" style=\"width: "+text_note+"% ;  ");
  if(text_note<25)
  {
  			out.println ("background-color: #f44336 ;");
  }
  else
  {
  	if(text_note<50)
  	{
  		out.println ("background-color: 	#FF4500 ;");
  	}
  	else
  	{
	  	if(text_note<75)
	  	{
			out.println ("background-color: #ADFF2F ;");
	  	}
	  	else
	  	{
	  		out.println ("background-color: #4CAF50 ;");
	  	}

  	}
  }
  out.println(" \" >  "+text_note+"%  </div> " ); 


	     %> 
	    </td>
	 </tr>
	<%

				}
		/*---*/
	 %>
	  
	    
	    
	 
	
    </table>




</div>



								<!--  end Stats -->
											  <%
											//}
											 
											  }
											}
											else
											{
												//out.println("mafihach");
											}
											%>
								</div>
								<br></br>
								<% 
							}
							
							}catch (Exception e) {
								e.printStackTrace();
							}
	
							%>
							</div>
							<!--//tab_one-->
						</div>
							<!--//End childs-->
					</div>
				</div>
				<!--//tabs-->
			</div>

		</div>
	
	<!-- //home -->
	
	<!-- Common js -->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<!--// Common js -->

	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
		chr.render();

		chr.cart.on('new_checkout', function(evt) {
			var items, len, i;

			if (this.subtotal() > 0) {
				items = this.items();

				for (i = 0, len = items.length; i < len; i++) {
				}
			}
		});
	</script>
	<!-- //cart-js -->

	<!-- easy-responsive-tabs -->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
		});
	</script>

	<!-- //easy-responsive-tabs -->

	<!-- credit-card -->
	<script src="js/creditly.js"></script>


	<script>
		$(function() {
			var creditly = Creditly.initialize(
					'.creditly-wrapper .expiration-month-and-year',
					'.creditly-wrapper .credit-card-number',
					'.creditly-wrapper .security-code',
					'.creditly-wrapper .card-type');

			$(".creditly-card-form .submit").click(function(e) {
				e.preventDefault();
				var output = creditly.validate();
				if (output) {
					// Your validated credit card output
					console.log(output);
				}
			});
		});
	</script>
	<!-- //credit-card -->
	<!-- dropdown nav -->
	<script>
		$(document).ready(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).slideDown("fast");
				$(this).toggleClass('open');
			}, function() {
				$('.dropdown-menu', this).stop(true, true).slideUp("fast");
				$(this).toggleClass('open');
			});
		});
	</script>
	<!-- //dropdown nav -->
	<!--search jQuery-->
	<script src="js/main.js"></script>
	<!--search jQuery-->

	<!-- Scrolling Nav JavaScript -->
	<script src="js/scrolling-nav.js"></script>
	<!-- //fixed-scroll-nav-js -->
	<!--//scripts-->
	<!-- //gallery-js  -->
	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->
	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smooth-scrolling-of-move-up -->
	<!-- Bootstrap core JavaScript
	 ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.js"></script>
	<script src="js/my_scripts.js"></script>
</body>

</html>