<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Online Learning Palteforme</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Online Learning Palteforme" />
<script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
        
      
        var request;
        function sendInfo()
        {
        var v=document.myform.username.value;
        var url="findname.jsp?val="+v;
        if(window.XMLHttpRequest){
        request=new XMLHttpRequest();
        }
        else if(window.ActiveXObject){
        request=new ActiveXObject("Microsoft.XMLHTTP");
        }
        try
        {
        request.onreadystatechange=getInfo;
        request.open("GET",url,true);
        request.send();
        }
        catch(e){alert("Unable to connect to server");}
        }

        function getInfo(){
        if(request.readyState==4){
        var val=request.responseText;
        document.getElementById('location').innerHTML=val;
        }
        }
        
    </script>
   
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<!-- shop css -->
<link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
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
							<li><a href="index.jsp">ACCUEIL</a></li>
							<li><a href="about.jsp">A PROPOS</a></li>
							
							
							<li><a href="contact.jsp">CONTACTEZ NOUS</a></li>
						

						</ul>
						
					</div>
					<!-- /.navbar-collapse -->
					<div class="clearfix"></div>
				</div>
				<!-- /.container -->
			</div>
		</nav>
		<!-- //navbar ends here -->
		
		<!-- breadcrumbs --> 
		<div class="crumbs text-center">
			<div class="container">
				<div class="row">
					<ul class="btn-group btn-breadcrumb bc-list">
						<li class="btn btn1"><a href="index.jsp"> <i
								class="glyphicon glyphicon-home"></i>
						</a></li>
						<li class="btn btn2"><a href="login.jsp">S’authentifier ou créer un compte</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--//breadcrumbs ends here-->
		<!-- signin and signup form -->
		<div class="login-form section text-center">
			<div class="container">
				<h4 class="rad-txt">
					<span class="abtxt1">s'authentifier</span> <span class="abtext">créer un compte</span>
				</h4>
				<div id="loginbox" style="margin-top: 30px;"
					class="mainbox  loginbox">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">S'authentifier</div>
							
						</div>
						<div style="padding-top: 30px" class="panel-body">
							<div style="display: none" id="login-alert"
								class="alert alert-danger col-sm-12"></div>
							<form id="loginform" class="form-horizontal" method="post"
								action="loginprocess.jsp">
								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-user"></i>
									</span> <input id="login-username" type="text" class="form-control"
										name="username" value="" placeholder="nom d'utilisateur"
										required />
								</div>

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-lock"></i>
									</span> <input id="login-password" type="password"
										class="form-control" name="userpass" placeholder="mot de passe"
										required />
								</div>
								<div class="input-group">
									<div class="checkbox">
										<label> <input id="login-remember" type="checkbox"
											name="remember" value="1"> Se souvenir de moi
										</label>
									</div>
								</div>
								<div style="margin-top: 10px" class="form-group">
									<!-- Button -->
									<div class="col-sm-12 controls">

										<input type="submit" class="btn btn-success" value="S'authentifier" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12 control">
										<div
											style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
											Vous n'avez pas un compte! <a href="#"
												onClick="$('#loginbox').hide(); $('#signupbox').show()">
												Cliquez ici pour créer un compte </a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div id="signupbox" style="display: none; margin-top: 50px"
					class="mainbox loginbox">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Créer un compte</div>
							<div
								style="float: right; font-size: 85%; position: relative; top: -10px">
								<a id="signinlink" href="#"
									onclick="$('#signupbox').hide(); $('#loginbox').show()">S'authentifier</a>
									<script type="text/javascript">alert("Nom d'utilisateur ou mot de passe incorrectes !!");</script>
							</div>
						</div>
						<div class="panel-body">
							<form id="signupform" class="form-horizontal" method="post"
								action="registerprocess.jsp" name="myform">
								<div id="signupalert" style="display: none"
									class="alert alert-danger">
									<p>Error:</p>
									<span></span>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-sm-3 col-xs-3 control-label">Pseudo</label>
									<div class="col-md-9 col-sm-9 col-xs-9">
										<input type="text" class="form-control" name="username"
											placeholder="Nom d'utilisateur" required />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 col-sm-3 col-xs-3 control-label">Mot de passe</label>
									<div class="col-md-9 col-sm-9 col-xs-9">
										<input type="password" class="form-control" name="userpass"
											placeholder="Password" required />
									</div>
								</div>
								<div class="form-group">
								
								
									<label class="col-md-3 col-sm-3 col-xs-3 control-label">Catégorie</label>
								

                                   	<div id="mainselection" class="col-md-9 col-sm-9 col-xs-9">
									<select name="category" >
										<option>Selectionner une catégorie</option>
										<option>Expert metier</option>
										<option>Apprenant</option>
									</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-sm-3 col-xs-3 control-label">Email</label>
									<div class="col-md-9 col-sm-9 col-xs-9">
										<input type="text" class="form-control" name="email"
											placeholder="Adresse Email" required />
									</div>
								</div>
								<input class="btn btn-info" type="submit" value="Register">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- //home -->
	<!-- js -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!--search jQuery-->
	<script src="js/main.js"></script>
	<!--search jQuery-->
	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
        chr.render();

        chr.cart.on('new_checkout', function (evt) {
            var items, len, i;

            if (this.subtotal() > 0) {
                items = this.items();

                for (i = 0, len = items.length; i < len; i++) {}
            }
        });
    </script>
	<!-- //cart-js -->

	<!-- dropdown nav -->
	<script>
        $(document).ready(function () {
            $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
	<!-- //dropdown nav -->

	<!-- Scrolling Nav JavaScript -->
	<script src="js/scrolling-nav.js"></script>
	<!-- //fixed-scroll-nav-js -->
	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1000);
            });
        });
    </script>
	<!-- //end-smooth-scrolling -->
	<!-- smooth-scrolling-of-move-up -->
	<script>
        $(document).ready(function () {
            /*
            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear' 
            };
            */

            $().UItoTop({
                easingType: 'easeOutQuart'
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