<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.lecture.model.*"%>
<%@ page import="com.speaker.model.*"%>
<!DOCTYPE html>

<%
	//lecture
	LecService lecSvc = new LecService();
	List<LecVO> list = lecSvc.getList();
	pageContext.setAttribute("list", list);
	
	String startdate = "";
	String startmonth = "";
	String starttime = "";
%>

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Xducation - ���A�������ǲߦn�٦�</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Icon -->
    <link rel="stylesheet" href="assets/fonts/line-icons.css">
    <!-- Owl carousel -->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/nivo-lightbox.css">
    <!-- Animate -->
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- Main Style -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- Responsive Style -->
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- Font Awesome
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">-->
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
	<style>
		.scrollable-dropdown{
    height: auto;
    max-height:320px;  /* Increase / Decrease value as per your need */
    overflow-x: hidden;
}
	</style>
</head>

<body>
    <!-- Header Area wrapper Starts -->
    <header id="header-wrap">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-md bg-inverse fixed-top scrolling-navbar">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <a href="<%=request.getContextPath()%>/index/front-index/index.jsp" class="navbar-brand"><img src="assets/img/logo.svg" alt="">
                    <div id="logo">Xducation</div>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="lni-menu"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto w-100 justify-content-end clearfix">
                        <li class="nav-item">
                        
  
