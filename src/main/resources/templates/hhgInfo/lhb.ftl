<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>黄骅港</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">		
		<meta name="viewport" content="width=device-width,user1-scalable=no,initial-scale=1,maximum-scale=1,minimum-scale=1">
		<!--在iPhone 手机上禁止了把数字转化为拨号链接-->
	    <meta content="telephone=no" name="format-detection" />
	    <!--删除默认的苹果工具栏和菜单栏-->
	    <meta content="yes" name="apple-mobile-web-app-capable">
	    <!-- 网站开启对web app程序的支持，在web app应用下状态条（屏幕顶部条）的颜色，默认值为default（白色），可以定为black（黑色）和black-translucent（灰色半透明）-->
   		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="${request.contextPath}/css/demo.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/sweet-alert.css">
		<style type="text/css">
			body {
				margin: 0;
				padding: 0;
				position: relative;
				background-position: center;
				width: 100%;
				height: 100%;
				overflow-y: hidden;
				background:url(${request.contextPath}/image/bj.jpg) no-repeat top left ;
				background-size:  100%;
			}
			.couten {
				width: 100%;
				height: 100%;
				overflow: hidden;
				overflow-y: hidden;
			}
			.couten li {
				position: absolute;
				animation: all 3s linear;
				top:-100px;
				-webkit-tap-highlight-color:  rgba(0, 0, 0, 0);
			}
			.couten li a{
				display: block;
			}
			.mo {
				position: absolute;
				top: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, .2);
				z-index: 100;
				display: none;
			}
			.mo .sen {
				width:100%;
				/*width: 70%;
				height: 150px;
				border-radius: 5px;*/
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				margin: auto;
			}
			.mo .sen .img {
			    width: 60%;
			    height: 127px;
			    position: absolute;
			    top: 0px;
			    left: 0;
			    right: 0;
			    bottom: 212px;
			    margin: auto;
			    vertical-align: top;
			}
			.mo .sen h3 {
			    width: 50%;
			    height: 30px;
			    position: absolute;
			    top: -35px;
			    left: 0;
			    right: 0;
			    bottom: 0;
			    margin: auto;
			    text-align: center;
			    color: red;
			    font-size: 140%;
			    font-weight: bold;
			    z-index: 999;
			}
			
			.mo .sen a {
			    width: 26%;
			    height: 50px;
			    background-color: rgb(174, 222, 244);
			    box-shadow: rgba(174, 222, 244, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.0470588) 0px 0px 0px 1px inset;
			    position: absolute;
			    top: 100px;
			    left: 0;
			    right: 0;
			    bottom: 0;
			    margin: auto;
			    color: #fff;
			    border-radius: 5px;
			    text-align: center;
			    line-height: 50px;
			    text-decoration: none;
			}
			.backward{
				width: 100%;
				background:#ccc;
				opacity: 0.5;
				position: absolute;
				top: 0;
				
			}
			.backward span{
				display: inline-block;
				width: 100px;
				height: 100px;
				color: #000;
				font-weight: bold;
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				margin: auto;
				text-align: center;
				line-height: 100px;
				font-size: 1000%;
			}
			.tips{
				display: none;
			}
		</style>
		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var win = (parseInt($(".couten").css("width"))) - 60;
				$(".mo").css("height", $(document).height());
				$(".couten").css("height", $(document).height());
				$(".backward").css("height", $(document).height());
            })
		</script>

	</head>
	<body>
		<ul class="couten">
			<!--<li>
				<a href="#"><img src="${request.contextPath}/image/hb_1.png"></a>
			</li>-->
		</ul>
		<div class="mo" style="display:block;">
			<div class="sen">
				<!--<img src="${request.contextPath}/image/gx.png">-->
			  <!--<div style="width: 288px;height: 512px;position: absolute;">-->
			  <div>
		         <image id="qhb" src="${request.contextPath}/image/lhb.png" style="width:100%;height:100%;"/>
		      </div>
			</div>
		</div>
		<div class="backward">
			<span></span>
		</div>	
        <div style="text-align:center;">
        </div>		
	</body>
</html>