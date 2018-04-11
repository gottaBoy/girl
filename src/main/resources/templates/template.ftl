<#macro tCargocnVue>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <title>货运中国网</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.5/lib/theme-chalk/index.css" />
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="http://cdn.bootcss.com/vue-resource/1.3.4/vue-resource.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-router/3.0.1/vue-router.min.js"></script>
    <script src="https://unpkg.com/element-ui@2.0.5/lib/index.js"></script>

    <style>
        #top {
            /*background:#20A0FF;*/
            background: #DCDFE6;
            padding:5px;
            overflow:hidden
        }
        .custom-tree-node {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 14px;
            padding-right: 8px;
        }
    </style>

</head>
<body>
<div id="main">
    <#nested>
</div>
</body>
</html>
</#macro>
<#macro btHtml>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <@btHeadBox /><#--head标签模块引入 -->
</head>
<!--
<body class="hold-transition skin-blue sidebar-mini  sidebar-collapse ajax-template fixed"> -->
<body class="hold-transition skin-blue sidebar-mini  sidebar-collapse fixed" style="overflow-y:hidden;">
<!-- wrapper start>
<div class="wrapper">
	<#--
	<div class="container-fluid content">
	  <div class="row">
	     <@btTopBox />
	     <div class="main ">
			<div class="easyui-layout" style="width:100%;height:100%;_height:400px;min-height:400px;">
		        <div data-options="region:'center'" style="width:100px;height:100%;">
		        	<div id="mmtabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true" >
			              <#nested>
					</div>
		        </div>
		    </div>
	     </div>
	   </div>
	</div>-->
    <@mainHeader /><#--mainHeader标签模块引入 -->
    <@mainSidebar /><#--mainSidebar标签模块引入 -->
	<@contentWrapper /><#--contentWrapper标签模块引入 -->
	<@mainFooter /><#--mainFooter标签模块引入 -->
</div>
<!--wrapper end-->
<div class="clearfix"></div>
<div id="mm" class="easyui-menu" style="width: 150px;">
    <div id="mm-tabupdate">
        刷新
    </div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">
        关闭
    </div>
    <div id="mm-tabcloseall">
        全部关闭
    </div>
    <div id="mm-tabcloseother">
        除此之外全部关闭
    </div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseright">
        当前页右侧全部关闭
    </div>
    <div id="mm-tabcloseleft">
        当前页左侧全部关闭
    </div>
    <div class="menu-sep"></div>
    <div id="mm-exit">
        退出
    </div>
</div>
</body>
</html>
</#macro>
<#macro mainHeader>
<!-- Main Header start-->
<header class="main-header">
    <!-- Logo -->
    <a href="javascript:void(0);" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>C</b>N</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Cargo</b>cn</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="javascript:void(0);" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
            <#--
              <@mainMessage/>
              <@mainNotification/>
              <@mainTask/>-->
                <@mainNotification/>
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <!--<img src="assets/build/img/avatar.png" class="user-image" alt="User Image">-->
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs"><#--<@shiro.principal />--></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <!-- <img src="assets/build/img/avatar.png" class="img-circle" alt="User Image">-->

                            <p>
                                <#--<@shiro.principal />-->
                                <#--<small>${LOGIN_COMPANY_NAME}-${LOGIN_USER_NAME}</small>-->
                                <!--加入时间2016-->
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <!--<li class="user-body">
                          <div class="row">
                            <div class="col-xs-4 text-center">
                              <a href="#">Followers</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="#">Sales</a>
                            </div>
                            <div class="col-xs-4 text-center">
                              <a href="#">Friends</a>
                            </div>
                          </div>
                        </li>-->
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <!--<div class="pull-left">
                              <a href="#" class="btn btn-default btn-flat">个人信息</a>
                            </div>-->
                            <div class="text-center">
                                <a href="${request.contextPath}/logout" class="btn btn-default btn-flat">登出</a>
                                <!--<a href="${request.contextPath}/logout"><i class="fa fa-power-off"></i> Logout</a>-->
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <!-- <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>-->
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- Main Header end -->
</#macro>
<#macro mainMessage>
<!-- Messages: style can be found in dropdown.less-->
<li class="dropdown messages-menu">
    <!-- Menu toggle button -->
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-envelope-o"></i>
        <span class="label label-success">4</span>
    </a>
    <ul class="dropdown-menu">
        <li class="header">您有 4 条信息</li>
        <li>
            <!-- inner menu: contains the messages -->
            <ul class="menu">
                <li><!-- start message -->
                    <a href="#">
                        <div class="pull-left">
                            <!-- User Image -->
                            <img src="/build/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <!-- Message title and timestamp -->
                        <h4>
                            支持团队
                            <small><i class="fa fa-clock-o"></i> 5 分钟</small>
                        </h4>
                        <!-- The message -->
                        <p>为什么不购买新的 awesome 主题?</p>
                    </a>
                </li>
                <!-- end message -->
            </ul>
            <!-- /.menu -->
        </li>
        <li class="footer"><a href="#">查看所有信息</a></li>
    </ul>
