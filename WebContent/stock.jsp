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
                        	<label class="logo-default" style="font-size:25px;margin-top:7px;color:white;font-family:'仿宋'">超市管理系统</label>
						</a>
                        <div class="menu-toggler sidebar-toggler">
                            <span></span>
                        </div>
                    </div>
                    <!-- END LOGO -->
                    
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="page-logo" style="float:right;">
                        <a href="settle.jsp">
                        	<i class="icon-login"></i>
                        	<label class="logo-default">进入收银</label>
						</a>
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
                                    <a href="index.jsp">Home</a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>
                                    <span>库存管理</span>
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
                        <h1 class="page-title"> STOCK
                            <small>库存管理</small>
                        </h1>
                        
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                        	
                        		<!-- BEGIN TABLE-->
                        		<div class="portlet box green">
                        			<div class="portlet-title">
                        				<div class="caption">
                        					<i class="fa fa-globe"></i>库存列表
                        				</div>
                        				<div class="tools">
                                            <span class="btn-refresh"><i class="fa fa-refresh"></i></span>
                                        </div>
                        			</div>
                        			<div class="portlet-body flip-scroll">
                        				<div class="row table-tool">
											<div class="col-md-12">
												<input type="search" placeholder="商品名称/商品编号" class="form-control input-small input-inline" onchange="vue.milkName=this.value" onkeyup="if(event.keyCode==13){vue.milkName=this.value;init_table()}">
												<button type="button" class="btn btn-success btn-search" onclick="init_table()"><i class="fa fa-search"></i>&nbsp;&nbsp;搜索</button>
											</div>
										</div>
                        				<table class="table table-bordered table-striped dataTable table-condensed flip-content" id="table">
                        					<thead class="flip-content">
                        						<tr>
                        							<th>编号</th>
                        							<th>商品名称</th>
													<th>库存数量</th>
													<th>平均成本</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<template v-for="(stock, $index) in data">
	                        						<tr :key="stock.id">
	                        							<td>(($index+1))</td>
	                        							<td v-text="stock.milkName"></td>
														<td>((stock.quantity))件</td>
														<td>￥((stock.cost_price))</td>
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
		
		<!-- BEGIN LAYER -->
		<!-- END LAYER -->
		
        <script src="static/js/common.js" type="text/javascript"></script>
        <script src="static/js/paginate_tool.js" type="text/javascript"></script>
        <script>
        var vue = new Vue({
			delimiters:['((', '))'],
			el:'#table',
			data:{
				milkName: '',
				data: []
			},
			methods:{
			}
		})
		
		$(function(){
			init_table();
			
			$('.btn-refresh').on('click', function(){
				init_table();
			})
		})
		
        
		function init_table(rows, page){
        	if(typeof(rows) == 'undefined')
        		rows = 10;
        	if(typeof(page) == 'undefined')
        		page = 1;
			var milkName = vue.milkName;
			$.ajax({
				type:'get',
				url:'stock/getStockByCondition.action',
				data:{
					rows: rows,
					page: page,
					milkName: milkName
				},
				success:function(data){
					layer.closeAll('loading');
					data = eval("("+data+")");
					pager = eval("("+data.pager+")");
					if(!data.succ){
						layer.msg(data.message);
					}
					else{
						//一共生成多少页
						paginate_tool.init("init_table", pager, []);
						vue.data = data.datas;
					}
				},
				beforeSend:function(){
					layer.load(1, {
						shade: [0.1, '#fff']
					});
				},
				error: function(){
					layer.closeAll("loading");
				}
				
			})
		}
        </script>
    </body>

</html>