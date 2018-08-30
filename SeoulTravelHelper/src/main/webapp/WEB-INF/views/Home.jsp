<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Pink-Donut One Page Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <!--<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,600,700' rel='stylesheet' type='text/css'>-->
        <link rel="stylesheet" href="resources/css/fonticons.css">
        <link rel="stylesheet" href="resources/fonts/stylesheet.css">
        <link rel="stylesheet" href="resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


        <!--For Plugins external css-->
        <link rel="stylesheet" href="resources/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="resources/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="resources/css/responsive.css" />

        <script src="resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<div class='preloader'><div class='loaded'>&nbsp;</div></div>
        <!--Home page style-->
        <header id="main_menu" class="header">
            <div class="main_menu_bg navbar-fixed-top">
                <div class="container">
                    <div class="row">
                        <div class="nave_menu">
                            <nav class="navbar navbar-default">
                                <div class="container-fluid">
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                        
                                    </div>

                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                                        <ul class="nav navbar-nav">
                                            <li><a href="Home">Home</a></li>
                                            <li><a href="Weather">Weather</a></li>
                                             <li><a href="Culture">Culture</a></li>
                                            <li><a href="Socar">Socar</a></li>
                                            <li><a href="Board">Board</a></li>
                                        </ul>
                                        
                                        <ul class="nav navbar-nav navbar-right">
                                            
                                            <c:if test="${sessionScope.loginid == null }">
                                            <li><a href="Login">Login</a></li>
                                            </c:if>
                                            
                                            <c:if test="${sessionScope.loginid == null }">
                                             <li><a href="MyPage">My Page</a></li>
                                            </c:if>
                                            
                                        </ul>
                                       
                                    </div>
                                </div>
                            </nav>
                        </div>	
                    </div>

                </div>

            </div>
        </header> <!--End of header -->



        <section id="home" class="home">
            <div class="home_overlay">
                <div class="container">
                    <div class="row">
						
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						  <!-- Indicators -->
						  <ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						  </ol>

						  <!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								 <div class="carousel-caption">
								</div>
								<img src="resources/images/banner.png" alt="...">
							</div>
							<div class="item">
								<div class="carousel-caption">
								</div>
								<img src="resources/images/banner.png" alt="...">
							</div>
							<div class="item">
								<div class="carousel-caption">
								</div>
								<img src="resources/images/banner.png" alt="...">
							</div>
						</div>


						</div>						
						

                    </div>  <!-- row -->
                </div>
            </div>
        </section><!-- End of Banner Section -->


        <section id="myworks" class="myworks">
            <div class="container">
                <div class="row">	
					<div class="col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 col-xs-12 no-padding">

					</div><!-- End of col-sm-2 -->
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="head_title text-center wow fadeInLeft"  data-wow-duration="2s">
							<h2>My Works</h2>
							<div class="separator"></div>
						</div>
					</div>
					
                </div>
            </div>
			
			<div class="main_myworks_content text-center">
				<div class="single_work_colum col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"  data-wow-duration="1.5s">
					<div class="single_work">
						<a href="Weather"><img src="resources/images/1.png" alt="" /></a>
					</div>
				</div>
				<div class="single_work_colum col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"  data-wow-duration="2s">
					<div class="single_work">
						<a href="Culture"><img src="resources/images/3.png" alt="" /></a>
					</div>
				</div>
				<div class="single_work_colum col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"  data-wow-duration="3s">
					<div class="single_work">
						<a href="Socar"><img src="resources/images/2.png" alt="" /></a>
					</div>
				</div>
				<div class="single_work_colum col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"  data-wow-duration="4s">
					<div class="single_work">
						<a href="MyPage"><img src="resources/images/4.png" alt="" /></a>
					</div>
				</div>
				
			</div>
        </section><!-- End of Features Section -->
		

        <section id="contact" class="contact">
            <div class="container">
                <div class="row">
                    <div class="main_contact">
                        
                        <div class="contact_content">
                            
                            <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInLeft"  data-wow-duration="2s">
								<div class="contact_message">
									<form action="#" id="formid">
										<label for="">Name</label>
										<div class="form-group">
											<input type="text" class="form-control" name="name" placeholder="name" required="">
										</div>
										
										<label for="">Email</label>
										<div class="form-group">
											<input type="email" class="form-control" name="email" placeholder="Email" required="">
										</div>

										<label for="">Message</label>
										<div class="form-group">
											<textarea class="form-control" name="message" rows="8" placeholder="Message"></textarea>
										</div>

										<div class="message_btn text-center">
											<div class="btn_bg">
												<a href="" class="btn">Send</a>
											</div>
										</div>
									</form>
								</div>
							</div>

                            <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInRight"  data-wow-duration="2s">
								<div class="contact_socail_bookmark_area">
									<div class="head_title text-center">
										<h2>CONTACT US</h2>
										<div class="separator"></div>
									</div>
									
									
									<div class="contact_socail_bookmark">
										<a href=""><img src="resources/images/facebook.png" alt=""  style="width: 32px; height: 32px;"/></a>
										<a href=""><img src="resources/images/Instagram.png" alt="" style="width: 32px; height: 32px;" /></a>
										<a href=""><img src="resources/images/Kakao_Talk.png" alt="" style="width: 32px; height: 32px;" /></a>
										<a href=""><img src="resources/images/twitter.png" alt="" style="width: 32px; height: 32px;"/></a>
									</div>
									
									<div class="contact_adress">
										<h3>Address:</h3>
										<span>Yeongdong-daero 513, Gangnam-gu, Seoul</span>
										<span>COEX office (06164)</span>
									</div>
									
									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="single_contact_phone">
												<h3>Phone:</h3>
												<span>+82 1566 - 5114</span>
											</div>
										</div>
										
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="single_contact_phone">
												<h3>Email:</h3>
												<span>ddaaahhiiiii@gmail.com</span>
											</div>
										</div>
									</div>
									
								</div>
							</div>
                        </div>
                    </div>
                </div>
				
				<div class="row">
					<div class="footer_copyright">
					
						<div class="col-md-6 col-sm-6 col-xs-12 wow fadeInDown"  data-wow-duration="3s">
							<div class="single_copyirgth text-left">
								<p>Copyright 2018 &copy; by D반4조</p>
							</div>
						</div>
						
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single_copyirgth wow fadeInUp"  data-wow-duration="2s">
								<ul class="navbar-right">
									<li class="active"><a href="Home">다음에채우기</a></li>
			
								</ul>
							</div>
						</div>
						
					</div>
				</div>
            </div>
        </section><!-- End of contact With Map Section -->

        

       





        <!-- STRAT SCROLL TO TOP -->

        <div class="scrollup">
            <a href="#"><i class="fa fa-chevron-up"></i></a>
        </div>

        <script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="resources/js/vendor/bootstrap.min.js"></script>
        <script src="resources/js/vendor/isotope.min.js"></script>

        <script src="resources/js/jquery.easypiechart.min.js"></script>
        <script src="resources/js/jquery.mixitup.min.js"></script>
        
            
        <script src="resources/js/plugins.js"></script>
        <script src="resources/js/main.js"></script>
        
    </body>
</html>
