<!DOCTYPE html>
<!-- 中文简体 zh-cmn-Hans-->
<html lang="zh-CN">
<head>
	<base href="${base}"/> 
	<meta charset="UTF-8">
	<!-- 优先使用 IE 最新版本和 Chrome -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<!-- 为移动设备添加 viewport -->
	<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<!-- 忽略页面中的数字识别为电话，忽略email识别 -->
	<meta name="format-detection" content="telphone=no, email=no" />
	<!-- 启用360浏览器的极速模式(webkit) -->
	<meta name="renderer" content="webkit">
	<!-- 避免IE使用兼容模式 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 不让百度转码 -->
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="static/ace-master/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="static/ace-master/assets/font-awesome/4.5.0/css/font-awesome.min.css" /> 
		<!-- page specific plugin styles --> 
		<!-- text fonts -->
		<link rel="stylesheet" href="static/ace-master/assets/css/fonts.googleapis.com.css" /> 
		<!-- ace styles -->
		<link rel="stylesheet" href="static/ace-master/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="static/ace-master/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="static/ace-master/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/ace-master/assets/css/ace-rtl.min.css" /> 
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="static/ace-master/assets/css/ace-ie.min.css" />
		<![endif]--> 
		<!-- inline styles related to this page --> 
		<!-- ace settings handler -->
		<script src="static/ace-master/assets/js/ace-extra.min.js"></script> 
		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries --> 
		<!--[if lte IE 8]>
		<script src="static/ace-master/assets/js/html5shiv.min.js"></script>
		<script src="static/ace-master/assets/js/respond.min.js"></script>
		<![endif]-->
	</head> 
	<body>
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script> 
			<!-- 右侧主体内容显示 -->
			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li class="active">欢迎</li>
						</ul> 
						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div> 
					</div> 
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button> 
									<i class="ace-icon fa fa-check green"></i> 
									欢迎来到
									<strong class="green">
										Ace
										<small>Shiro Demo</small>
									</strong>,
									基于Maven构建的springmvc、spring、mybatis、shiro、log4j2、ace-admin简单实用的权限系统。</strong>
								</div>  
								 <div class="hr hr32 hr-dotted"></div>
							</div><!-- /.col-xs-12 -->
						</div><!-- /.row -->
						
					</div><!-- /.page-content -->
				</div><!-- /.main-content-inner -->
			</div><!-- /.main-content --> 
		</div><!-- /.main-container -->
		<!-- basic scripts --> 
		<!--[if !IE]> -->
		<script src="static/ace-master/assets/js/jquery-2.1.4.min.js"></script> 
		<!-- <![endif]--> 
		<!--[if IE]>
		<script src="static/ace-master/assets/js/jquery-1.11.3.min.js"></script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='static/ace-master/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="static/ace-master/assets/js/bootstrap.min.js"></script> 
		<!-- page specific plugin scripts --> 
		<!--[if lte IE 8]>
		  <script src="static/ace-master/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="static/ace-master/assets/js/jquery-ui.custom.min.js"></script>
		<script src="static/ace-master/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="static/ace-master/assets/js/jquery.easypiechart.min.js"></script>
		<script src="static/ace-master/assets/js/jquery.sparkline.index.min.js"></script>
		<script src="static/ace-master/assets/js/jquery.flot.min.js"></script>
		<script src="static/ace-master/assets/js/jquery.flot.pie.min.js"></script>
		<script src="static/ace-master/assets/js/jquery.flot.resize.min.js"></script> 
		<!-- ace scripts -->
		<script src="static/ace-master/assets/js/ace-elements.min.js"></script>
		<script src="static/ace-master/assets/js/ace.min.js"></script> 
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			 		
		</script>
	</body>
</html>