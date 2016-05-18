<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>悬赏详情页</title>
		<link rel="stylesheet" href="${contextPath}/css/base.css" />
		<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/web/commonPc.css" />
		<script src="${contextPath}/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/web/commonPc.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
		<style type="text/css">
			#main{
				padding:10px;
			}
			.top-left{
				display: table-cell;
				text-align: center;
				vertical-align: middle;
			}
			.top-right{
				display: table-cell;
				width: 10000px;
				padding:0 10px;
				line-height: 1.5;
			}
			.businessText{
				font-size: 16px;
				font-weight: 700;
			}
			.middle{
				margin:10px 0;
			}
			.bottom .label{
				float: left;
			}
			.bottom .time{
				float: right;
				font-size: 14px;
				color:#999;
			}
			.list-group-item{
				padding: 0 15px;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				// $('#prompt').modal('show');
				// $('#prompt').modal('hide');
			})
		</script>
	</head>

	<body>
	<!-- 包含块 begin -->
		<div id="thirdWrap">
		<!--导航 begin-->
			<div id="nav">
				<ol class="breadcrumb">
					<li><a href="${contextPath}/web/supplierProduct/index.do?key=0">悬赏列表</a></li>
					<li class="active">悬赏详情页</li>
				</ol>
			</div>
		<!--导航 end-->

		<!--主要 begin-->
			<div id="main">
				
				<!--档案-->
				<div class="files panel panel-default">
					<div class="panel-body">
						<div class="top clearfix">
							<div class="top-left">
								<img class="headImg" width="40" height="40" /><!-- 头像 -->
							</div>
							<div class="top-right">
								<span class="businessText">haha</span><br><!-- 公司名 -->
								<span class="nameText">黄国辉</span><!-- 姓名 -->
								<span class="mobileText">（135478513454）</span><!-- 手机号码 -->
							</div>
						</div>
						<p class="middle contentText"><!-- 内容 -->
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
							quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
							cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
							proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
						</p>
						<div class="bottom">
							<span class="label label-success">已确认</span>
							<!--<span class="label label-primary">悬赏中</span>-->
							<!--<span class="label label-warning">已过期</span>-->
							<span class="time">有效时间：2016/06/27 15:30</span>
						</div>
					</div>
				</div>
				
				<h5><strong>跟踪记录列表</strong></h5>
				<ul class="list-group">
					<li class="list-group-item acitve">
						<h5 class="track-title"><strong>title</strong></h5>
						<p class="track-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					</li>
					<li class="list-group-item acitve">
						<h5 class="track-title"><strong>title</strong></h5>
						<p class="track-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					</li>
					<li class="list-group-item acitve">
						<h5 class="track-title"><strong>title</strong></h5>
						<p class="track-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					</li>
					<li class="list-group-item acitve">
						<h5 class="track-title"><strong>title</strong></h5>
						<p class="track-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					</li>
					<li class="list-group-item acitve">
						<h5 class="track-title"><strong>title</strong></h5>
						<p class="track-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					</li>
				</ul>
			


				<!-- 模拟prompt -->
				<div class="modal fade" id="prompt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">跟踪记录</h4>
							</div>
							<div class="modal-body">
								<div class="form-grounp">
									<label>题目：</label>
									<input class="form-control" type="text" name="">
								</div>
								<div class="form-grounp">
									<label>内容：</label>
									<textarea class="form-control"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" id="save">确定</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		<!--主要 end-->
		</div>
	<!-- 包含块 end -->
	</body>

</html>