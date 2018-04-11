<#include "/constants.ftl">
<#macro tHtml>
<!DOCTYPE html>
<html lang="zh-CN"> 
<head> 
	<@tHeadBox /><#--head标签模块引入 -->
    <@tJSBox /><#--js标签模块引入 -->
</head>
<body style="background:#f8f8f8;"> 
    <div class="main" style="padding:0 15px;margin:20px 0 80px;">
        <#nested>
    </div>
	
</body>
</html> 
</#macro> 

<#macro tHtml1>
<!DOCTYPE html>
<html lang="zh-CN"> 
<head> 
	<@tHeadBox /><#--head标签模块引入 -->
</head>
<body>  
	
     <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                  <a class="navbar-brand" href="#"><img src="static/images/logo.png" width="128px;"></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                 
                  
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user1 fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user1">
                         
                        <li><a href="${request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user1 -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->  
            
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">  
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 系统设置<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level"> 
                        		<li>
                                    <a href="${request.contextPath}/statement">组织结构管理</a>
                                </li>  
                            </ul>
                            <!-- /.nav-second-level -->
                        </li> 
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->    
        </nav>

        <!-- Page Content --> 
        <#nested>
              

    </div>
    <!-- /#wrapper --> 
	<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<@tJSBox /><#--js标签模块引入 -->
	
</body>
</html> 
</#macro> 

<#-- 菜单工具 -->
<#macro tTopBox>
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
      <a class="navbar-brand" href="index.html"><img src="${request.contextPath}/static/images/logo.png" width="128px;"></a>
</div>
<!-- /.navbar-header -->

<ul class="nav navbar-top-links navbar-right">
     
      
    <!-- /.dropdown -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-user1 fa-fw"></i>  <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user1">
             
            <li><a href="${request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
            </li>
        </ul>
        <!-- /.dropdown-user1 -->
    </li>
    <!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->     
</#macro>  

<#-- 首页顶部Head栏模块 --> 
<#macro tHeadBox>
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="format-detection" content="telephone=no"/>
    <meta content="物流,saas,平台,运输,货代" name="keywords">
    <title>货运中国网</title>
    <link rel="icon" href="${request.contextPath}/static/images/favicon.png" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <#--<link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="${STATIC_LIBS}/bootstrap/3.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- EasyUI CSS -->
    <#--<link href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/icon.css" rel="stylesheet" type="text/css">-->
    <link href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/default/easyui.css" rel="stylesheet" type="text/css">
    <link href="${request.contextPath}/static/css/simplepop.css" rel="stylesheet" type="text/css">
    <!-- MetisMenu CSS -->
   <#-- <link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="${STATIC_LIBS}/fancyapps-fancyBox/2.1.5/source/jquery.fancybox.css"> -->
	
	<!-- DataTables CSS -->
	<#--<link href="${STATIC_LIBS}/datatables/1.10.11/media/css/jquery.dataTables.min.css" rel="stylesheet">-->
	<link href="${STATIC_LIBS}/datatables/1.10.11/media/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <#--<link href="${STATIC_LIBS}/datatables/1.10.11/media/dataTables.bootstrap.min.css" rel="stylesheet">-->

    <!-- DataTables Responsive CSS -->
    <link href="${STATIC_LIBS}/datatables-responsive/2.0.2/css/responsive.dataTables.css" rel="stylesheet">
    
    <!-- Timeline CSS -->
    <#--<link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/dist/css/timeline.css" rel="stylesheet">-->

    <!-- Custom CSS -->
   <link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
   <#-- <link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/morrisjs/morris.css" rel="stylesheet">-->

    <!-- Custom Fonts -->
    <link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="${STATIC_LIBS}/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="${STATIC_LIBS}/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <#--<link rel="stylesheet" href="${STATIC_LIBS}/bootstrap-chosen/1.0.1/bootstrap-chosen.css"> -->
    
    <link rel="stylesheet" href="${STATIC_LIBS}/select2/4.0.2/dist/css/select2.min.css">
    <link rel="stylesheet" href="${STATIC_LIBS}/select2-bootstrap-theme/0.1.0-beta.4/dist/select2-bootstrap.min.css">
    <#--  
    <link rel="stylesheet" href="${STATIC_LIBS}/JQueryzTree/3.5.15/css/zTreeStyle/zTreeStyle.css">
    
    <link rel="stylesheet" href="${STATIC_LIBS}/jquery-treetable/3.1.0/stylesheets/jquery.treetable.css">
    <link rel="stylesheet" href="${STATIC_LIBS}/jquery-treetable/3.1.0/stylesheets/jquery.treetable.theme.default.css">
    -->
    <!-- Custom Cargocn -->
    <link href="${request.contextPath}/static/css/cargocn.css" rel="stylesheet" type="text/css">
   <#-- <link href="${request.contextPath}/static/css/city-picker.css" rel="stylesheet" type="text/css">-->
	 
