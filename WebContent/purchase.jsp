<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="utf-8" />
        <title></title>
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
                        	<label class="logo-default">xxxx</label>
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
	                                    <span class="arrow open"></span>
	                                </a>
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
                                    <a href="index.jsp">Home</a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>
                                    <span>采购管理</span>
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
                        <h1 class="page-title"> PURCHASE
                            <small>采购管理</small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                        	
                        		<!-- BEGIN TABLE-->
                        		<div class="portlet box green">
                        			<div class="portlet-title">
                        				<div class="caption">
                        					<i class="fa fa-globe"></i>采购单列表
                        				</div>
                        				<div class="tools">
                                            <span class="btn-refresh"><i class="fa fa-refresh"></i></span>
                                        </div>
                        			</div>
                        			<div class="portlet-body flip-scroll">
                        				<div class="row table-tool">
											<div class="col-md-12">
												<input type="search" placeholder="牛奶名称 " class="form-control input-small input-inline" v-model.lazy="milkName" onkeyup="if(event==13){init_table()}">
												<button type="button" class="btn btn-success btn-search">搜索</button>
												<button type="button" class="btn btn-danger btn-add">新增</button>
											</div>
										</div>
                        				<table class="table table-bordered table-striped table-condensed flip-content" id="table">
                        					<thead class="flip-content">
                        						<tr>
													<th width="15" align="center"></th>
													<th>采购时间</th>
													<th>采购总额</th>
													<th>操作</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<template v-for="(item, index) in data" :key="item.id">
                        							<tr>
														<td><i class="fa fa-plus-square-o"></i></td>
														<td v-text="item.time"></td>
														<td v-text="item.total_amount"></td>
														<td>
															<button class="btn btn-sm green btn-outline filter-submit margin-bottom" @click="edit(item)">编辑</button>
															<button class="btn btn-sm red btn-outline filter-submit margin-bottom" @click="deleted(item.number)">删除</button>
														</td>
													</tr>
													<tr>
														<table>
															<thead>
																<tr>
																	<th>商品名称</th>
																	<th>数量</th>
																	<th>进货单价</th>
																	<th>进货总价</th>
																</tr>
															</thead>
															<tbody>
																<tr v-for="detailed in item.list" :key="detailed.ID">
																	<td v-text="detailed.name"></td>
																	<td v-text="detailed.number"></td>
																	<td v-text="detailed.purchase_price"></td>
																	<td v-text="detailed.total_amount"></td>
																</tr>
															</tbody>
														</table>
													</tr>
                        						</template>
                        					</tbody>
                        				</table>
                        				<div class="bottom-tool row">
											<wear-paginate></wear-paginate>
										</div>
                        			</div>
                        		</div>
                        		<!-- END TABLE-->
                        		
                        	</div>
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
        <script src="static/js/paginate_tool.js" type="text/javascript"></script>
        <script>
        	$(function(){
        		$(".btn-add").on("click", function(){
					location.href="addPurchase.jsp";        			
        		});
        	})
        	
        </script>
    </body>

</html>