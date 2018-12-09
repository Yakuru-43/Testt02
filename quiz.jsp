<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>FunLearn</title>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"	media="all" />
<!-- shop css -->
<link href="css/shop.css" type="text/css" rel="stylesheet" media="all" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //Custom Theme files -->
<!-- online-fonts -->
<!-- logo -->
<link href="//fonts.googleapis.com/css?family=Fredericka+the+Great"
	rel="stylesheet"/>
<!-- titles -->
<link
	href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i"
	rel="stylesheet">
<!-- body -->
<link
	href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<!-- //online-fonts -->
<%
	int texte_id = Integer.parseInt(request.getParameter("text_id"));
    session.setAttribute("texte_id", texte_id);

	boolean status = false;
	try {
		Class.forName("org.postgresql.Driver");
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/apprentissage";
		String user="postgres";
		String passwd="root";

		Connection con = DriverManager.getConnection(url,user,passwd);
		
		PreparedStatement ps = con.prepareStatement("select * from texte where id_text=?  ");
		ps.setInt(1, texte_id);

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			System.out.println("lecture avec succee !");
%>
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
	media="all" />
<!-- shop css -->
<link href="css/shop.css" type="text/css" rel="stylesheet" media="all"/>
<!-- footer stylesheet -->
<link href="css/footer1.css" type="text/css" rel="stylesheet"
	media="all"/>
<link href="css/style.css" type="text/css" rel="stylesheet" media="all"/>
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"/>
<!-- //Custom Theme files -->
<!-- online-fonts -->
<!-- logo -->
<link href="//fonts.googleapis.com/css?family=Fredericka+the+Great"
	rel="stylesheet" />
<!-- titles -->
<link
	href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i"
	rel="stylesheet"/>
<!-- body -->
<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet"/>


<script>
	var request;
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

</head>
<body>
<nav id="section1" class="navbar navbar-default navbar-fixed-top">
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
					<li><a href="about.jsp">A propos </a></li>
					<!--   <li class="dropdown">
                                <a href="#" class="dropdown-toggle effect-3" data-toggle="dropdown">shop
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="shop.html">product catalog</a>
                                    </li>
                                    <li>
                                        <a href="single_product.html">single product</a>
                                    </li>
                                    <li>
                                        <a href="checkout.html">checkout</a>
                                    </li>
									<li>
                                        <a href="payment.html">Payment</a>
                                    </li>
                                </ul>
                            </li> 
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle effect-3" data-toggle="dropdown">footers
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="footer.html">Default</a>
                                    </li>
                                    <li>
                                        <a href="footer1.html">variant1</a>
                                    </li>
                                    <li>
                                        <a href="footer2.html">variant2</a>
                                    </li>
                                    <li>
                                        <a href="footer3.html">variant3</a>
                                    </li>
                                    <li>
                                        <a href="footer4.html">variant4</a>
                                    </li>
                                </ul>
                            </li> -->
					<li><a href="contact.jsp">Contactez-nous</a></li>
					

				</ul>
				
				
			<div class="clearfix"></div>
		</div>
		<!-- /.container -->
	</div>
	</div>
</nav>

<!-- //banner-text -->
<div class="innerf-pages section">
	<div class="container">

		<div class="col-md-12 single-right-left simpleCart_shelfItem">
			<h3>
				<span></span>
			</h3>


			<div class="desc_single">
				<h5></h5>
				<%
				 	out.println("<h3>" + rs.getString("titre") + "</h3>");				
					out.println("<p>" + rs.getString("contenu") + "</p>");
						} else {
							System.out.print("lecture echouee !");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>

			</div>

			<div class="clearfix"></div>

			<div class="occasion-cart">
				<div class="chr single-item single_page_b">
					<form action="#" method="post">


  
                      
                
              <h2 class="button">      <a href="get.jsp?text_id=<% out.println( texte_id); %>" class="button">Passer au Quiz</a>   </h2> 
						
						<a href="#" data-toggle="modal" data-target="#myModal1"></a>
					</form>
					
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>



<script src="js/jquery-2.2.3.min.js"></script>
<!-- //js -->
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
<!-- about bottom grid Numscroller -->
<script src="js/numscroller-1.0.js"></script>
<!-- //about bottom grid Numscroller -->
<!-- Bootstrap core JavaScript
 ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/bootstrap.js"></script>
</body>

</html>