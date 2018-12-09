<%@ page language="java" contentType="text/html; charset=ISO-8859-4"
	pageEncoding="UTF-8"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="zxx">
<%
	System.out.println("Hi quizzs.sjp");
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

		if (rs.next()) {

			int nb_niveau = ((Number) rs.getObject(1)).intValue();
%>
<head>
<title>Quizzs</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Learn" />
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
							<span class="sr-only">Chronicle</span> <span class="icon-bar"></span>
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
							<li><a href="about.jsp">A propos </a></li>
							<%
								String buf = (String) session.getAttribute("category");
										if (buf.compareTo("Teacher") == 0) {
							%>
							<li><a href="quiz.jsp?text_id=1">Quizs</a></li>
							<%
								} else {
							%>

							<li><a href="quiz.jsp?text_id=1"> Prendre un quiz</a></li>
							<li><a href="AjouterQuiz.jsp">Ajouter un quiz</a></li>
							<%
								}
							%>


							<li><a href="contact.jsp">Contactez-nous</a></li>


						</ul>
						
						
						<!-- shopping cart -->

						<!-- //shopping cart ends here -->
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
		<!-- breadcrumbs -->
		

		<!--//breadcrumbs ends here-->
		<!--Payment-->

		<%
			//	int nb_niveau = 10 ;
					int nb_quizs = 3;
		%>
		<div class="innerf-pages section">
			<div class="container">


				<!--/tabs-->
				<div class="responsive_tabs innfpage-tabs">
					<div id="horizontalTab">
						<ul class="resp-tabs-list">
							<li>tous les quizzs</li>
							<li>creer un quiz</li>
							
							<li></li>
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
										<button class="niveau"
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
															<li>0 reponses</li>
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
							<div class="tab2">
								<div class="pay_info">
									<!-- the form -->
									<section class="creditly-wrapper payf_wrapper">

										<div class="contact-form">
											<div class="col-md-14">

												<div class="contact-top1">


													<form action="AjouterQuizProcess.jsp"
														class="form_w3layouts" method="post">
														<div class="FormSection"  style ="padding-top: 1%; padding-bottom: 2%;border-bottom: 5px solid  #34C663 ;">
															<h5>Proprities :</h5>
															<div class="form-group">
																<h4 class="col-md-2 col-sm-3 col-xs-3 control-label"
																style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Titre</h4>
															<!-- -->
																<div class="col-md-9 col-sm-9 col-xs-9">
																	<input type="text" class="form-control" name="titre"
																	placeholder="Titre" required>
																</div>
															</div>
														


															<div class="form-group">
																<h4 class="col-md-2 col-sm-3 col-xs-3 control-label"
																	style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Domaine</h4>
																<div class="col-md-9 col-sm-9 col-xs-9">
																	<input type="text" name="domaine" placeholder="Domaine"
																		required>
																</div>
															</div>

															<div class="form-group">
																<h4 class="col-md-2 col-sm-3 col-xs-3 control-label"
																	style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Niveau</h4>
																<div class="col-md-2 col-sm-9 col-xs-9">
																	<input type="number" class="form-control" name="niveau"
																		value="1" required>
																</div>
															</div>
														</div >
														<div class="FormSection" style =" padding-bottom: 2%;border-bottom: 5px solid  #34C663 ;">
															<h5>Texte</h5>
															<textarea name="texte" placeholder="Texte" required></textarea>
														</div >
													<div id="questionsListe">
														<div id="Q1" class="FormSection "  style =" padding-bottom: 2%;border-bottom: 5px solid  #34C663 ;">
															<h5>Question n 1  :</h5>
															<div class="champsListe">
																<div class="form-group"  >
																	<h4 class="col-md-2 col-sm-3 col-xs-3 control-label "
																		style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Question
																	</h4>
																	<div class="col-md-9 col-sm-9 col-xs-9">
																		<input type="text" class="form-control" name="question1"
																			placeholder="question" required>
																	</div>
																</div>
																<div class="form-group">
																	<h4 class="col-md-2 col-sm-3 col-xs-3 control-label"
																		style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Reponse
																	</h4>
																	<div class="col-md-9 col-sm-9 col-xs-9">
																		<input type="text" class="form-control" name="reponse1"
																			placeholder="reponse" required>
																	</div>
																</div>
																<div class="form-group">
																	<h4 class="col-md-2 col-sm-3 col-xs-3 control-label"
																		style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">choix
																		1</h4>
																	<div class="col-md-9 col-sm-9 col-xs-9">
																		<input type="text" class="form-control" name="choix11"
																			placeholder="choix 1" required>
																	</div>
																</div>
																<div class="form-group">
																	<h4 class="col-md-2 col-sm-3 col-xs-3 control-label"
																		style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">choix
																		2</h4>
																	<div class="col-md-9 col-sm-9 col-xs-9">
																		<input type="text" class="form-control" name="choix21"
																			placeholder="choix 2" required>
																	</div>
																</div>
																<div class="form-group">
																	<h4 class="col-md-2 col-sm-3 col-xs-3 control-label"
																		style="background-color: #34C663; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">choix
																		3</h4>
																	<div class="col-md-9 col-sm-9 col-xs-9">
																		<input type="text" class="form-control" name="choix31"
																			placeholder="choix 3" required>
																	</div>

																</div>
															</div>
														 </div>
													</div>
														 <button type="button" onclick="C_On_boutton_ajouter_question()" >Ajouter un question </button>
														 <input type="number" name="nb_questions" id ="nb_questions"
																			placeholder="1"  value="1" hidden>

														<input type="submit" value="Ajouter">
													</form>
												</div>
												<!--  //contact form grid ends here -->
											</div>
											<!-- contact map grid -->

											<!--//contact map grid ends here-->
											<div class="clearfix"></div>
										</div>
										<!-- the form -->
									</section>


								</div>
							</div>
							
						</div>
					</div>
				</div>
				<!--//tabs-->
			</div>

		</div>
	</div>
	<!-- //payment -->
	

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