</li>
<!-- /.messages-menu -->
</#macro>
<#macro mainNotification>
<!-- Notifications Menu -->
<li class="dropdown notifications-menu noti-menu">
    <!-- Menu toggle button -->
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding: 18px;">
        <i class="fa fa-bell-o fa-lg"></i>
        <span class="label label-warning">0</span>
    </a>
    <ul class="dropdown-menu">
        <li class="header">您有 0 条公告</li>
        <li>
            <!-- Inner Menu: contains the notifications -->
            <ul class="menu">
            </ul>
        </li>
        <li>
            <a ref="ce-m002" href="javascript:void(0);" rel="/cargocn-cloud-messagecenter/message/loadWebList.do?receiverid"><span class="text nav_txt" style="display:none;">消息中心</span>
                查看更多>>
            </a>
        </li>
    </ul>
</li>
<!--embed autostart="true" loop="-1" controls="ControlPanel" width="0" height="0" id="bgsond"-->
</#macro>
<#macro mainTask>
<!-- Tasks Menu -->
<li class="dropdown tasks-menu">
    <!-- Menu Toggle Button -->
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-flag-o"></i>
        <span class="label label-danger">9</span>
    </a>
    <ul class="dropdown-menu">
        <li class="header">您有9项任务</li>
        <li>
            <!-- Inner menu: contains the tasks -->
            <ul class="menu">
                <li><!-- Task item -->
                    <a href="#">
                        <!-- Task title and progress text -->
                        <h3>
                            设计按钮
                            <small class="pull-right">20%</small>
                        </h3>
                        <!-- The progress bar -->
                        <div class="progress xs">
                            <!-- Change the css width attribute to simulate progress -->
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                <span class="sr-only">20% 完成</span>
                            </div>
                        </div>
                    </a>
                </li>
                <!-- end task item -->
            </ul>
        </li>
        <li class="footer">
            <a href="#">查看所有任务</a>
        </li>
    </ul>