<%--                             <a class="nav-link" href="<%=request.getContextPath()%>/front-end/course/listAllCourse.jsp"> --%>
<!--                                �i�J�j�M&nbsp;<i class="lni-search"></i>  -->
<!--                             </a> -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                ���ҵ{&nbsp;<i class="lni-leaf"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                �W�H���y&nbsp;<i class="lni-bulb"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: #0099CC">
                                �ڭn�n�J&nbsp;<i class="lni-home"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
        <!-- Hero Area Start -->
        <div id="hero-area" class="hero-area-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
                        <div class="contents">
                            <div class="about-wrapper wow fadeInLeft" data-wow-delay="0.3s">
                                <h2 class="head-title">���A�������ǲߦn�٦�</h2>
                                <i class="lni-rocket"></i>&nbsp;
                                Xducation - �̦��쪺�u�W�ǲߥ��x
                            </div>
                            <br>
                            <div class="about-wrapper wow fadeInLeft" data-wow-delay="0.4s">
                            <form action ="<%=request.getContextPath()%>/course/coursesearch.do" method="post" id="searchForm">
                                <div id="search">
                                    <table id="searchbox">
                                        <tr>
                                        	
                                            <td><i class="lni-search"></i></td>
                                            <td>
                                                <input type="text" size="30" placeholder="&nbsp;&nbsp;���ѷQ�Ǥ���O�H"  name="searchText">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="header-button">
<!--                                 	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown<span class="caret"></span></a> -->
<!--             											<ul class="dropdown-menu"> -->
<!--                 											<li><a href="#">First</a></li> -->
<!--                 											<li><a href="#">Second</a></li> -->
<!--                 											<li><a href="#">Third</a></li> -->
<!--             											</ul> -->
<!--         											</li>		 -->
                                    <button class="btn btn-common">�����ҵ{</button>
                                    <input type="hidden" name="action" value="search"/>
                                    <a href="<%=request.getContextPath()%>/course/coursephoto.do" class="btn btn-border video-popup">�ڭn���U</a>
                                </div>
                             </form>   
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                        <div class="about-wrapper wow fadeInRight" data-wow-delay="0.3s">
                            <div id="introimg">
                                <img class="img-fluid" src="assets/img/head/intro.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero Area End -->
    </header>
    <!-- Header Area wrapper End -->
    <!-- Services Section Start -->
    <section id="services" class="section-padding">
        <div class="container">
            <div class="section-header text-center">
                <h2 class="section-title wow fadeInDown" data-wow-delay="0.3s"><i class="lni-rocket"></i> ���ҵ{</h2>
                <div class="shape wow fadeInDown" data-wow-delay="0.3s"></div>
            </div>
            <div class="row">
                <!-- Services item1 -->
                <div class="col-md-6 col-lg-4 col-xs-12">
                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
                        <div class="icon">
                            <img src="assets/img/course/img1.jpg">
                        </div>
                        <div class="services-content">
                            <i class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i>
                            &nbsp;101�h����
                            <h3><a href="#">¾�H���s�a�ϡGMimmo�a�A�����@�ɤQ�j�s��</a></h3>
                            <p>�ҵ{�@300����</p>
                            <p>�P�ǲ֭p9487�H</p>
                            <h5>NT$1680</h5>
                        </div>
                    </div>
                </div>
                <!-- Services item2 -->
                <div class="col-md-6 col-lg-4 col-xs-12">
                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
                        <div class="icon">
                            <img src="assets/img/course/img2.jpg">
                        </div>
                        <div class="services-content">
                            <i class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i>
                            &nbsp;101�h����
                            <h3><a href="#">�MDiane�@�_���S��A���y�ӤH�ͬ�����</a></h3>
                            <p>�ҵ{�@300����</p>
                            <p>�P�ǲ֭p9487�H</p>
                            <h5>NT$1680</h5>
                        </div>
                    </div>
                </div>
                <!-- Services item3 -->
                <div class="col-md-6 col-lg-4 col-xs-12">
                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
                        <div class="icon">
                            <img src="assets/img/course/img3.jpg">
                        </div>
                        <div class="services-content">
                            <i class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i>
                            &nbsp;101�h����
                            <h3><a href="#">¾�H���s�a�ϡGMimmo�a�A�����@�ɤQ�j�s��</a></h3>
                            <p>�ҵ{�@300����</p>
                            <p>�P�ǲ֭p9487�H</p>
                            <h5>NT$1680</h5>
                        </div>
                    </div>
                </div>
                <!-- Services item4 -->
                <div class="col-md-6 col-lg-4 col-xs-12">
                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
                        <div class="icon">
                            <img src="assets/img/course/img3.jpg">
                        </div>
                        <div class="services-content">
                            <i class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i>
                            &nbsp;101�h����
                            <h3><a href="#">¾�H���s�a�ϡGMimmo�a�A�����@�ɤQ�j�s��</a></h3>
                            <p>�ҵ{�@300����</p>
                            <p>�P�ǲ֭p9487�H</p>
                            <h5>NT$1680</h5>
                        </div>
                    </div>
                </div>
                <!-- Services item5 -->
                <div class="col-md-6 col-lg-4 col-xs-12">
                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
                        <div class="icon">
                            <img src="assets/img/course/img1.jpg">
                        </div>
                        <div class="services-content">
                            <i class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i>
                            &nbsp;101�h����
                            <h3><a href="#">¾�H���s�a�ϡGMimmo�a�A�����@�ɤQ�j�s��</a></h3>
                            <p>�ҵ{�@300����</p>
                            <p>�P�ǲ֭p9487�H</p>
                            <h5>NT$1680</h5>
                        </div>
                    </div>
                </div>
                <!-- Services item6 -->
                <div class="col-md-6 col-lg-4 col-xs-12">
                    <div class="services-item wow fadeInRight" data-wow-delay="0.3s">
                        <div class="icon">
                            <img src="assets/img/course/img2.jpg">
                        </div>
                        <div class="services-content">
                            <i class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i><i class="lni-star-filled"></i><i
                                class="lni-star-filled"></i>
                            &nbsp;101�h����
                            <h3><a href="#">¾�H���s�a�ϡGMimmo�a�A�����@�ɤQ�j�s��</a></h3>
                            <p>�ҵ{�@300����</p>
                            <p>�P�ǲ֭p9487�H</p>
                            <h5>NT$1680</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->
    <!-- About Section start -->
    <div class="about-area section-padding bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-xs-12 wow fadeInLeft" data-wow-delay="0.3s">
                    <img class="img-fluid" src="assets/img/head/tchr.png" alt="">
                </div>
                <div class="col-lg-1 col-md-12 col-xs-12"></div>
                <div class="col-lg-5 col-md-12 col-xs-12 info">
                    <div class="about-wrapper wow fadeInRight" data-wow-delay="0.3s">
                        <div>
                            <div class="site-heading">
                                <h2 class="section-title">�����ڭ̪��Ѯv</h2>
                            </div>
                            <div class="content">
                                <p>
                                    V&emsp;���ɱz���~��<br>
                                    V&emsp;�гy�Q�ʦ��J<br>
                                    V&emsp;�ۧڿE�y����
                                </p>
                                <a href="#" class="btn btn-common mt-3">�ڷQ�A��</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About Section End -->
    <!-- Features Section Start -->
    <section id="features" class="section-padding">
        <div class="container">
            <div class="section-header text-center">
                <h2 class="section-title wow fadeInDown" data-wow-delay="0.3s"><i class="lni-rocket"></i> �W�H���y</h2>
                <div class="shape wow fadeInDown" data-wow-delay="0.3s"></div>
            </div>
            <div class="row">
                <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
                    <div class="content-left">
                        <div class="box-item wow fadeInLeft" data-wow-delay="0.3s">
                            <!-- ���y��� -->
                            <div class="lec_day">
                                <span>28<br>
                                    <span style="font-size:16px; font-weight:500;">SEP</span>
                                </span>
                            </div>
                            <div class="text">
                                <h4>�D�p����G���i�L�̪��ײ��q�j�Q</h4>
                                <p>�iANTICO FORNO�D�p�d�v�g�j�{���ܽd3�D�q���g��Ʋz X �q�j�Q�������</p>
                            </div>
                        </div>
                        <div class="box-item wow fadeInLeft" data-wow-delay="0.6s">
                            <div class="lec_day">
                                <span>28<br>
                                    <span style="font-size:16px; font-weight:500;">SEP</span>
                                </span>
                            </div>
                            <div class="text">
                                <h4>�D�p����G���i�L�̪��ײ��q�j�Q</h4>
                                <p>�iANTICO FORNO�D�p�d�v�g�j�{���ܽd3�D�q���g��Ʋz X �q�j�Q�������</p>
                            </div>
                        </div>
                        <div class="box-item wow fadeInLeft" data-wow-delay="0.9s">
                            <div class="lec_day">
                                <span>28<br>
                                    <span style="font-size:16px; font-weight:500;">SEP</span>
                                </span>
                            </div>
                            <div class="text">
                                <h4>�D�p����G���i�L�̪��ײ��q�j�Q</h4>
                                <p>�iANTICO FORNO�D�p�d�v�g�j�{���ܽd3�D�q���g��Ʋz X �q�j�Q�������</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ���y�ϹϤ� -->
                <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                    <div class="show-box wow fadeInUp" data-wow-delay="0.3s">
                        <img src="assets/img/head/calendar.gif" alt="">
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
    </section>
    <!-- Features Section End -->
    <!-- Testimonial Section Start -->
    <section id="testimonial" class="testimonial section-padding">
        <div class="container">
            <div class="section-header text-center">
                <h2 class="section-title wow fadeInDown" data-wow-delay="0.3s" style="color: #fff"><i
                        class="lni-rocket"></i>&nbsp;�n���j�n��</h2>
                <div class="shape wow fadeInDown" data-wow-delay="0.3s"></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="testimonials" class="owl-carousel wow fadeInUp" data-wow-delay="1.2s">
                        <div class="item">
                            <div class="testimonial-item">
                                <div class="img-thumb">
                                    <img src="assets/img/testimonial/img1.jpg" alt="">
                                </div>
                                <div class="info">
                                    <h2><a href="#">David Smith</a></h2>
                                    <h3><a href="#">Creative Head</a></h3>
                                </div>
                                <div class="content">
                                    <p class="description">Praesent cursus nulla non arcu tempor, ut egestas elit
                                        tempus. In ac ex fermentum, gravida felis nec, tincidunt ligula.</p>
                                    <div class="star-icon mt-3">
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-half"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-item">
                                <div class="img-thumb">
                                    <img src="assets/img/testimonial/img2.jpg" alt="">
                                </div>
                                <div class="info">
                                    <h2><a href="#">Domeni GEsson</a></h2>
                                    <h3><a href="#">Awesome Technology co.</a></h3>
                                </div>
                                <div class="content">
                                    <p class="description">Praesent cursus nulla non arcu tempor, ut egestas elit
                                        tempus. In ac ex fermentum, gravida felis nec, tincidunt ligula.</p>
                                    <div class="star-icon mt-3">
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-half"></i></span>
                                        <span><i class="lni-star-half"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-item">
                                <div class="img-thumb">
                                    <img src="assets/img/testimonial/img3.jpg" alt="">
                                </div>
                                <div class="info">
                                    <h2><a href="#">Dommini Albert</a></h2>
                                    <h3><a href="#">Nesnal Design co.</a></h3>
                                </div>
                                <div class="content">
                                    <p class="description">Praesent cursus nulla non arcu tempor, ut egestas elit
                                        tempus. In ac ex fermentum, gravida felis nec, tincidunt ligula.</p>
                                    <div class="star-icon mt-3">
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-half"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-item">
                                <div class="img-thumb">
                                    <img src="assets/img/testimonial/img4.jpg" alt="">
                                </div>
                                <div class="info">
                                    <h2><a href="#">Fernanda Anaya</a></h2>
                                    <h3><a href="#">Developer</a></h3>
                                </div>
                                <div class="content">
                                    <p class="description">Praesent cursus nulla non arcu tempor, ut egestas elit
                                        tempus. In ac ex fermentum, gravida felis nec, tincidunt ligula.</p>
                                    <div class="star-icon mt-3">
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-filled"></i></span>
                                        <span><i class="lni-star-half"></i></span>
                                        <span><i class="lni-star-half"></i></span>
                                        <span><i class="lni-star-half"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->
    <!-- Footer Section Start -->
    <footer id="footer" class="footer-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-mb-1">
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-mb-12">
                    <div class="widget" style="text-align: center">
                        <img src="assets/img/logo.svg" style="width: 100px; height: auto" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                    <h3 class="footer-titel">����ڭ�</h3>
                    �`�����D<br>
                    ���p�F��<br>
                    �\���s
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                    <h3 class="footer-titel">��L�A��</h3>
                    ���~���<br>
                    ���~�X�@<br>
                    �s�i����
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                    <h3 class="footer-titel">�����a��</h3>
                    ���ҵ{<br>
                    �W�H���y<br>
                    �Ѯv�\��
                </div>
            </div>
        </div>
        <div class="col-md-12" style="padding-bottom: 100px">
        </div>
    </footer>
    <!-- Footer Section End -->
    <!-- Go to Top Link -->
    <a href="#" class="back-to-top">
        <i class="lni-comments"></i>
    </a>
    <!-- Preloader -->
    <div id="preloader">
        <div class="loader" id="loader-1"></div>
    </div>
    <!-- End Preloader -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/jquery-min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/wow.js"></script>
    <script src="assets/js/jquery.nav.js"></script>
    <script src="assets/js/scrolling-nav.js"></script>
    <script src="assets/js/jquery.easing.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
    $(document).ready(function(e){
	      $('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#","");
				var concept = $(this).text();
				$('.search-panel span#search_concept').text(concept);
				$('.input-group #search_param').val(param);
		   	});
	      });
var a = document.getElementByTagName('a').item(0);
$(a).on('keyup', function(evt){
console.log(evt);
if(evt.keycode === 13){
  
  alert('search?');
} 
}); 
    </script>
</body>

</html>