</#macro> 

<#-- 首页尾部JS模块 --> 
<#macro tJSBox>
	
	<!-- jQuery -->
    <script src="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- EasyUI JavaScript -->
    <script src="${STATIC_LIBS}/jquery-easyui/1.4.5/jquery.easyui.min.js"></script>
    
    <!-- jQuery.validate -->
    <script src="${STATIC_LIBS}/jquery.validate/1.15.0/dist/jquery.validate.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    
    <!-- DataTables JavaScript -->
    <script src="${STATIC_LIBS}/datatables/1.10.11/media/js/jquery.dataTables.min.js"></script>
    <script src="${STATIC_LIBS}/datatables-plugins/1.10.11/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="${STATIC_LIBS}/datatables-responsive/2.0.2/js/dataTables.responsive.js"></script>
   <#-- <script src="${STATIC_LIBS}/datatables-plugins/1.10.11/dataRender/datetime.js"></script>
    <script src="${STATIC_LIBS}/Moment.js/2.12.0/moment.min.js"></script>-->

    <!-- Metis Menu Plugin JavaScript -->
   <#-- <script src="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <script src="${STATIC_LIBS}/fancyapps-fancyBox/2.1.5/source/jquery.fancybox.pack.js"></script>-->
    
    <!-- Morris Charts JavaScript -->
   <#-- <script src="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/raphael/raphael-min.js"></script>
    <script src="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/morrisjs/morris.min.js"></script>-->

    <!-- Custom Theme JavaScript -->
    <#--<script src="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/dist/js/sb-admin-2.js"></script>  -->	
    
    <#-- <script src="${STATIC_LIBS}/chosen/1.5.1/chosen.jquery.min.js"></script>   -->
    
    <script src="${STATIC_LIBS}/select2/4.0.2/dist/js/select2.full.min.js"></script>  
    <script src="${STATIC_LIBS}/select2/4.0.2/dist/js/i18n/zh-CN.js"></script>  
    
   <#-- <script src="${STATIC_LIBS}/JQueryzTree/3.5.15/js/jquery.ztree.all-3.5.min.js"></script>
	
    <script src="${STATIC_LIBS}/jquery-treetable/3.1.0/javascripts/src/jquery.treetable.js"></script>-->
	
    <script src="${STATIC_LIBS}/My97DatePicker/WdatePicker.js"></script>
    
    <!-- maskedinput -->
    <script src="${STATIC_LIBS}/jquery.maskedinput/1.3.1/dist/jquery.maskedinput.js"></script>
    
    <!-- ajaxFileUpload  -->
    <script src="${request.contextPath}/static/js/ajaxfileupload.js"></script>
    
    <!-- form-validate -->
    <script src="${request.contextPath}/static/js/form-validate.js"></script>
    
    <!-- datatable-user1 -->
    <script src="${request.contextPath}/static/js/datatable-user1.js"></script>
   <#-- <script src="${request.contextPath}/static/js/city-picker.data.js"></script>
    <script src="${request.contextPath}/static/js/city-picker.js"></script>-->