</li>
</#macro>
<#macro mainSidebar>
<!-- main sidebar start -->
<div class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <!-- <img src="assets/build/img/avatar.png" class="img-circle" alt="User Image">-->
            </div>
            <div class="pull-left info">
            <#--<p><@shiro.principal /></p>
          <a href="javascript:void(0);"><i class="fa fa-circle text-success"></i> 在线</a>-->
            </div>
        </div>
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <!--<li class="header"><span>货运中国网</span></li>-->
            <!-- <li class="active"><a href="#"><i class="fa fa-link"></i> <span>主页</span></a></li> -->
        <#-- 菜单动态加载 -->
            <#include "/include/menu.ftl">
           <#-- <#if _session_login_user_cata?exists>
                <#assign LOGIN_USERCATA= _session_login_user_cata>
                <#if LOGIN_USERCATA == 0>
                    <#include "/include/menu_pl.ftl">
                <#elseif LOGIN_USERCATA == 1>
                    <#include "/include/menu_pl1.ftl">
                <#elseif LOGIN_USERCATA == 2>
                    <#include "/include/menu_pl2.ftl">
                <#elseif LOGIN_USERCATA == 3>
                    <#include "/include/menu_pl3.ftl">
                <#elseif LOGIN_USERCATA == 10 || LOGIN_USERCATA == 11 || LOGIN_USERCATA == 12 >
                    <#include "/include/menu_s.ftl">
                <#elseif LOGIN_USERCATA == 20 || LOGIN_USERCATA == 21 || LOGIN_USERCATA == 22 >
                    <#include "/include/menu_l.ftl">
                <#elseif LOGIN_USERCATA == 40 || LOGIN_USERCATA == 41 || LOGIN_USERCATA == 42 >
                    <#include "/include/menu_c.ftl">
                <#elseif LOGIN_USERCATA == 50 >
                    <#include "/include/menu_50.ftl">
                </#if>
            </#if>-->
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</div>
<!-- main sidebar start -->
</#macro>
<#macro contentWrapper>
<!--content wrapper start -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!--  <section class="content-header">
      <h1>
        主页
        <small>页面详情</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section> -->
    <div class="content-header-navtabs" style="display: none;">
        <div class="tabs-page">
            <ul class="tabs-list clearfix" id="navTabs1">
                <!--    <li class="active"><span>我的主页</span></li> -->
                <!--      <li class=""><span>我的主页1</span></li> -->
                <!--<li class=""><span>我的主页2</span></li> -->
            </ul>
            <a href="javascript:void(0);" class="prev fa fa-step-backward"></a>
            <a href="javascript:void(0);" class="next fa fa-step-forward"></a>
        </div>
    </div>
    <div class="top-notice"></div>

    <!-- Main content _height:500px;min-height:500px; -->
    <section class="content" id="content">
        <div class="easyui-layout" style="width:100%;height:100%;">
            <div data-options="region:'center'" style="width:100px;height:100%;">
                <div id="mmtabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true" >
                    <#nested>
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<!--content wrapper end -->
</#macro>
<#macro mainFooter>
<!-- Main Footer start -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        欢迎使用
    </div>
    <!-- Default to the left -->
    <strong>版本 &copy; 2015 货运中国网</strong>
</footer>
<!-- Main Footer end -->
</#macro>
<#macro btHeadBox>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="format-detection" content="telephone=no"/>
<meta content="物流,saas,平台,运输,货代" name="keywords">
<title>货运中国网</title>
<link rel="icon" href="images/favicon.png" type="image/x-icon">
<!-- Vendor CSS-->
<link href="${request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="${request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${request.contextPath}/build/css/AdminLTE.css">
<link rel="stylesheet" href="${request.contextPath}/build/css/skins/skin-blue.css">
<!-- Head Libs -->
<#--<script src="${request.contextPath}/assets/plugins/modernizr/js/modernizr.js"></script>-->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="${STATIC_LIBS}/html5shiv/3.7.0/html5shiv.js"></script>
<script src="${STATIC_LIBS}/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/panel.css">
<link rel="stylesheet" type="text/css" href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/bootstrap/layout.css">
<link rel="stylesheet" type="text/css" href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/bootstrap/tabs.css">
<link rel="stylesheet" type="text/css" href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/bootstrap/menu.css">
<link rel="stylesheet" href="${request.contextPath}/build/css/cg.css">
    <@btJSBox />
</#macro>

<#macro btJSBox>
<!-- start: JavaScript-->
<script src="${request.contextPath}/jquery/jquery.min.js"></script>
<script src="${request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${request.contextPath}/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${request.contextPath}/build/js/app.js"></script>
<script src="${STATIC_LIBS}/jquery-easyui/1.4.5/jquery.easyui.min.js"></script>
<!-- end: JavaScript-->
</#macro>