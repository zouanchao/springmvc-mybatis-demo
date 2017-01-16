<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<base href="${base}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>spring-mybatis-demo Login</title>
    <link href="static/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="static/font-awesome/css/animate.css" rel="stylesheet">
    <link href="static/font-awesome/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="static/common/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
</head>

<body class="gray-bg">
<div class="loginColumns animated fadeInDown">
    <div class="row">
        <div class="col-lg-6 col-md-6 ">
			<div id="myCarousel" class="carousel slide">
			    <!-- 轮播（Carousel）指标 -->
			    <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>   
			    <!-- 轮播（Carousel）项目 -->
			    <div class="carousel-inner">
			        <div class="item active">
			            <img src="static/common/images/2s.jpg" alt="First slide" style="width: 465px;height: 320px;">
			            <div class="carousel-caption" style="font-weight: bold;">请相信，这个世界上真的有人过着你想要的生活。忽晴忽雨的江湖，祝你有梦为马，随处可栖。</div>
			        </div>
			        <div class="item">
			            <img src="static/common/images/6s.jpg" alt="Second slide" style="width: 465px;height: 320px;">
			            <div class="carousel-caption" style="font-weight: bold;">心随念走，身随缘走，不能靠心情活着，而是靠心态活着</div>
			        </div>
			        <div class="item">
			            <img src="static/common/images/3s.jpg" alt="Third slide" style="width: 465px;height: 320px;">
			            <div class="carousel-caption" style="font-weight: bold;">情意这东西，一见如故容易，难得是来日方长的陪伴。</div>
			        </div>
			    </div>
			    <!-- 轮播（Carousel）导航 -->
			    <a class="carousel-control left" href="#myCarousel" 
			        data-slide="prev">&lsaquo;
			    </a>
			    <a class="carousel-control right" href="#myCarousel" 
			        data-slide="next">&rsaquo;
			    </a>
			</div>
        </div>
        <!-- login start -->
        <div class="col-lg-6 col-md-6 ">
            <div class="ibox-content">
                <form class="m-t" role="form" action="demo/login" method="post">
                    <div class="form-group">
                        <input type="text" name="userName" class="form-control" placeholder="用户名" required="true">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="密码" required="true">
                    </div>
                    <button type="submit" class="btn btn-primary block full-width m-b">登录</button>
                    <a href="#"><small>忘记密码</small></a>
                    <p class="text-muted text-center">
                        <small>你还没有有账号吗？</small>
                    </p>
                    <a class="btn btn-sm btn-white btn-block" href="register">点我创建</a>
                </form>
                <p class="m-t">
                    <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small>
                </p>
            </div>
        </div><!-- ./login end -->
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-6">
            Copyright Example Company
        </div>
        <div class="col-md-6 text-right">
            <small>© 2014-2015</small>
        </div>
    </div>
</div>
<script>
$(function(){
	$('.carousel').carousel();
})
</script>
</body>

</html>
