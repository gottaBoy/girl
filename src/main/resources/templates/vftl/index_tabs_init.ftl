<script type="text/javascript">
	$(function() {
		InitLeftMenu();
		tabClose();
		tabCloseEven();
//		setMessage();

		//$('<audio id="chatAudio"><source src="http://localhost:8080/cargocn-cloud-server/static/8238.mp3" type="audio/mpeg"></audio>').appendTo('body');//载入声音文件 
	});

	function InitLeftMenu() {
		//所有菜单链接
		//$('.nav-second-level li a').click(function(){	
		$('.treeview-menu li a,li.treeview > a').click(function() {
			//判断是否还有下级
			if(!$(this).next()[0]) {
				var tabTitle = $(this).children('.nav_txt').text();

				var url = $(this).attr("rel");
				var menuid = $(this).attr("ref");

				var options = {
					"id": menuid,
					"url": url,
					"title": tabTitle,
					"close": true,
					"content": ""
				};
				addTab(options);
				//addTab(tabTitle,url,'icon-edit',menuid); 

			}
		});
	}

	function InitLinkMenu() {
		//所有菜单链接
		$('.noti-menu ul li a').click(function() {
			var tabTitle = $(this).children('.nav_txt').text();

			var url = $(this).attr("rel");
			var menuid = $(this).attr("ref");

			var options = {
				"id": menuid,
				"url": url,
				"title": tabTitle,
				"close": true,
				"content": ""
			};
			addTab(options);
		});
	}
	//function addTab(subtitle,url,icon,menuid){
	function addTab(ops) {
		var subtitle, url, icon, menuid;
		subtitle = ops.title;
		url = ops.url;
		icon = ops.icon;
		menuid = ops.id;

		if(!$('#mmtabs').tabs('exists', subtitle)) {
			$('#mmtabs').tabs('add', {});
			// tab刷新内容 fix 自适应高度
			var tab = $('#mmtabs').tabs('getSelected');
			$("#mmtabs").tabs('update', {
				tab: tab,
				options: {
					title: subtitle,
					content: createFrame(url, menuid),
					//iconCls: icon,
					closable: true,
					selected: true
				}
			});
		} else {
			//$('#mmtabs').tabs('select', subtitle);
			//$('#mm-tabupdate').click();
			closeTab(subtitle);
			$('#mmtabs').tabs('add', {});
			var tab = $('#mmtabs').tabs('getSelected');
			$("#mmtabs").tabs('update', {
				tab: tab,
				options: {
					title: subtitle,
					content: createFrame(url, menuid),
					//iconCls: icon,
					closable: true,
					selected: true
				}
			});
		}
		tabClose();
	}

	function closeReflashTab(subtitle1, subtitle2) {
		closeTab(subtitle1);
		if($('#mmtabs').tabs('exists', subtitle2)){
		   reflashTab(subtitle2);
		}
	}

	function reflashTab(subtitle) {
		$('#mmtabs').tabs('select', subtitle);
		var currTab = $('#mmtabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		var iframeId = $(currTab.panel('options').content).attr('id');
		$('#mmtabs').tabs('update', {
			tab: currTab,
			options: {
				content: createFrame(url, iframeId)
			}
		});
	}

	function closeTab(subtitle) {
		$('#mmtabs').tabs('close', subtitle);
	}
	
	//多个不同入口进入同一个页面，需要关闭的问题
	function closeCurrentTab(subtitle) {
	    
	    if($('#mmtabs').tabs('exists', subtitle)){
	       $('#mmtabs').tabs('close', subtitle);
	    }else{
	        var currTitle = $('#mmtabs').tabs('getSelected').panel('options').title;
	        $('#mmtabs').tabs('close', currTitle);
	    }
	}
    
    //多个不同入口进入同一个页面，需要关闭并刷新列表的问题
	function closeCurrentRefTab(subtitle,subtitle2) {
	    closeCurrentTab(subtitle);
	    if($('#mmtabs').tabs('exists', subtitle2)){
		   reflashTab(subtitle2);
		}
	}
	//更新当前页面
	function goBackThisTab(ops) {
		var currTab = $('#mmtabs').tabs('getSelected');
		$('#mmtabs').tabs('update', {
			tab: currTab,
			options: {
				title: ops.title,
				content: createFrame(ops.url, ops.id)
			}
		});
	}
	//跳转到另外一个页面
	function goBackAnotherTab(currentTitle, ops) {
		//关闭当前页面
		closeTab(currentTitle);
		//进入到新的页面
		addTab(ops);
	}

	function createFrame(url, menuid) {
		var s = '<iframe id="' + menuid + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>';
		return s;
	}
	/**function iFrameHeight(iframeid) {
		var ifm = document.getElementById(iframeid); 
		var subWeb ; 
		if (document.frames) {
			if (document.frames[iframeid]) {
				subWeb = document.frames[iframeid].document;
			} else if (ifm != null){
				subWeb = ifm.document;
			}
		} else {
			subWeb = ifm.contentDocument;
		}  
		if(ifm != null && subWeb != null) {  
			if (subWeb.body)
			ifm.height = subWeb.body.scrollHeight + 40;  
		} 
	} **/
	function tabClose() {
		/*双击关闭TAB选项卡*/
		$(".tabs-inner").dblclick(function() {
			var subtitle = $(this).children(".tabs-closable").text();
			$('#mmtabs').tabs('close', subtitle);
		})
		/*为选项卡绑定右键*/
		$(".tabs-inner").bind('contextmenu', function(e) {
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});

			var subtitle = $(this).children(".tabs-closable").text();

			$('#mm').data("currtab", subtitle);
			$('#mmtabs').tabs('select', subtitle);
			return false;
		});
	}
	//绑定右键菜单事件
	function tabCloseEven() {
		//刷新
		$('#mm-tabupdate').click(function() {
			var currTab = $('#mmtabs').tabs('getSelected');
			var url = $(currTab.panel('options').content).attr('src');
			var iframeId = $(currTab.panel('options').content).attr('id');
			$('#mmtabs').tabs('update', {
				tab: currTab,
				options: {
					content: createFrame(url, iframeId)
				}
			})
		})
		//关闭当前
		$('#mm-tabclose').click(function() {
			var currtab_title = $('#mm').data("currtab");
			$('#mmtabs').tabs('close', currtab_title);
		})
		//全部关闭
		$('#mm-tabcloseall').click(function() {
			$('.tabs-inner span').each(function(i, n) {
				var t = $(n).text();
				$('#mmtabs').tabs('close', t);
			});
		});
		//关闭除当前之外的TAB
		$('#mm-tabcloseother').click(function() {
			$('#mm-tabcloseright').click();
			$('#mm-tabcloseleft').click();
		});
		//关闭当前右侧的TAB
		$('#mm-tabcloseright').click(function() {
			var nextall = $('.tabs-selected').nextAll();
			if(nextall.length == 0) {
				alert('后边没有啦~~');
				return false;
			}
			nextall.each(function(i, n) {
				var t = $('a:eq(0) span', $(n)).text();
				$('#mmtabs').tabs('close', t);
			});
			return false;
		});
		//关闭当前左侧的TAB
		$('#mm-tabcloseleft').click(function() {
			var prevall = $('.tabs-selected').prevAll();
			if(prevall.length == 0) {
				alert('到头了，前边没有啦~~');
				return false;
			}
			prevall.each(function(i, n) {
				var t = $('a:eq(0) span', $(n)).text();
				$('#mmtabs').tabs('close', t);
			});
			return false;
		});

		//退出
		$("#mm-exit").click(function() {
			$('#mm').menu('hide');
		})
	}

	/*function setMessage() {
		var userid = 1; <#-- ${LOGIN_USER_ID}; -->

		var rootPath=window.location.protocol + '//' + window.location.host;

		var url = 'ws://'+rootPath.substring(7,rootPath.length)+'/cargocn-cloud-messagecenter/messageWS/' + userid;
		var websocket = new WebSocket(url);
		websocket.onopen = function(evt) {
			onOpen(evt)
		};
		websocket.onclose = function(evt) {
			onClose(evt)
		};
		websocket.onmessage = function(evt) {
			onMessage(evt)
		};
		websocket.onerror = function(evt) {
			onError(evt)
		};

		function onOpen(evt) {
			console.log("Connected to WebSocket server.");
			$.ajax({
				type: "GET",
				url: "/cargocn-cloud-messagecenter/message/loadWSList.do?userid=" + userid,
				success: function(data) {
					if(data.code == '100') {}
				},
				error: function() {
					console.log("请求出错处理");
				}
			});
		}

		function onClose(evt) {
			console.log("Disconnected");
		}

		function onMessage(evt) {
			console.log('Retrieved data from server: ');
			var message = evt.data;
			if(message != "") {
				var array = JSON.parse(message);

				var result = "";
				$.each(array, function(i, item) {
					result += '<li>';
					result += '<a ref="ce-m001" href="javascript:void(0);" rel="/cargocn-cloud-messagecenter/message/loadWeb.do?id=' + item.id + '"><span class="text nav_txt" style="display:none;">消息详情</span>';
					result += '<span class="news"><i class="fa fa-check-square text-aqua"></i>' + item.msgtitle + '</span> <span class="time">' + new Date(item.receivetime).toLocaleDateString() + '</span>';
					result += '</a>';
					result += '</li>';

					if(i > 4)
						return false;
				});
				$(".notifications-menu .menu").html(result);

				if(array.length > 99) {
					$(".notifications-menu .label-warning").html("99+");
				} else {
					$(".notifications-menu .label-warning").html(array.length);
				}
				$(".notifications-menu .header").html("您有 " + array.length + " 条未处理消息");
			}
			InitLinkMenu();

			// $('#chatAudio')[0].play(); //播放声音 
			//$("#bgsond").attr("src","http://localhost:8080/cargocn-cloud-server/static/8238.mp3")

			//$("#bgsond").play();
		}

		function onError(evt) {
			console.log('Error occured: ' + evt.data);
		}
	}*/
</script>