<%@ page language="java" contentType="text/html; charset=ISO-8859-4" pageEncoding="UTF-8"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%try{


Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://localhost:5432/apprentissage";
String user="postgres";
String passwd="root";

Connection con=DriverManager.getConnection(url,user,passwd);
session.setAttribute("user_id",1);
int user_id =(Integer) session.getAttribute("user_id");
PreparedStatement nu = con.prepareStatement("select * from quizregister where id_user='" + user_id + "'");
ResultSet ligne = nu.executeQuery();
session.setAttribute("username",ligne.getString("username"));
session.setAttribute("email",ligne.getString("email"));
session.setAttribute("category",ligne.getString("category"));


}catch(SQLException e2){
e2.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>FunLearn</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="FunLearn" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <!-- shop css -->
    <link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    
    <!-- //Custom Theme files -->
    <!-- online-fonts -->
    <!-- logo -->
    <link href="//fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
    <!-- titles -->
    <link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i" rel="stylesheet">
    <!-- body -->
    <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
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
                            <a class="navbar-brand" href="index.html">FunLearn</a>
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
                                <a href="index.jsp">Se déconnecter</a>
                            </li>
                            <li>
                                <a href="about.jsp">A PROPOS</a>
                            </li>
                            <li>
                                <a href="ExpertHome.jsp">Creer un quiz</a>
                            </li>
                            
                            <li>
                                <a href="contact.jsp">CONTACTEZ-NOUS</a>
                            </li>
                          

                        </ul>
                       
                        <!-- shopping cart -->
                       
                        <!-- //shopping cart ends here -->
                    </div>
                
                    <!-- /.navbar-collapse -->
                   
              
               
        </nav>
        <div class="banner-text">
                <div class="container">
                    
                  <img src="images/parentProfil.png" alt="<%out.println(session.getAttribute("username"));%>" /> <br/><br/>
                    <ul class="banner-txt">
                        <li>Nom d'utilisateur :<%out.println(session.getAttribute("username"));%></li>
                        <li>E-mail :<% out.println(session.getAttribute("email"));%></li>
                        <li>Catégorie :<%out.println(session.getAttribute("category")); %></li>
                    </ul>
                </div>
            </div>
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