</#macro> 

<#--<#include "/constants.ftl">-->
<#---new page start----->
<#macro ntHtml>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<@ntHeadBox /><#--head标签模块引入 -->
    <@ntJSBox /><#--js标签模块引入 -->
	<@ntJSBottomBox />
</head>
<body>
	<div style="padding:10px 5px;">
	    <#nested> 
    </div>
    <#include "include/messagetip.ftl">
</body>
</html>
</#macro>
<#macro ntHeadBox>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user1-scalable=no" />
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="format-detection" content="telephone=no"/>
    <meta content="物流,saas,平台,运输,货代" name="keywords">
    <title>货运中国网</title>
    <link rel="icon" href="images/favicon.png" type="image/x-icon">
	<!-- Import google fonts -->
	<!-- start: CSS file-->
	<#--<link rel="stylesheet" href="${STATIC_LIBS}/jquery.treetable/jquery.treetable.css"> 
    <link rel="stylesheet" href="${STATIC_LIBS}/jquery.treetable/jquery.treetable.theme.default.css">-->
     
	<!-- Vendor CSS-->
	<link href="${STATIC_LIBS}/bootstrap/3.3.6/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${STATIC_LIBS}/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	
	 <!-- Ionicons -->
	 <#-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">-->
	 <!-- iCheck for checkboxes and radio inputs -->
	 <#--<link rel="stylesheet" href="${STATIC_LIBS}/icheck/skins/all.css">-->
	 <!-- datatable -->
	 
	 <#--<link rel="stylesheet" href="https://cd.dantatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
	 <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.0/css/responsive.bootstrap.min.css" />-->
	 <!-- DataTables CSS -->
	 <link href="${STATIC_LIBS}/datatables-plugins/1.10.11/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
	 <!-- DataTables Responsive CSS -->
	 <link href="${STATIC_LIBS}/datatables-responsive/2.0.2/css/responsive.dataTables.css" rel="stylesheet">
	
	 <!--  select2 -->
	 <#--
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.css" />
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.8/select2-bootstrap.css" />
	  -->
	  <link rel="stylesheet" href="${STATIC_LIBS}/select2/4.0.2/dist/css/select2.min.css">
      <link rel="stylesheet" href="${STATIC_LIBS}/select2-bootstrap-theme/0.1.0-beta.4/dist/select2-bootstrap.min.css">
      
	 <!-- animate -->
	 <#--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css" />-->
	 <!--  zTree_v3 -->
	 <#--<link rel="stylesheet" href="${STATIC_LIBS}/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">-->
	 
	 <#--fancyBox-->
     <#--<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/vendor/fancyBox/source/jquery.fancybox.css" media="screen" />-->

	 <link rel="stylesheet" href="${request.contextPath}/static/build/css/AdminLTE.css">
     <link rel="stylesheet" href="${request.contextPath}/static/dist/css/alibaba.css">
    <#-- <link rel="stylesheet" href="${request.contextPath}/static/build/css/skins/skin-blue.css">-->
  
 
	<!-- MetisMenu CSS -->
	<#--<link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">-->
	
	<!-- Plugins CSS-->	
	<!-- Theme CSS -->
	<#--<link href="static/css/jquery.mmenu.css" rel="stylesheet" />-->
	
	<!-- Custom CSS -->
    <#--<link href="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/dist/css/sb-admin-2.css" rel="stylesheet">-->
			
	<!-- Page CSS -->		
	<#--<link href="static/css/style.css" rel="stylesheet" />-->
    <#--<link href="static/css/add-ons.min.css" rel="stylesheet" />-->
	<!-- end: CSS file-->	
	
	<!-- Head Libs -->
	<script src="${STATIC_LIBS}/modernizr/js/modernizr.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="${STATIC_LIBS}/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="${STATIC_LIBS}/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<#--<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/panel.css">
	<link rel="stylesheet" type="text/css" href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/bootstrap/layout.css">
	<link rel="stylesheet" type="text/css" href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/bootstrap/tabs.css">
	<link rel="stylesheet" type="text/css" href="${STATIC_LIBS}/jquery-easyui/1.4.5/themes/bootstrap/menu.css">
    <link rel="stylesheet" href="${request.contextPath}/static/build/css/cg.css">-->
