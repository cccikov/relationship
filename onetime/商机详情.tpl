<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>商机详情页</title>
		<link rel="stylesheet" href="${contextPath}/css/base.css" />
		<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/web/commonPc.css" />
		<script src="${contextPath}/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/web/commonPc.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			p{
				margin:0;
			}
			#main {
				padding:0 0 40px;
				margin: 10px 10px 0;
			}
			.state{
				margin:0 0 20px 0;
			}
			.state .label{
				float: right;
				margin:0 20px 0 0;
				font-size: 16px;
			}
			
			.bus-connect{
				position: relative;
				height: 350px;
			}
			.bus-connect .panel{
				position: absolute;
				width: 45%;
			}
			/*关系拥有者*/
			.contact{
				top:0;
				left:10px;
			}
			.contact.panel-default{
				border-color: #5BC0DE;
			}

			/*供应商*/
			.supplier{
				top:0;
				right:10px;
			}
			.supplier.panel-default{
				border-color:#D9534F;
			}

			/*关系资源*/
			.resource{
				top:150px;
				left:10px;
			}
			.resource.panel-default{
				border-color:#337AB7;
			}
			.top img{
				float: left;
				margin:0 10px 0 0;
			}
			.top h4{
				float: left;
			}
			h4 .label{
				margin:0 0 0 10px;
			}
			.name,.phone{
				margin:5px 0 0 0;
			}

			/*悬赏发起人信息*/
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
				text-indent: 2em;
			}
			.bottom .label{
				float: left;
				margin-right:10px;
			}
			.bottom span:not(.label){
				font-size: 14px;
				color:#999;
			}
			.bottom .adopt-man{
				margin:0 10px 0 0;
			}
			.bottom .check-time{
				float: right;
			}
			
			/*反馈列表*/ 
			.feedback-top img{
				float: left;
				padding:0 10px 10px 0;
			}
			.feedback-top>div{
				position: relative;
				overflow: hidden;
			}
			.feedback-top small{
				position: absolute;
				top:0;
				right:0;
				color:#999;
			}
			
			/*跟踪列表*/
			.track h5{
				margin:0 0 10px;
			}
			#addTrack{
				width: 100px;
			}
			.track-content{
				margin:0 0 10px;
				max-height: 2.85714286em;
				text-indent:2em;
				overflow: hidden;
			}
			.track .left{
				display: table-cell;
				width: 100000px;
			}
			.track .right{
				display: table-cell;
				padding:0 0 0 20px;
				vertical-align: middle;
			}
			.track-attach{
				padding:10px 0;
				border: 1px solid #eee;
				border-radius: 8px;
			}
			.wechat-show{
				display: none;
				margin:0 0 0 5px;
			}
			.wechat-show.active{
				display: inline;
			}
			.opera-man,.create-time,.edit-time{
				float: left;
				width: 33.333333333%;
				text-align: center;
			}
			.opera-man,.create-time{
				border-right: 1px solid #eee;
			}
			.opera-man:before{
				content:"操作人：";
			}
			.create-time:before{
				content:"创建时间：";
			}
			.edit-time:before{
				content:"修改时间：";
			}
			.top .time {
			    margin-left: 35px;
				color: #ccc;
			}
			
			/*模拟*/
			#prompt .left{
				float: left;
				width: 50%;
				border-right: 1px solid #ccc;
			}
			#prompt .right{
				float: right;
				width: 50%;
			}
		</style>
		<script type="text/javascript">
			var opportunityId = "${opportunity.fid}";
			$(function(){
				//添加跟踪记录
				$("#addTrack").on("click",function(){
					promptShow({
						type:"add"
					});
				});
				//修改跟踪
				$(".track-item").on("click",function(){
					var that = $(this);
					promptShow({
						type:"check",
						obj:that
					});
				});
				//删除跟踪
				$(".del").on("click",function(e){
					e.stopPropagation();
					alert("del ajax");
					//success
					$(this).parents(".list-group-item").remove();
				});
			});
		
			
			//type-add,check;
			function promptShow(argu){
				reset();//恢复默认
				var titleInput = $("#p-title");
				var contentInput = $("#p-content");
				var checkInput = $("#p-show");
				$('#prompt').modal('show');
				if(argu.type=="check"){
					$("#save").hide();
					var obj = argu.obj;
					titleInput.val(obj.find(".track-title").text()).attr("readonly",true);
					contentInput.val(obj.find(".track-content").text()).attr("readonly",true);;
					$("#p-opera").html("操作人："+obj.find(".opera-man").text());
					$("#p-create").html("创建时间："+obj.find(".create-time").text());
					$("#p-edit").html("修改时间："+obj.find(".edit-time").text());
					var showCheck = obj.find(".wechat-show").attr("class").indexOf("active")!=-1;
					checkInput.attr({
						"disabled":true,
						"checked":showCheck
					});
					$("#trackingId").val(obj.attr("fid"));
				}else if(argu.type=="add"){
					$("#edit").hide();
					$(".track-info").hide();
				}

				// 点击编辑按钮
				$("#edit").off("click").on("click",function(){
					titleInput.add(contentInput).attr("readonly",false);
					checkInput.attr("disabled",false);
					$(this).hide().siblings("#save").show();
				});

				// 点击保存按钮
				$("#save").off("click").on("click",function(){
					var title = titleInput.val().trim();
					var content = contentInput.val().trim();
					var trackingId = $("#trackingId").val().trim();
					var rewardId = $("#rewardId").val().trim();
					if( title == ""){
						titleInput.focus();
						return;
					}else if(content == ""){
						contentInput.focus();
						return;
					}
					$.ajax({
						url: "${contextPath}/web/reward/saveTracking.do",
						data:{title:title,content:content,trackingId:trackingId,rewardId:rewardId},
						dataType:"json",
						type: "post",
						success:function(data){
							if(data.success){ 
								$('#prompt').modal('hide');
								location.reload();
							}else{
								alert(data.msg);
							}
						}
					});
				});
			}
			function reset(){
				$("#save").show();
				$("#edit").show();
				$(".track-info").show();
				$("#p-title").val("").attr("readonly",false);
				$("#p-content").val("").attr({"readonly":false});
				$("#p-show").attr({
					"readonly":false,
					"checked":false
				});
			}
		</script>
	</head>

	<body>
		<div id="thirdWrap">
			<!--导航-->
			<div id="nav">
				<ol class="breadcrumb">
					<li><a href="${contextPath}/web/opportunity/index.do">商机管理</a></li>
					<li class="active">商机详情</li>
				</ol>
			</div>

			<!--主要-->
			<div class="clearfix" id="main">

				<div class="state clearfix">
					<span class="label <#if opportunity.state=="失败">label-warning <#elseif opportunity.state=="待确认">label-primary<#elseif opportunity.state=="成交">label-success<#else>label-default</#if>">${opportunity.state}</span>
				</div>

			<!-- 三角关系包含块begin -->
				<div class="bus-connect">
					
					<!-- 关系资源 -->
					<#if opportunity.contactResource??>
					<div class="panel panel-default resource">
						<div class="panel-body">
							<div class="top clearfix">
								<h4 class="company-name">${opportunity.contactResource.businessName}<span class="label label-primary">关系资源</span></h4>
							</div>
							<div class="name">
								姓名：${opportunity.contactResource.name}(${opportunity.contactResource.position})
							</div>
							<div class="phone">
								手机：${opportunity.contactResource.mobile}
							</div>
						</div>
					</div>
					</#if>
					
					<!-- 关系拥有者 -->
					<div class="panel panel-default contact">
						<div class="panel-body">
							<div class="top clearfix">
								<h4 class="company-name">${opportunity.contact.businessName}<span class="label label-info">关系拥有者</span></h4>
							</div>
							<div class="name">
								姓名：${opportunity.contact.linkmanName}
							</div>
							<div class="phone">
								手机：${opportunity.contact.linkmanMobile}
							</div>
						</div>
					</div>
					
					<!-- 供应商 -->
					<div class="panel panel-default supplier">
						<div class="panel-body">
							<div class="top clearfix">
								<#if opportunity.supplier?? && opportunity.supplier.icon??>
								<img class="logo" src="${contextPath}/filesystem/view/${opportunity.supplier.icon}.do" height="40" alt="" />
								<#elseif opportunity.targetContact?? && opportunity.targetContact.headImg??>
								<img class="logo" src="${contextPath}/filesystem/view/${opportunity.targetContact.headImg}.do" height="40" alt="" />
								<#else>
								<img class="logo" src="${contextPath}/img/logo.png" height="40" alt="" />
								</#if>
								<h4 class="company-name">${opportunity.targetContact.businessName}<span class="label label-danger">供应商</span></h4>
							</div>
							<div class="name">
								姓名：${opportunity.targetContact.linkmanName}
							</div>
							<div class="phone">
								手机：${opportunity.targetContact.linkmanMobile}
							</div>
						</div>
					</div>
					
				</div>
			<!-- 三角关系包含块end -->

				<!-- 操作 -->
				<div class="opera-wrap">
					<label><input type="checkbox" name="">是否已交付佣金</label>
					<label for="state">状态：</label>
					<select id="state">
						<optgroup label="状态">
							<option value="wait">待确认</option>
							<option value="pass">成交</option>
							<option value="fall">失败</option>
							<option value="cancel">取消</option>
						</optgroup>
					</select>
					<div>
						<span>约定佣金</span>
						<span>￥100</span>
					</div>
					<div>
						<span>管理方式</span>
						<span>委托平台代为管理/自己管理</span>
					</div>
				</div>

				<!--悬赏-->
				<h4><strong>悬赏详情</strong></h4>
				<div class="files panel panel-default">
					<div class="panel-body">
						<div class="top clearfix">
							<div class="top-left">
								<img class="headImg" <#if reward.headImg??>src="${contextPath}/filesystem/view/${reward.headImg}.do"<#else>src="${contextPath}/img/share/top.jpg"</#if> width="40" height="40" /><!-- 头像 -->
							</div>
							<div class="top-right">
								<span class="businessText">${reward.businessName}</span><br><!-- 公司名 -->
								<span class="nameText">${reward.name}</span><!-- 姓名 -->
								<span class="mobileText">（${reward.mobile}）</span><!-- 手机号码 -->
								<span class="time">有效时间至：${reward.validityTime}</span>
							</div>
							
						</div>
						<p class="middle contentText"><!-- 内容 -->
							<strong>悬赏内容：</strong>${reward.content}
						</p>
						<p class="middle contentText"><!-- 奖励金额 -->
							<strong>奖励金额：</strong>${reward.money}元
						</p>
						<p class="middle contentText"><!-- 奖励说明 -->
							<strong>奖励说明：</strong>${reward.award}
						</p>
						<div class="bottom clearfix">
							<span class="label <#if reward.state == "已确认">label-success<#elseif reward.state=="需重审">label-danger<#elseif reward.state=="待审">label-warning<#else>label-primary</#if>">${reward.state}</span>
							<!-- <span class="label label-primary">悬赏中</span> -->
							<!--<span class="label label-warning">已过期</span>-->
							<span class="adopt-man">认领人：ccc</span>
							<span>审核人：${reward.user.name}</span>
							<span>审核时间：${reward.verifyTime}</span>
						</div>
					</div>
				</div>

				<script type="text/javascript">
					$(function(){
						$(".nav-tabs li").on("click",function(){
							var _index = $(this).index();
							$(".tab-pane").eq(_index).addClass("active").siblings().removeClass("active");
						});
					});
				</script>
				<style type="text/css">
					.tab-pane{
						padding:10px;
						border: 1px solid #ddd;
						border-top: none;
					}
				</style>


				<div class="attach">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">反馈列表</a></li>
						<li role="presentation" class=""><a href="#home" aria-controls="home" role="tab" data-toggle="tab">跟踪记录</a></li>
						<li role="presentation" class=""><a href="#home" aria-controls="home" role="tab" data-toggle="tab">交易记录</a></li>
					</ul>

					 <div class="tab-content">

				    	<!-- 反馈列表 -->
					    <div role="tabpanel" class="tab-pane active">
					    	<ul class="list-group">
					    		<li class="list-group-item">
					    			<div class="feedback-top clearfix">
					    				<img src="${contextPath}/img/share/top.jpg" alt="" width="40" height="40"/>
					    				<div>
					    					<strong>曹艳芬</strong>
					    					<span>1354984678646</span>
					    					<small>2016/06/06 09:15</small>
					    					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint maxime laboriosam quae adipisci impedit dicta esse illum atque nostrum explicabo ipsam officiis ad commodi mollitia quod quaerat voluptas a molestiae.</p>
					    				</div>
					    			</div>
					    		</li>
					    	</ul>
					    </div>

					    <!-- 跟踪记录 -->
					    <div role="tabpanel" class="tab-pane">
					    	<div class="list-group track">
					    		<a class="list-group-item track-item" fid="${tracking.fid}" href="javascript:void(0)">
					    			<div class="left">
					    				<h5><strong class="track-title">标题</strong><span class="label label-success wechat-show active">微信显示</span></h5><!-- 标题 -->
					    				<p class="track-content">内容</p><!-- 内容 -->
					    				<div class="track-attach clearfix">
					    					<span class="opera-man">ccc</span><!-- 操作人(隐藏)-->
					    					<span class="create-time">2016/06/05 15:55 </span><!-- 创建时间 (隐藏)-->
					    					<span class="edit-time">2016/06/05 15:55 </span><!-- 修改时间 (隐藏)-->
					    				</div>
					    			</div>
					    			<div class="right">
					    				<button class="btn btn-danger del" fid="${tracking.fid}">删除</button>
					    			</div>	
					    		</a>
					    		<a class="list-group-item text-center">
					    			<!--添加跟踪按钮-->
					    			<button class="btn btn-primary" id="addTrack">＋</button>
					    		</a>
					    	</div>
					    </div>

					    <!-- 交易记录 -->
					    <div role="tabpanel" class="tab-pane">
					    	<p>交易记录</p>
					    </div>
					
				</div>

				

				<!-- 模拟prompt -->
				<div class="modal fade" id="prompt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">跟踪记录</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>题目：</label>
									<input class="form-control" type="text" id="p-title">
								</div>
								<div class="form-group">
									<label>内容：</label>
									<textarea class="form-control" rows="4" id="p-content"></textarea>
								</div>
								<div class="checkbox">
							        <label>
							            <input id="p-show" type="checkbox"> 显示在微信
							        </label>
							    </div>
								<ul class="list-group track-info text-center">
									<li class="list-group-item" id="p-opera">操作人：ccc</li>		
									<li class="list-group-item clearfix"> 
										<div class="left" id="p-create">创建时间：2016-05-18 15：50</div>
										<div class="right" id="p-edit">修改时间：2016-05-18 15：50</div>
									</li>
								</ul>
							</div>
							<input type="hidden" id="rewardId" value="${reward.fid}"/>
							<input type="hidden" id="trackingId" value=""/>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button class="btn btn-info" id="edit">编辑</button>
								<button type="button" class="btn btn-primary" id="save">保存</button>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</body>

</html>