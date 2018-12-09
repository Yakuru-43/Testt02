
<%@ page language="java" contentType="text/html; charset=ISO-8859-4" pageEncoding="UTF-8"%>
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
		
		
		PreparedStatement ps = con.prepareStatement("select MAX(niveau) FROM texte ");

		ResultSet rs = ps.executeQuery();
	
		PreparedStatement  ps1 = con.prepareStatement("select niveau from etudiant where id_user  = " + session.getAttribute("user_id") + "");
		
		ResultSet rss = ps1.executeQuery();
		
		int niveau_actuel ;
		if (rss.next()){
			niveau_actuel = rss.getInt("niveau");
			session.setAttribute("niveau", niveau_actuel);

		}
		
		if (rs.next()) {

			int nb_niveau = ((Number) rs.getObject(1)).intValue();
			int niveau_a =	(Integer) session.getAttribute("niveau");
%>
<head>
<title>Etudient :: Choix de niveau</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Learn" />
<link rel="stylesheet" href="css/creditly.css" type="text/css"
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
							<li><a href="index.jsp">Se déconnecter</a></li>
							<li><a href="about.jsp">A PROPOS </a></li>
							<%
								String buf = (String) session.getAttribute("category");
										if (buf.compareTo("Teacher") == 0) {
							%>
							<li><a href="quiz.jsp?text_id=1">Quizs</a></li>
							<%
								} else {
							%>
							<li><a href="quiz.jsp?text_id=1"> Prendre un quiz</a></li>
							
							<%
								}
							%>
							<li><a href="contact.jsp">Contactez-nous</a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<div class="clearfix"></div>
				</div>
				<!-- /.container -->
			</div>
		</nav>
		<!-- //navbar ends here -->
		<!-- banner -->
		
		<!-- //banner -->
		<div class="innerf-pages section">
			<div class="container">
				<!--/tabs-->
				<div class="responsive_tabs innfpage-tabs">
					<div id="horizontalTab">
						<ul class="resp-tabs-list">
							<li>Tous les Quiz</li>
						</ul>
						<div class="resp-tabs-container">
							<!--/tab_one-->
							<div class="tab1">
								<div class="pay_info">
									<%
										for (int i = 1; i < nb_niveau + 1; i++) {
											PreparedStatement ps2 = con
													.prepareStatement("select id_text ,titre FROM texte where niveau =? ");
											ps2.setInt(1, i);
											ResultSet rs2 = ps2.executeQuery();
												
									%>
									<div class="niv">
										<button class="niveau"  <% if (i > niveau_a) {out.print("disabled");}	%>
										
											style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;"
											onclick="C_On_boutton_niveau(this.parentNode)">
											<span>niveau <%
												out.println(i);
											%></span>
										</button>
										<%
											while (rs2.next()) {
										%>
										<div class="product-sec1" hidden="true">
											<!-- hidden="true"-->

											<div class="product-chr-info chr">
												<div class="thumbnail"></div>
												<div class="caption">
													<%
														int res = rs2.getInt("id_text");
																		out.println("<a href=\"quiz.jsp?text_id=" + res + "\" >   <h4 style=\"text-align: left;\" >"
																				+ rs2.getString("titre") + "</h4> </a>");//
													%>
													<p>Evaluations</p>
													<div class="matrlf-mid">
														<ul class="rating">
															<li><a href="#"> <span
																	class="fa fa-star yellow-star" aria-hidden="true"></span>
															</a></li>
															<li><a href="#"> <span
																	class="fa fa-star yellow-star" aria-hidden="true"></span>
															</a></li>
															<li><a href="#"> <span
																	class="fa fa-star yellow-star" aria-hidden="true"></span>
															</a></li>
															<li><a href="#"> <span
																	class="fa fa-star gray-star" aria-hidden="true"></span>
															</a></li>
															<li><a href="#"> <span
																	class="fa fa-star gray-star" aria-hidden="true"></span>
															</a></li>
														</ul>
														<ul class="price-list">
															<li> <% 
															Class.forName("org.postgresql.Driver");
															String url1 = "jdbc:postgresql://localhost:5432/apprentissage";
															String user1 = "postgres";
															String passwd1 = "root";
															Connection con1 = DriverManager.getConnection(url1, user1, passwd1);
															PreparedStatement ps3 = con1.prepareStatement("select max(note) as note FROM evaluation where id_enfant = "+ session.getAttribute("user_id")+" and id_texte="+res +" ");
															ResultSet rs3 = ps3.executeQuery();
														
															if (rs3.next()) {
																int eval = rs3.getInt("note");
																out.println(+eval );
															}
															else {
																out.println(" 0 " );
															}
															con1.close();	
																												
															
															%> reponses</li>
															<li></li>
														</ul>

														<div class="clearfix"></div>
													</div>
												</div>
											</div>


										</div>

										<%
											}
										%>

									</div>
									<%
										}
											}
										} catch (Exception e) {
											e.printStackTrace();
										}
									%>

								</div>
							</div>
							<!--//tab_one-->
						</div>
					</div>
				</div>
				<!--//tabs-->
			</div>

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