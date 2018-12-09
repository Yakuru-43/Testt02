<%@ page language="java" contentType="text/html; charset=ISO-8859-4"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>FunLearn</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="FunLearn" />

<script>
	var texte_id = Integer.parseInt(request.getParameter("text_id"));
	var request;
	function get1() {
		window.location = 'get1.jsp';
	}
	function get() {
		var v = document.getElementsByName('radio').value;
		window.location = "get.jsp?ans=" + v;
	}
	function sendInfo() {
		var v = document.myform.subject.value;
		var url = "findname2.jsp?val=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function getInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('location').innerHTML = val;
		}
	}
	function viewAll(name) {
		var v = name;
		var url = "findname3.jsp?val=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
			request.onreadystatechange = viewInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function viewInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('location').innerHTML = val;
		}
	}
</script>


<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<!-- shop css -->
<link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/radio.css" type="text/css" rel="stylesheet">
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
							<a class="navbar-brand" href="index.html">FunLearn</a>
						</h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-ex1-collapse nav-right">
						<ul class="nav navbar-nav navbar-left cl-effect-15">
							<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
							<li class="hidden"><a class="page-scroll" href="#page-top"></a>
							</li>
							<li><a href="index.jsp">ACCUEIL</a></li>
							<li><a href="about.jsp">A PROPOS</a></li>
							<li><a href="contact.jsp">CONTACTEZ-NOUS</a></li>
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
		<!-- breadcrumbs -->
		<!--//breadcrumbs ends here-->
		<!-- contact -->
		<div class="section contact" id="contact">
			<div class="container">
				<form method="post"
					action="get1.jsp?text_id=<%out.println(Integer.parseInt(request.getParameter("text_id")));%>">
					<div class="middle">
						<%
							String question = (String) session.getAttribute("question");
							String option1 = (String) session.getAttribute("option1");
							String option2 = (String) session.getAttribute("option2");
							String option3 = (String) session.getAttribute("option3");
							String option4 = (String) session.getAttribute("option4");
							if ((String) request.getParameter("radio") != null) {
								String ans = (String) request.getParameter("radio");
								session.setAttribute("ans", ans);
							}
						%>
						<div>
							<br /> <br /> <br />
							<h2 class="button">
								<%
									out.print(question);
								%>
							</h2>
							<br /> <br /> <br /> <label> <input type="radio"
								name="radio" value="<%=option1%>" />
								<div class="front-end box">
									<span><%=option1%></span>
								</div>
							</label> <label> <input type="radio" name="radio"
								value="<%=option2%>" />
								<div class="front-end box">
									<span><%=option2%></span>
								</div>
							</label> <label> <input type="radio" name="radio"
								value="<%=option3%>" />
								<div class="front-end box">
									<span><%=option3%></span>
								</div>
							</label> <label> <input type="radio" name="radio"
								value="<%=option4%>" />
								<div class="front-end box">
									<span><%=option4%></span>
								</div>
							</label> <br /> <br /> <br />
						</div>

						<input class="fsSubmitButton" type="submit" value="Suivant" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- //home -->
	<!-- js -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
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
	<!-- Scrolling Nav JavaScript -->
	<script src="js/scrolling-nav.js"></script>
	<!-- //fixed-scroll-nav-js -->
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
</body>

</html>