<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>FunLearn</title>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all" />
    <!-- shop css -->
    <link href="css/shop.css" type="text/css" rel="stylesheet" media="all" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all" />
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- //Custom Theme files -->
    <!-- online-fonts -->
    <!-- logo -->
    <link href="//fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet" />
    <!-- titles -->
    <link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i" rel="stylesheet" />
    <!-- body -->
    <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet" />
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
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">FunLearn</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <h1>
                            <a class="navbar-brand" href="index.jsp">FunLearn</a>
                        </h1>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-ex1-collapse nav-right">
                        <ul class="nav navbar-nav navbar-left cl-effect-15">
                            <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                            <li class="hidden">
                                <a class="page-scroll" href="#page-top"></a>
                            </li>
                            <li>
                                <a href="index.jsp">Accueil</a>
                            </li>
                            <li>
                                <a href="about.jsp">A propos </a>
                            </li>
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
                           
                            <li>
                                <a href="login.jsp" title="Connectez-vous & inscrivez-vous">
                                    <span class="fa fa-user nav-icon" aria-hidden="true"></span>
                                </a>
                            </li>

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
        <div class="banner-bg-inner" style="background: url(images/banner.jpg) no-repeat center;">
            <!-- banner-text -->
            <div class="banner-text-inner">
                <div class="container">
                    <h2 class="title-inner">
                       Lecture
                    </h2>

                </div>
            </div>
            <!-- //banner-text -->
        </div>
        <!-- //banner -->
        <!-- breadcrumbs -->
        <div class="crumbs text-center">
            <div class="container">
                <div class="row">
                    <ul class="btn-group btn-breadcrumb bc-list">
                        <li class="btn btn1">
                            <a href="index.jsp">
                                <i class="glyphicon glyphicon-home"></i>
                            </a>
                        </li>
                        <li class="btn btn2">
                            <a href="contact.jsp">Contactez-nous</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--//breadcrumbs ends here-->
        <!-- contact -->
        <div class="section contact" id="contact">
            <div class="container">
                <h4 class="rad-txt text-center">
                    <span class="abtxt1">Contactez</span>
                    <span class="abtext">nous</span>
                </h4>
                <div class="contact-form">
                    <div class="col-md-7">
                        <!-- contact form grid -->
                        <div class="contact-top1">
                            <h5>Envoyez-nous des feedbacks</h5>
                            <form action="#" class="form_w3layouts" method="post">
                                <input type="text" placeholder="Nom" required />
                                <input type="text" placeholder="Prenom" required />

                                <input class="email" type="email" placeholder="Email" required/>
                                <textarea placeholder="Message" required></textarea>
                                <input type="submit" value="Envoyer"/>
                            </form>
                        </div>
                        <!--  //contact form grid ends here -->
                    </div>
                    <!-- contact map grid -->
                    <div class="col-md-5 map contact-right">
                        <div class="contact-top1">
                            <h5>Obtenir des directions</h5>
                          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3198.729818871558!2d3.171726915065008!3d36.70502987996831!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x128e522f3f317461%3A0x215c157a5406653c!2sEcole+Nationale+Sup%C3%A9rieure+d&#39;Informatique!5e0!3m2!1sfr!2sdz!4v1523987616885" width="600" height="450"  style="border:0" ></iframe>
                        </div>
                    </div>
                    <!--//contact map grid ends here-->
                    <div class="clearfix"></div>
                </div>
                <!-- contact details -->
                <div class="contact-bottom">
                    <h6>Informations de contact</h6>
                    <!-- contact details left -->
                    <div class="col-md-6 col-sm-6">
                        <div class="contact-left">
                            <div class="address">
                                <h5>Address:</h5>
                                <p>
                                    Oued Semar 
                                    <br/> El harrach , Alger.</p>
                            </div>
                            <div class="address address-mdl">
                                <h5>Numero de telephone:</h5>
                                <p>
                                    +213 541472623</p>
                                <p>
                                    +213 552399785</p>
                            </div>
                        </div>
                    </div>
                    <!-- //contact details left -->
                    <!-- contact details right -->
                    <div class="col-md-6 col-sm-6">
                        <div class="contact-right">
                            <div class="address">
                                <h5>Email:</h5>
                                <p>
                                    <a href="mailto:es_akakba@esi.dz">es_akakba@esi.dz</a>
                                </p>
                                <p>
                                    <a href="mailto:ew_ghazal@esi.dz">ew_ghazal@esi.dz</a>
                                </p>
                                 <p>
                                    <a href="mailto:dm_djema@esi.dz">dm_djema@esi.dz</a>
                                </p>
                                 <p>
                                    <a href="mailto:em_hafidi@esi.dz">em_hafidi@esi.dz</a>
                                </p>
                            </div>
                            <div class="footer-social address  address-mdl">
                                <h5>Medias sociaux</h5>
                                <ul>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-facebook icon_facebook"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-twitter icon_twitter"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-dribbble icon_dribbble"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-google-plus icon_g_plus"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- //contact-details right -->
                    <div class="clearfix"></div>
                </div>
                <!-- //contact details ends here -->
            </div>
        </div>
        <!-- //contact -->
   <!-- footer -->
    <div class="w3_footerv1 section">
        <div class="container">
            <div class="w3_footerv1_grids">
                <div class="col-md-3 col-sm-6 col-xs-6 w3_footerv1_grid">
                    <h3>Contact</h3>
                   
                    <ul class="address">
                        <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Oued Semar
                         <span>Alger.</span></li>
                      
                        <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+213 2 567 567</li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6  w3_footerv1_grid">
                    <h3>Informations</h3>
                    <ul class="info"> 
                        <li><a href="about.jsp">A propos</a></li>
                        <li><a href="about.jsp">Notre equipe </a></li>
                      
                      
                        <li><a href="contact.jsp">Aide </a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6  w3_footerv1_grid">
                    <h3>Categories</h3>
                    <ul class="info"> 
                        <li>Culture Generale</li>
                        <li>Astronomie</li>
                        <li> Histoire</li>
                        <li> Sport</li>
                        <li> Contes</li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6 w3_footerv1_grid">
                  
                    <div class="agileits_social_button">
                        <ul>
                            <li><a href="#" class="facebook"> </a></li>
                            <li><a href="#" class="twitter"> </a></li>
                            <li><a href="#" class="google"> </a></li>
                            <li><a href="#" class="pinterest"> </a></li>
                        </ul>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
<!-- //footer -->

</div>
<!-- //home -->
    <!-- js -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- //js -->
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