</#macro>
<#macro ntJSBox>	
<!-- start: JavaScript-->
<#--<script src="${request.contextPath}/static/vendor/jquery/jquery.min.js"></script>-->
<#--<script src="${STATIC_LIBS}/startbootstrap-sb-admin-2/1.0.8/bower_components/jquery/dist/jquery.min.js"></script>-->
<#--<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="${request.contextPath}/static/vendor/js/jquery.min.js"><\/script>')</script>-->
<script src="${STATIC_LIBS}/jquery/1.11.3/jquery-1.11.3.min.js"></script>
<script src="${STATIC_LIBS}/bootstrap/3.3.6/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${STATIC_LIBS}/jquery.print/jQuery.print.js"></script> 
<#--<script src="${STATIC_LIBS}/jquery-migrate/jquery-migrate-1.2.1.min.js"></script>
<script src="${STATIC_LIBS}/slimScroll/jquery.slimscroll.min.js"></script> -->
<#--<script src="${STATIC_LIBS}/jquery.treetable/jquery.treetable.js"></script>-->
<script src="${STATIC_LIBS}/My97DatePicker/WdatePicker.js"></script>
<!-- zTree_v3 -->
<#--<script type="text/javascript" src="${STATIC_LIBS}/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${STATIC_LIBS}/zTree_v3/js/jquery.ztree.excheck.js"></script>-->
<!-- ajaxFileUpload  -->
 <script src="${request.contextPath}/static/js/ajaxfileupload.js"></script>  
<!-- iCheck 1.0.1 -->
<#--<script src="${STATIC_LIBS}/icheck/icheck.min.js"></script>
<script src="${STATIC_LIBS}/holderjs/holder.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.50/jquery.form.js"></script>-->
<!-- select2 -->
<script src="${STATIC_LIBS}/select2/4.0.2/dist/js/select2.full.min.js"></script>
<script src="${STATIC_LIBS}/select2/4.0.2/dist/js/i18n/zh-CN.js"></script> 

<#--fancyBox-->
<#--<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/vendor/fancyBox/source/jquery.fancybox.css" media="screen" />-->
<!-- Add mousewheel plugin (this is optional) -->
<#--<script type="text/javascript" src="${request.contextPath}/static/vendor/fancyBox/lib/jquery.mousewheel.pack.js"></script>-->
<!-- Add fancyBox main JS and CSS files -->
<#--<script type="text/javascript" src="${request.contextPath}/static/vendor/fancyBox/source/jquery.fancybox.pack.js"></script>-->

<!-- datatable -->
<script src="${STATIC_LIBS}/datatables/1.10.11/media/js/jquery.dataTables.min.js"></script>
<script src="${STATIC_LIBS}/datatables-plugins/1.10.11/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script src="${STATIC_LIBS}/datatables-responsive/2.0.2/js/dataTables.responsive.js"></script>

<!-- Bootstrap WYSIHTML5 -->
<#--<script src="${STATIC_LIBS}/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script> -->
<script src="${request.contextPath}/static/build/js/datatable-user1.js"></script>
<!-- Theme JS -->	
<#--<script src="${STATIC_LIBS}/jquery-easyui/1.4.5/jquery.easyui.min.js"></script>-->

<!-- end: JavaScript-->
</#macro>
<#macro ntJSBottomBox>	
  <script src="${request.contextPath}/static/build/js/app.js"></script>
  <script src="${request.contextPath}/static/build/js/cargocn.js"></script>

</#macro >
<#---end----->
