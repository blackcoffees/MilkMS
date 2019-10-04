<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="utf-8" />
        <title>重庆派派食品有限公司</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="author" />
        <%@include file="header.jsp"%>
        <link rel="shortcut icon" href="favicon.ico" />
	</head>

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <div class="page-wrapper">
        
            <div class="page-header navbar navbar-fixed-top">
                <div class="page-header-inner ">
                    
                    <!-- BEGIN LOGO -->
                    <div class="page-logo">
                        <a href="index.jsp">
                        	<label class="logo-default">重庆派派食品有限公司</label>
						</a>
                        <div class="menu-toggler sidebar-toggler">
                            <span></span>
                        </div>
                    </div>
                    <!-- END LOGO -->
                    
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                        	<li>xxx</li>
                        </ul>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                    
                </div>
            </div>
            
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                
                <!-- BEGIN SIDEBAR -->
                <div class="page-sidebar-wrapper">
                    <div class="page-sidebar navbar-collapse collapse">
                        
                        <!-- BEGIN SIDEBAR MENU -->
                        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                        	<template v-for="(menu, i) in menu_list">
                        		<li class="nav-item" :class="{start: i == 1, active: menu.href==now_href, open: menu.href==now_href}">
	                                <a :href="menu.href" class="nav-link nav-toggle">
	                                    <i :class="menu.span_icon"></i>
	                                    <span class="title" v-text="menu.title"></span>
	                                    <span class="selected"></span>
	                                    <span class="arrow"></span>
	                                </a>
	                                <ul v-if="menu.children" class="sub-menu" style="display: none;">
										<li v-for="child in menu.children">
											<a :href="child.href">
												<i :class="child.span_icon" ></i>((child.title))
											</a>
										</li>
									</ul>
	                            </li>
                        	</template>
                        </ul>
                        <!-- END SIDEBAR MENU -->
                        
                    </div>
                </div>
                <!-- END SIDEBAR -->
                
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <div class="page-content">

                        <!-- BEGIN PAGE BAR -->
                        <div class="page-bar">
                            <ul class="page-breadcrumb">
                                <li>
                                    <a href="javascript:void(0)">Home</a>
                                </li>
                            </ul>
                            <div class="page-toolbar">
                                <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
                                    <i class="icon-calendar"></i>&nbsp;
                                    <span class="thin uppercase hidden-xs"></span>&nbsp;
                                    <i class="fa fa-angle-down"></i>
                                </div>
                            </div>
                        </div>
                        <!-- END PAGE BAR -->
                        
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title"> Home
                            <small>首页</small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        
                         <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<!-- BEGIN Summary-->
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<div class="dashboard-stat blue-madison">
										<div class="visual">
											<i class="fa fa-comments"></i>
										</div>
										<div class="details">
											<div class="number" id="totalPurchaseOrderNumber">
												 0 笔
											</div>
											<div class="desc">
												 销售单数
											</div>
										</div>
										<a class="more" href="javascript:void(0)">
											今日数据 <i class="m-icon-swapright m-icon-white"></i>
										</a>
									</div>
								</div>
								
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<div class="dashboard-stat red-intense">
										<div class="visual">
											<i class="fa fa-bar-chart-o"></i>
										</div>
										<div class="details">
											<div class="number" id="totalPurchaseNumber">
												0 件
											</div>
											<div class="desc">
												 销售总数量
											</div>
										</div>
										<a class="more" href="javascript:void(0)">
											今日数据 <i class="m-icon-swapright m-icon-white"></i>
										</a>
									</div>
								</div>
								
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<div class="dashboard-stat green-haze">
										<div class="visual">
											<i class="fa fa-shopping-cart"></i>
										</div>
										<div class="details">
											<div class="number" id="totalPurchasePrice">
												￥ 0
											</div>
											<div class="desc">
												 销售总金额
											</div>
										</div>
										<a class="more" href="javascript:void(0)">
											今日数据 <i class="m-icon-swapright m-icon-white"></i>
										</a>
									</div>
								</div>
								
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<div class="dashboard-stat purple-plum">
										<div class="visual">
											<i class="fa fa-globe"></i>
										</div>
										<div class="details">
											<div class="number" id="firstThreeGoods" style="font-size:28px;">
												&nbsp;
											</div>
											<div class="desc">
												 销售最多商品
											</div>
										</div>
										<a class="more" href="javascript:void(0)">
											今日数据 <i class="m-icon-swapright m-icon-white"></i>
										</a>
									</div>
								</div>
							</div>
                       		<!-- END Summary-->
                       		<!-- BEGIN tiles -->
                       		<div class="row">
                       			<div class="tiles col-md-12">
                       				<!-- BEGIN tiles list -->
									<a class="tile bg-purple-studio" href="addSale.jsp">
										<div class="tile-body">
											<i class="fa fa-shopping-cart"></i>
										</div>
										<div class="tile-object">
											<div class="name">
												  新增销售单
											</div>
										</div>
									</a>
									<a class="tile double bg-red-sunglo" href="addPurchase.jsp">
										<div class="tile-body">
											<i class="fa fa-truck"></i>
										</div>
										<div class="tile-object">
											<div class="name">
												新增采购单
											</div>
										</div>
									</a>
									<a class="tile bg-blue-steel">
										<div class="tile-body">
											<i class="fa fa-briefcase"></i>
										</div>
										<div class="tile-object">
											<div class="name">
												 新增零售单
											</div>
										</div>
									</a>
									<a class="tile bg-green" href="purchaseReport.jsp">
										<div class="tile-body">
											<i class="fa fa-bar-chart-o"></i>
										</div>
										<div class="tile-object">
											<div class="name">
												 报表中心
											</div>
										</div>
									</a>
									<!-- END tiles list -->
                       			</div>
                       		</div>
                       		<!-- END tiles -->
                        </div>
                        <!-- END PAGE MAIN-->
                    </div>
                </div>
                <!-- END CONTENT -->
                
            </div>
            <!-- END CONTAINER -->
            
            <!-- BEGIN FOOTER -->
            <div class="page-footer"></div>
            <!-- END FOOTER -->
            
        </div>
        
        <script src="static/js/common.js" type="text/javascript"></script>
        <script>
        	$(function(){
        		getSaleToday();
        	})
        	
        	function getSaleToday(){
        		$.ajax({
        			type: 'get',
        			url: 'report/getSaleToday.action',
        			data:{},
        			success:function(data){
        				data = eval("("+data+")");
        				if(!data.succ){
        					layer.msg(data.message);
        				}
        				else{
        					$("#totalPurchaseOrderNumber").html(data.saleCount+" 笔");
        					$("#totalPurchaseNumber").html(data.saleQuantity+" 件");
        					$("#totalPurchasePrice").html("￥ "+data.saleTotalPrice);
        					$("#firstThreeGoods").html(data.firstGoodsName);
        				}
        			}
        		})        		
        	}
        </script>
    </body>

</html>