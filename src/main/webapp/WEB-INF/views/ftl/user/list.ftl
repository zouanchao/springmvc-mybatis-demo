<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<base href="${base}">
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>spring-mybatis-demo首页</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!-- Bootstrap 3.3.6 -->
		<link rel="stylesheet" href="static/adminLTE/bootstrap/css/bootstrap.min.css">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="static/adminLTE/dist/css/font-awesome.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="static/adminLTE/dist/css/ionicons.min.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="static/adminLTE/dist/css/AdminLTE.min.css">
		<!--
		<link rel="stylesheet" href="static/dataTables-1.10.12/media/css/jquery.dataTables.min.css">
		-->
		<!-- DataTables -->
  		<link rel="stylesheet" href="static/adminLTE/plugins/datatables/dataTables.bootstrap.css">
  		
		<link rel="stylesheet" href="static/adminLTE/dist/css/skins/_all-skins.min.css">
		<!-- bootstrap wysihtml5 - text editor -->
		<link rel="stylesheet" href="static/adminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
	  <script src="static/adminLTE/dist/js/html5shiv.min.js"></script>
	  <script src="static/adminLTE/dist/js/respond.min.js"></script>
	  <![endif]-->
	  <link rel="stylesheet" href="static/common/css/common.css" />
	  <style>
	  	.center{text-align: center;}
	  </style>
	</head>
	<body>
		<div class="wrapper">
				<!-- Main content -->
				<section class="content main-content" id="mainContent">
					<div class="box" style="border-top: 1px solid #ECECEC;">
			            <div class="box-header">
			                <!-- 查询、添加、批量删除、导出、刷新 -->
							<div class="row-fluid">
							    <div class="pull-right">
							        <div class="btn-group">
							            <button type="button" class="btn btn-primary btn-sm" id="btn-add">
							                <i class="fa fa-plus"></i> 添加
							            </button>
							            <button type="button" class="btn btn-primary btn-sm" id="btn-delAll">
							                <i class="fa fa-remove"></i> 删除
							            </button>
							            <button type="button" class="btn btn-primary btn-sm" id="btn-export">
							                <i class="fa fa-sign-in"></i> 导出
							            </button>
							            <button type="button" class="btn btn-primary btn-sm" id="btn-re">
							                <i class="fa fa-refresh"></i> 刷新
							            </button>
							        </div>
							    </div>
							    <div class="row">
							        <form id="queryForm" action="user/ajaxList" method="post">
							            <div class="col-xs-2">
							                <input type="text" id="keyword" name="keyword" class="form-control input-sm"
							                    placeholder="请输入查询关键字">
							            </div>
							            <button type="button" class="btn btn-primary btn-sm" id="btn-query">
							                <i class="fa fa-search"></i> 查询
							            </button>
							        </form>
							    </div>
							</div>
			            </div>
						<div class="box-body">
							 <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed" align="center">
							    <thead>
							        <tr class="info">
							            <td><input type="checkbox" id="checkAll"></td>
							            <th>用户名</th>
							            <th>姓名</th>
							            <th>邮箱</th>
							            <th最近登录IP</th>
							            <th>最近登录时间</th>
							            <th>操作</th>
							        </tr>
							    </thead>
							</table>
						</div>
				</section><!-- ./end -->
		</div>
		<!-- ./wrapper -->
		<script src="static/common/js/jquery-1.11.3.min.js"></script>
		<script src="static/adminLTE/bootstrap/js/bootstrap.min.js"></script>
		<!-- AdminLTE App -->
		<script src="static/adminLTE/dist/js/app.min.js"></script>
		<!--
		<script src="static/dataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
		-->
		<!-- DataTables -->
		<script src="static/adminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="static/adminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<!-- boot-box -->
		<script src="static/bootbox/bootbox.min.js"></script> 
		<!-- inline scripts related to this page -->
		<script src="static/common/js/common.js"></script> 
		<!-- page script -->
		<script>
			/*日期格式化*/
			Date.prototype.Format = function (fmt) { //author: meizz 
			    var o = {
			        "M+": this.getMonth() + 1, //月份 
			        "d+": this.getDate(), //日 
			        "h+": this.getHours(), //小时 
			        "m+": this.getMinutes(), //分 
			        "s+": this.getSeconds(), //秒 
			        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			        "S": this.getMilliseconds() //毫秒 
			    };
			    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			    for (var k in o)
			    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			    return fmt;
			}
			var tables;
		    $(function () {
		    	initTable();
            });
            
            function initTable(){
		       tables = $("#dataTable").DataTable({
			             "oLanguage": {//表格汉化
		                    "sSearch": "搜索",
		                    "sLengthMenu": "每页显示 _MENU_ 条记录",
		                    "sZeroRecords": "没有检索到数据",
		                    "sInfo": "显示 _START_ 至 _END_ 条记录, &nbsp;&nbsp;共 _TOTAL_ 条记录",
		                    "sInfoFiltered": "(筛选自 _MAX_ 条数据)",
		                    "sInfoEmtpy": "没有数据",
		                    "sProcessing": "正在加载数据...",
		                    "sProcessing": "<img src='static/common/images/loading.gif' />", //这里是给服务器发请求后到等待时间显示的 加载gif
		                    "oPaginate":
		                       {
		                         "sFirst": "首页",
		                         "sPrevious": "前一页",
		                         "sNext": "后一页",
		                         "sLast": "末页"
		                       }
		                  },
		                  bAutoWidth: false,
						  "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
						                {"mData": 'id','sClass':'center'},
					                    {"mData": 'userName'},
					                    {"mData": 'realName'},
					                    {"mData": 'email','sClass':'td_title'},
					                    {"mData": 'createDate'},
					                    {"sDefaultContent": ''}
						 ],
						 "aoColumnDefs": [
										{
										    "aTargets": [0],
										    "mData": 'id',
										    "bSortable": false,
										    "bSearchable": false,
										    "mRender": function (data, type, full) {
										    	return '<label class="pos-rel">'+
										    			'<input type="checkbox" class="ace" /> <span class="lbl"></span>'+
														'</label>';
										    }
									  },
									   {
								    	 "aTargets": [4],
						                  "mData": 'createDate',
						                  "bSortable": false,
						                  "bSearchable": false,
						                  "mRender": function (data, type, full) {
						                     if(data==""){
						                    	 return "";
						                     }else{
						                    	 return new Date(data).Format("yyyy-MM-dd hh:mm:ss");
						                     }
						                  }
								     },
						 ],
						 "bFilter": true, 
						 "aaSorting": [],
						 "ordering": false,
						 select: {
							style: 'multi'
						 },
						 "sPaginationType" : "full_numbers",
						 searching: false,
						 aLengthMenu:[10],//设置一页展示10条记录  
				         "bLengthChange": false,//屏蔽tables的一页展示多少条记录的下拉列表  
				         "processing": true, //打开数据加载时的等待效果  
				         "bServerSide": true,//打开后台分页
				         "sAjaxSource" : "user/ajaxList",
				         "fnServerData": retrieveData // 获取数据的处理函数
			    });
             }
             
             /**
			 * 后台分页
			 */
			function retrieveData(sSource, aoData, fnCallback ) { 
				console.log(aoData);
				$.ajax({
					type: "post",
					dataType:'json', //接受数据格式 
					cache:false,
					data:aoData, 
					url: sSource,
					beforeSend: function(XMLHttpRequest){
					//ShowLoading();
				},
				success: function(result){
				console.log(result);
				    if(result.aaData==""){
				    	alert("无相关数据,请刷新");
					}
					fnCallback(result);
				},
				complete: function(XMLHttpRequest, textStatus){
					//HideLoading();
				},
				error: function(){
					//请求出错处理
					alert("error");
				}
			   });
			}
		
		</script>
	</body>

</html>