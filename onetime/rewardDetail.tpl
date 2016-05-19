<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	<title>悬赏关系详情</title>

	<!-- 通用样式 -->
	<link rel="stylesheet" type="text/css" href="css/base.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />

	<!-- 引入js -->
	<script src="js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/common.js" type="text/javascript" charset="utf-8"></script>

	<style type="text/css">
		#content {
			padding: 46px 0 10px;
		}
		.btn-wrap {
			margin: 10px;
		}
		p {
			margin: 0;
		}
		.reward-item {
			border: 1px solid #ddd;
			border-radius: 5px;
			margin: 10px;
			background: #fff;
			box-shadow: 2px 3px 1px rgba(0, 0, 0, 0.2);
		}
		.reward-item a {
			display: block;
		}
		.item-top {
			border-bottom: 1px solid #ddd;
		}
		.item-top img {
			box-sizing: content-box;
			float: left;
			padding: 10px;
		}
		.reward-company {
			box-sizing: content-box;
			line-height: 50px;
			padding: 0 10px 0 0;
			font-size: 16px;
		}
		.reward-company span {
			float: left;
			font-weight: 700;
		}
		.reward-company small {
			display: block;
			overflow: hidden;
			padding: 0 0 0 5px;
			white-space: nowrap;
			text-overflow: ellipsis;
			color: #666;
		}
		.item-middle {
			padding: 10px;
			border-bottom: 1px solid #ddd;
			text-indent: 2em;
			word-break: break-all;
		}
		.item-bottom {
			padding: 10px;
			color: #999;
			font-size: 12px;
		}
		.item-bottom .left {
			float: left;
		}
		.item-bottom .right {
			float: right;
		}
		/*认领和咨询按钮*/
		.btn-wrap {
			margin: 10px 12px;
			text-align: right;
		}
		.btn-wrap #adopt {
			margin: 0 15px 0 0;
		}
		/*comment heading*/
		.c-hd {
			margin: 10px;
			font-size: 14px;
			font-weight: 700;
			color: #666;
		}
		/*认领列表*/
		.adopt-list {
			background: #fff;
		}
		.adopt-item {
			display: block;
			padding: 0;
			line-height: 50px;
			border-top: 1px solid #ddd;
		}
		.adopt-item:first-of-type {
			border: none;
		}
		.adopt-item img {
			float: left;
			margin: 10px 5px;
		}
		.adopt-item p {
			margin: 0 50px 0 40px;
			font-size: 15px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		.adopt-item small{
			margin:0 0 0 5px;
			color:#666;
		}
		.adopt-item .btn {
			float: right;
			padding: 1px 6px;
			margin: 13px 3px 0 0;
		}
		.adopt-list.visitor p {
			margin: 0 0 0 40px;
		}
		.adopt-list.visitor .btn {
			display: none;
		}
		/*评论列表*/
		.consult-list {
			padding: 0 5px;
			background: #fff;
		}
		.consult-list.inner {
			margin: 10px 0 0;
			background: #efefef;
		}
		/*单个评论*/
		.consult-list .consult-item {
			padding: 5px 0;
			border-top: 1px solid #ddd;
		}
		.consult-list .consult-item:first-of-type {
			border: none;
		}
		/*头像*/
		.consult-list .consult-item img {
			position: relative;
			top: 5px;
			float: left;
			border-radius: 15px;
		}
		/*信息 内容 包含块*/
		.consult-list .content {
			margin: 0 0 0 35px;
		}
		/*评论人信息*/
		/*评论，点赞按钮*/
		.consult-list  .content .ps-info .act-wrap {
			float: right;
			height: 25px;
			padding: 5px 0 0;
		}
		.consult-list .consult-btns {
			margin: 0 3px;
			color: #666;
		}
		.consult-list .consult-btns:before {
			content: "";
			display: inline-block;
			width: 20px;
			height: 20px;
			margin: -3px 2px 0 0;
			vertical-align: middle;
		}
		/*评论按钮*/
		.consult-list .com-btn:before {
			background: url(img/share/comment.png) center center no-repeat;
			background-size: contain;
		}
		/*点赞按钮*/
		.consult-list .agree-btn:before {
			background: url(img/share/agree.png) center center no-repeat;
			background-size: contain;
		}
		/*已点赞*/
		.consult-list .agree-btn.active:before {
			background: url(img/share/agreeactive.png) center center no-repeat;
			background-size: contain;
		}
		/*用户名*/
		.consult-list .name {
			overflow: hidden;
			color: #666;
			font-size: 14px;
		}
		/*评论时间*/
		.consult-list .time {
			overflow: hidden;
			color: #aaa;
			font-size: 12px;
		}
		/*评论内容*/
		.consult-list .main-content {
			margin: 5px 0;
			color: #222;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<!--导航条-->
		<nav class="clearfix" id="nav">
			<h2>普伟集团</h2>
			<ul>
				<!--已登录-->
				<li>
					<a class="msg" href="###"></a>
				</li>
				<!--未登录-->
				<li>
					<a class="register" href="###"></a>
				</li>
				<li>
					<a class="search" href="###"></a>
				</li>
				<li>
					<a class="sideBar" id="sideBtn" href="javascript:void(0)"></a>
				</li>
			</ul>
		</nav>

		<!--侧栏-->
		<div id="sideBlock">
			<!--侧栏顶部-->
			<div class="sideBlock-top clearfix">
				<img src="img/common/common6.png" />
				<div class="sideBlock-top-center">
					<p>张某某</p>
					<p>电话：12345678</p>
				</div>
				<a href="">扫一扫</a>
			</div>
			<!--侧栏中部-->
			<div class="sideBlock-middle">
				<!--实用链接-->
				<h6>实用链接</h6>
				<div class="sideBlock-middle-part sideBlock-middle-part1">
					<a class="clearfix" href="###">首页<i></i></a>
					<a class="clearfix" href="###">精品课程<i></i></a>
					<a class="clearfix" href="###">商机把握<i></i></a>
					<a class="clearfix" href="###">学员产品<i></i></a>
					<a class="clearfix" href="###">营商智囊<i></i></a>
				</div>
				<!--账户管理-->
				<h6>账户管理</h6>
				<div class="sideBlock-middle-part sideBlock-middle-part2">
					<a class="clearfix" href="###">个人中心<i></i></a>
					<a class="clearfix" href="###">个人资料<i></i></a>
					<a class="clearfix" href="###">修改密码<i></i></a>
				</div>
				<!--管理-->
				<h6>管理</h6>
				<div class="sideBlock-middle-part sideBlock-middle-part3">
					<a class="clearfix" href="###">企业管理<i></i></a>
					<a class="clearfix" href="###">参训记录<i></i></a>
				</div>

				<!--退出按钮-->
				<a class="out" href="###">退出登录</a>

			</div>
		</div>
		<!--=================================================================================================-->
		<!--内容-->
		<div id="content">

		<!-- 悬赏关系详情 begin -->
			<div id="rewardDetail">

				<!-- 悬赏列表 -->
				<ul class="reward-list">

					<!-- 单个悬赏 -->
					<li class="reward-item">
						<a href="javascript:void(0)">
							<!-- 单个顶部 -->
							<div class="item-top clearfix">
								<img src="img/share/top.jpg"  width="30" height="30">
								<p class="reward-company"><span>黄国辉</span><small>普伟集团普伟集团普伟集团普伟集团普伟集团普伟集团普伟集团普伟集团</small></p>
							</div>
							<!-- 单个中部 -->
							<div class="item-middle">
								我想要找三星，苹果，索尼手机供应商；以及联想笔记本电脑，惠普电脑供应商。
							</div>
							<!-- 单个底部 -->
							<div class="item-bottom clearfix">
								<span class="left label label-success">已确认</span>
								<!--<span class="left label label-primary">悬赏中</span>-->
								<!--<span class="left label label-warning">已过期</span>-->
								<span class="right">有效时间:2016/5/17 09:11</span>
							</div>
						</a>
					</li>
				</ul>
			
				<!--认领和咨询按钮 -->
				<div class="btn-wrap">
					<button class="btn btn-info" id="adopt">认领</button>
					<button class="btn btn-primary" id="consult">咨询</button>
				</div>
				
				<!--comment heading-->
				<h5 class="c-hd">认领</h5>
				<!-- 认领列表 -->
				<div class="adopt-list"><!--visitor 表示别人访问-->
					<a class="adopt-item" href="javascript:void(0)">
						<img src="img/share/top.jpg" width="30" height="30"/>
						<button class="btn btn-danger">选择</button>
						<p><span>蔡总</span><small>三星三星三星三星三星三星三星三星三星三星三星三星三星三星三星三星三星</small></p>
					</a>
					<a class="adopt-item" href="javascript:void(0)">
						<img src="img/share/top.jpg" width="30" height="30"/>
						<button class="btn btn-danger">选择</button>
						<p><span>蔡总</span><small>三星三星三星三星三星三星三星三星三星三星三星三星三星三星三星三星三星</small></p>
					</a>
				</div>
				
				<!--comment heading-->
				<h5 class="c-hd">咨询</h5>
				<!-- 评论列表 -->
				<ul class="consult-list">
					<!-- 单个评论 -->
					<li class="consult-item clearfix">
						<!-- 头像 -->
						<img src="img/share/top.jpg"  width="30" height="30">
						<!-- 信息 内容 包含块 -->
						<div class="content">
							<!-- 评论人信息 -->
							<div class="ps-info clearfix">
								<!-- 评论，点赞按钮 -->
								<div class="act-wrap">
									<span class="com-btn consult-btns"></span>
									<!--点赞按钮-->
									<!--<span class="agree-btn consult-btns active"></span>-->
								</div>
								<!-- 用户名 -->
								<p class="name">15920123456用户</p>
								<!--评论时间 -->
								<p class="time">10分钟前</p>
							</div>
							<!-- 评论内容 -->
							<p class="main-content">
								向阳数码批发中心，陈先生，13578945613
							</p>
						</div>
						
						<!--咨询内评论-->
						<ul class="consult-list inner">
							<!-- 单个内评论 -->
							<li class="consult-item clearfix">
								<!-- 内评论头像 -->
								<img src="img/share/top.jpg"  width="30" height="30">
								<!-- 内评论 信息 内容 包含块 -->
								<div class="content">
									<!-- 内评论 评论人信息 -->
									<div class="ps-info clearfix">
										<!-- 内评论 用户名 -->
										<p class="name">回复： 15920123456用户</p>
										<!--内评论 评论时间 -->
										<p class="time">10分钟前</p>
									</div>
									<!-- 内评论 评论内容 -->
									<p class="main-content">
										我不需要了
									</p>
								</div>
								
							</li>
						</ul>
					</li>
					
				</ul>

			</div>
		<!-- 悬赏关系详情 end -->

		</div>
	</div>
</body>
</html>