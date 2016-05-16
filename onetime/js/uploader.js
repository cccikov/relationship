/**
 * @class 文件上传
 * @description 文件上传
 */
function MobileUploadFile(obj) {
	var me = this;
	/**
	 * 网站根目录
	 * 
	 * @type string
	 * @attribute
	 */
	me.context = "";
	/**
	 * 添加上传组件的元素ID
	 * 
	 * @type string
	 * @attribute
	 */
	me.viewId = "";
	/**
	 * 显示文件ID
	 * 
	 * @type array
	 * @attribute
	 */
	me.showIds = [];
	/**
	 * 是否多选,true为多选，false为单选，默认为true。
	 * 
	 * @type boolean
	 * @attribute
	 */
	me.isMultiple = true;
	/**
	 * 允许上传的文件后缀名
	 * 
	 * @type array
	 * @attribute
	 */
	me.suffix = [ "jpg", "jpeg", "png", "gif", "bmp" ];
	/**
	 * 最大上传文件数
	 * 
	 * @type num
	 * @attribute
	 */
	me.maxNum = 9;
	/**
	 * 已经存在有的文件数
	 * 
	 * @type num
	 * @attribute
	 */
	me.existNum = $(".progressImg").size();
	/**
	 * 单个文件大小
	 * 
	 * @type num
	 * @attribute
	 */
	me.size = 5 * 1024 * 1024; // 单个文件大小
	/**
	 * 生成value为成功id的input隐藏域的name
	 * 
	 * @type string
	 * @attribute
	 */
	me.success_name = "";
	/**
	 * 生成value为删除id的input隐藏域的name
	 * 
	 * @type string
	 * @attribute
	 */
	me.delete_name = "";
	/**
	 * @description {fileList} 文件列表
	 * @field
	 */
	me.fileList = [];
	/**
	 * @description {progressList} 进度条列表，对应文件列表
	 * @field
	 */
	me.progressList = [];
	/**
	 * @description {boolean} 是否有文件上传
	 * @field
	 */
	me.uploading = false;
	/**
	 * @description {array} 记录修改文件被删除的id
	 * @field
	 */
	me.delIds = [];
	/**
	 * @description {array} 记录成功上传的id
	 * @field
	 */
	me.successIds = [];
	/**
	 * @description {object} 上传窗口上部对象
	 * @field
	 */
	me.upload_view = null;
	/**
	 * @description {object} 上传窗口input对象
	 * @field
	 */
	me.upload_btn = null;
	/**
	 * @description {object} 上传窗口文件信息对象
	 * @field
	 */
	me.uploadmsg_view = null;
	/**
	 * @description {object} 引用上传组件元素的对象
	 * @field
	 */
	me.viewDiv = null;

	me.progressTemplate = "<progress value='0' max='100'></progress>";
	// ;
	/**
	 * 在文件成功上传后调用此方法
	 * 
	 * @param {string}
	 *            成功上传后的id。
	 * @event
	 */
	me.uploadSuccess = function(id) {

	};
	/**
	 * 在文件上传失败后调用此方法,uploadMsg内包含一些文件信息，包括size,suffix,name,status.
	 * 
	 * @param {uploadMsg}
	 *            上传失败后的文件信息。
	 * @event
	 */
	me.uploadFail = function(file) {
	};
	/**
	 * 文件列表内文件全部上传完成后调用此方法
	 * 
	 * @param {array}
	 *            成功上传后所有成功上传的id。
	 * @event
	 */
	me.complete = function(ids) {
	};
	/**
	 * 开始上传时调用,uploadMsg内包含一些文件信息，包括size,suffix,name,status.
	 * 
	 * @param {uploadMsg}
	 *            开始上传时的文件信息
	 * @event
	 */
	me.startUpload = function(file) {
	};
	/**
	 * 删除成功时调用,uploadMsg内包含一些文件信息，包括size,suffix,name,status.
	 * 
	 * @param {uploadMsg}
	 *            删除成功时的文件信息
	 * @event
	 */
	me.delSuccess = function(file) {
	};
	/**
	 * 删除失败时调用.
	 * 
	 * @param {string}
	 *            删除失败时的文件id。
	 * @event
	 */
	me.delFail = function(id) {
	};
	/**
	 * 选中文件时调用
	 * 
	 * @param {file}
	 *            选中文件的文件信息
	 * @event
	 */
	me.selectFile = function(files) {
	};

	/**
	 * @description 返回所有成功上传的id。
	 * @return {string} array格式
	 */
	me.getSuccessIds = function() {
		return me.successIds;
	};
	/**
	 * @description 返回所有修改文件时删除的id。
	 * @return {string} array格式
	 */
	me.getDelIds = function() {
		return me.delIds;
	};
	/**
	 * @description 返回上传的文件列表。
	 * @return {string} json格式
	 */
	me.getList = function() {
		return me.fileList;
	};
	/**
	 * @description 返回当前对象是否有文件正在上传信息。
	 * @return {boolean} boolean.
	 */
	me.isUpload = function() {
		return me.uploading;
	};

	$.extend(me, obj); // 覆盖原有配置
	init(); // 调用init

	/**
	 * 配置完毕,初始化
	 */
	function init() {
		createView(me.viewId);
		if (me.showIds != null && me.showIds.length > 0) { // 根据配置id显示文件
			for (var i = 0; i < me.showIds.length; i++) {
				showFile(me.showIds[i]);
			}
		}
		me.upload_btn.on("change", handleDrag);
	}

	/**
	 * 创建上传窗口
	 */
	function createView(viewId) {
		var viewDiv = document.getElementById(viewId);
		var upload_btn;
		if (me.isMultiple) {
			upload_btn = $("<input class='upload_btn' type='file' style='display:none' multiple/>");
		} else {
			upload_btn = $("<input class='upload_btn' type='file' style='display:none' />");
		}
		$(viewDiv).prepend(upload_btn);
		me.viewDiv = $(viewDiv);
		me.upload_btn = upload_btn;
	}

	/**
	 * 根据配置的文件id显示文件
	 */
	function showFile(id) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(e) {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var file = eval("(" + xhr.responseText + ")");
					var $del_btn = $progressBar.children(".del_btn");
					var $successId = $("<input type='hidden'name='"
							+ me.success_name + "'/>");
					$successId.val(id);
					me.viewDiv.append($successId);
					viewFile(id);
					var uploadMsg = {
						name : file.fileName,
						status : "success",
						suffix : file.suffix,
						size : file.size,
					};
					var progressMsg = {
						uploadMsg : uploadMsg,
						progressBar : $progressBar,
						fileName : $fileName,
						del_btn : $del_btn,
					};
					me.fileList.push(uploadMsg);
					me.progressList.push(progressMsg);
					$del_btn.click(function() {
						me.delIds.push(id);
						progressMsg.progressBar.remove();
						progressMsg.del_btn.remove();
						uploadMsg.status = "deleted";
						$successId.attr("name", me.delete_name);
						$("#mark").hide();
						$del_btn.hide();
						var allNum = 0;
						for (var i = 0; i < me.fileList.length; i++) {
							if (me.fileList[i].status != "fail"
									&& me.fileList[i].status != "deleted") {
								allNum++;
							}
						}
						if (allNum + me.existNum < me.maxNum) {// 编辑，项目本身有图片了
							$("#imgDiv").show();
						}
					});
				} else {
					alert("加载失败");
				}
			}
		};
		xhr.open("post", me.context + "/filesystem/readFile.do?fileId=" + id,
				true);
		xhr.send();
	}

	/**
	 * 拖拽框的拖拽事件
	 */
	function handleDrag(e) {
		if (e.type == 'change') {
			me.handleFiles(e);
		}
		return false;
	}
	/**
	 * 处理选中的文件
	 */
	me.handleFiles = function(e) {
		var files = e.target.files || e.originalEvent.dataTransfer.files;
		if (!me.upload_btn.attr("multiple") && files.length > 1) {
			setTimeout(function() {
				alert("只能上传单个文件");
			}, 50);
			return;
		}

		files = filterFile(files);
		if (files != null && files.length > 0) {
			for (var i = 0, file; file = files[i]; i++) {
				fileListAdd(file);
			}
			if (!me.uploading) {
				me.uploading = true;
				checkUpload(me.fileList);
			}
		}
		$(me.upload_btn).val("");
	};

	/**
	 * 增加到文件列表
	 */
	function fileListAdd(file) {
		var $progressBar = $(me.progressTemplate);
		var $del_btn = $progressBar.children(".del_btn");
		// $progressBar.insertBefore(me.upload_btn);
		$progressBar.insertBefore("#imgDiv");
		var suffix = "";
		if (file.name.lastIndexOf(".") >= 0) {
			suffix = file.name.substr(file.name.lastIndexOf("."));
		}
		var uploadMsg = {
			name : file.name,
			status : "waiting",
			suffix : suffix,
			size : file.size,
		};
		var progressMsg = {
			uploadMsg : uploadMsg,
			file : file,
			progressBar : $progressBar,
			del_btn : $del_btn,
		};
		me.fileList.push(uploadMsg);
		me.progressList.push(progressMsg);
		$del_btn.click(function() {
			cancelFile(uploadMsg);
			$del_btn.hide();
		});
		var allNum = 0;
		for (var i = 0; i < me.fileList.length; i++) {
			if (me.fileList[i].status != "fail"
					&& me.fileList[i].status != "deleted") {
				allNum++;
			}
		}
		if ((allNum + me.existNum) == me.maxNum) {
			$("#imgDiv").hide();
		}
	}
	/**
	 * 上传文件
	 */
	function uploadFile(uploadMsg) {
		var progressMsg = null;
		$(me.progressList).each(function(index, eleDom) {
			if (eleDom.uploadMsg == uploadMsg) {
				progressMsg = eleDom;
			}
		});
		var xhr = new XMLHttpRequest();
		var upload = xhr.upload;
		var fileName = uploadMsg.name;
		fileName = encodeURIComponent(fileName);
		fileName = encodeURIComponent(fileName);
		progressMsg.del_btn.unbind("click").click(function() {
			xhr.abort();
			$del_btn.hide();
			progressMsg.del_btn.remove();
			progressMsg.progressBar.remove();
		});
		xhr.onreadystatechange = function(e) {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var fileId = xhr.responseText;
					if (fileId != null) {
						var $successId = $("<input type='hidden'name='"
								+ me.success_name + "'/>");
						$successId.val(fileId);
						me.viewDiv.append($successId);
						progressMsg.del_btn.unbind("click").click(
								function() {
									delFile(fileId, uploadMsg, progressMsg,
											$successId);
								});
						viewFile(fileId, progressMsg, 180, 180);
						uploadMsg.status = "success";
						me.successIds.push(fileId);

						try {
							me.uploadSuccess(fileId);
						} catch (e) {
						}
					}
					checkUpload(me.fileList);
				} else {
					progressMsg.progressBar.children(".progress").css({
						height : "0%"
					});
					progressMsg.del_btn
							.unbind("click")
							.click(
									function() {
										progressMsg.del_btn.remove();
										progressMsg.progressBar.remove();
										var allNum = 0;
										for (var i = 0; i < me.fileList.length; i++) {
											if (me.fileList[i].status != "fail"
													&& me.fileList[i].status != "deleted") {
												allNum++;
											}
										}
										if ((allNum + me.existNum) < me.maxNum) {
											$("#imgDiv").show();
										}
									});
					uploadMsg.status = "fail";
					try {
						me.uploadFail(uploadMsg);
					} catch (e) {
					}
					checkUpload(me.fileList);
				}
			}
		};
		xhr.open("post", me.context + "/filesystem/upload.do?fileName="
				+ fileName, true);
		xhr.send(progressMsg.file);
		// 上传进度条
		upload.onprogress = function(e) {
			uploadMsg.status = "uploading";
			if (e.lengthComputable) {
				var percentage = Math.round(e.loaded / e.total * 100);
				progressMsg.progressBar.children(".progress").css({
					height : percentage + "%"
				});
			}
		};
		// 上传完成
		upload.onload = function(e) {
			progressMsg.progressBar.children(".progress").css({
				"height" : "100%",
				"background-color" : "#FFFFFF"
			});
		};
		upload.onloadstart = function(e) {
			me.startUpload(uploadMsg);
		};
		// 上传出错
		upload.onerror = function(e) {
			progressMsg.progressBar.children(".progress").css({
				height : "0%"
			});
			status = "fail";
		};
		// 终止上传
		upload.onabort = function(e) {
			cancelFile(progressMsg, uploadMsg);
		};

	}
	/**
	 * 检查是否有文件需要上传
	 */
	function checkUpload(fileList) {
		var check = -1;
		for (var i = 0; i < fileList.length; i++) {
			if (fileList[i].status == "waiting") {
				check = i;
				break;
			} else if (i == fileList.length - 1) {
				me.uploading = false;
				me.complete(me.successIds);
			}
		}
		if (check >= 0) {
			uploadFile(fileList[check]);
		}
	}
	/**
	 * 取消
	 */
	function cancelFile(progressMsg, uploadMsg) {
		progressMsg.progressBar.remove();
		progressMsg.del_btn.remove();
		me.fileList.splice(me.fileList.indexOf(uploadMsg), 1);
		var allNum = 0;
		for (var i = 0; i < me.fileList.length; i++) {
			if (me.fileList[i].status != "fail"
					&& me.fileList[i].status != "deleted") {
				allNum++;
			}
		}
		if ((allNum + me.existNum) < me.maxNum) {
			$("#imgDiv").show();
		}
	}
	/**
	 * 删除
	 */
	function delFile(fileId, uploadMsg, progressMsg, $successId) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(e) {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					if (xhr.responseText == "") {
						uploadMsg.status = "deleted";
						me.successIds.splice(me.successIds.indexOf(fileId), 1);
						$successId.remove();
						progressMsg.progressBar.remove();
						progressMsg.del_btn.remove();
						me.delSuccess(uploadMsg);
						allNum--;
						if (allNum < 9) {// 编辑，项目本身有图片了
							$("#imgDiv").show();
						}
						initPhotoSwipeFromDOM('#uploadDiv .progressDiv');
					}
				} else {
					alert("删除失败");
					uploadMsg.status = "deletefail";
					me.delFail(fileId);
				}
			}
		};
		xhr.open("post", me.context + "/filesystem/deleteFile.do?fileId="
				+ fileId, true);
		xhr.send();
	}

	/**
	 * 自定义显示文件的方式
	 */
	function viewFile(fileId, progressMsg, width, height) {
		var sourceWidth = 0, sourceHeight = 0;
		var ww = 0, hh = 0;
		$.ajax({
			type : "POST",
			url : me.context + "/filesystem/readImgSize.do?id=" + fileId,
			dataType : "json",
			async : false,
			success : function(result) {
				if (result[0] != 0) {
					sourceWidth = result[0];
					sourceHeight = result[1];
				}
			}
		});
		var w = sourceWidth / 90;
		var h = sourceHeight / 90;
		if (w < h) {
			ww = parseInt(sourceWidth / w);
			hh = parseInt(sourceHeight / w);
		} else {
			ww = parseInt(sourceWidth / h);
			hh = parseInt(sourceHeight / h);
		}
		if (progressMsg != null) {
			progressMsg.progressBar.find(".progressImg").attr(
					"src",
					me.context + "/filesystem/view/" + ww + "/" + hh + "/"
							+ fileId + ".do").attr("img-width", sourceWidth)
					.attr("img-height", sourceHeight).attr("fileId", fileId);

		} else {

		}
	}
	/**
	 * 图片居中显示
	 */
	function viewFileCenter(progressMsg, fileId) {
		var heightImg = progressMsg.progressBar.find(".progressImg").height();// 原图的高
		var widthImg = progressMsg.progressBar.find(".progressImg").width();// 原图的宽
		var heightBar = progressMsg.progressBar.height();
		var widthBar = progressMsg.progressBar.width();
		if (heightImg < heightBar) {
			progressMsg.progressBar.find(".progressImg").css("top",
					(heightBar / 2 - heightImg / 2));
		} else {
			progressMsg.progressBar.find(".progressImg").css("max-height",
					"90px");
		}
		if (widthImg < widthBar) {
			progressMsg.progressBar.find(".progressImg").css("left",
					(widthBar / 2 - widthImg / 2));
		} else {
			progressMsg.progressBar.find(".progressImg").css("max-width",
					"90px");
		}
	}

};