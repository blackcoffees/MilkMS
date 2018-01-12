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
                        		<li class="nav-item" :class="{start: i == 1, active: menu.href=='javascript:void(0)', open: menu.href=='javascript:void(0)'}">
	                                <a :href="menu.href" class="nav-link nav-toggle">
	                                    <i :class="menu.span_icon"></i>
	                                    <span class="title" v-text="menu.title"></span>
	                                    <span class="selected"></span>
	                                    <span class="arrow open"></span>
	                                </a>
	                                <ul v-if="menu.children" class="sub-menu" style="display: block;">
										<li v-for="child in menu.children"  :class="child.href==now_href ? 'nav-sub-menu-hover': ''">
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
                                    <span>报表中心</span>
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
                        <h1 class="page-title"> REPORT
                            <small>报表中心</small>
                        </h1>
                        
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                        		 <!-- BEGIN SEARCH -->
								<div class="note note-info">
									<input type="text" placeholder="商品名称/商品编号" class="form-control input-inline" id="milkName" style="width:150px;" />
									<input type="text" placeholder="采购时间" class="form-control input-inline" id="purchaseTime" style="width:300px" />
									<button type="button" class="btn btn-success btn-search">搜索</button>
									<input id="startTime" style="display:none;" />
									<input id="endTime" style="display:none" />
									<p>
										NOTE: 采购时间默认为当月
									</p>
								</div>
								<!-- END SEARCH-->
								
								<!-- BEGIN Summary-->
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<div class="dashboard-stat blue-madison">
											<div class="visual">
												<i class="fa fa-comments"></i>
											</div>
											<div class="details">
												<div class="number" id="totalPurchaseOrderNumber">
													 
												</div>
												<div class="desc">
													 采购单数
												</div>
											</div>
											<a class="more" href="javascript:void(0)">
											View more <i class="m-icon-swapright m-icon-white"></i>
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
												</div>
												<div class="desc">
													 采购总数量
												</div>
											</div>
											<a class="more" href="javascript:void(0)">
											View more <i class="m-icon-swapright m-icon-white"></i>
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
												</div>
												<div class="desc">
													 采购总金额
												</div>
											</div>
											<a class="more" href="javascript:void(0)">
											View more <i class="m-icon-swapright m-icon-white"></i>
											</a>
										</div>
									</div>
									
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<div class="dashboard-stat purple-plum">
											<div class="visual">
												<i class="fa fa-globe"></i>
											</div>
											<div class="details">
												<div class="number" id="firstThreeGoods">
												</div>
												<div class="desc">
													 采购前三商品
												</div>
											</div>
											<a class="more" href="javascript:void(0)">
											View more <i class="m-icon-swapright m-icon-white"></i>
											</a>
										</div>
									</div>
								</div>
                        		<!-- END Summary-->
                        		
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
                        				<table class="table table-bordered table-striped dataTable table-condensed flip-content" id="table">
                        					<thead class="flip-content">
                        						<tr>
                        							<th text-align="center"></th>
                        							<th>编号</th>
													<th>商品名称</th>
													<th>采购总数量</th>
													<th>采购总金额</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<template v-for="(purchase, $index) in data">
	                        						<tr :key="purchase.id">
	                        							<td style="vertical-align: inherit;text-align: center;">
	                        								<span class="row-detail row-detail-close"></span>
	                        							</td>
	                        							<td v-text="$index+1"></td>
														<td v-text="purchase[0].name"></td>
														<td v-text="purchase[0].totalNumber"></td>
														<td v-text="purchase[0].totalPrice"></td>
													</tr>
													<tr style="display: none;">
														<td colspan="6">
															<table class="table table-striped table-hover">
																<thead>
																	<tr>
																		<td>采购单号</td>
																		<td>采购时间</td>
																		<td>数量</td>
																		<td>采购单价</td>
																		<td>总价格</td>
																	</tr>
																</thead>
																<tbody>
																	<tr v-for="item in purchase">
																		<td>((item.id))</td>
																		<td>((item.time))</td>
																		<td>((item.number))</td>
																		<td>((item.purchase_price))</td>
																		<td>((item.total_amount))</td>
																	</tr>
																</tbody>
															</table>
														</td>
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
                        		
                        		<!-- BEGIN CHART-->
                        		<div class="lineChart row">
                        			<div id="lineChart" style="min-width:400px;height:400px"></div>
                        		</div>
                        		<!-- END CHART-->
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
        
        /*折线图*/
        var lineChartVar = null;
		var lineChart = {
		    chart: {
		    	renderTo: 'lineChart',
		        type: 'line'
		    },
		    title: {
		        text: '采购单走势图'
		    },
		    xAxis: {
		        categories: []
		    },
		    yAxis: {
		        title: {
		            text: '价格（￥）'
		        }
		    },
		    plotOptions: {
		        line: {
		            dataLabels: {
		                enabled: false          // 开启数据标签
		            },
		            enableMouseTracking: true // 关闭鼠标跟踪，对应的提示框、点击事件会失效
		        }
		    },
		    series: []
		}
		
		$(function(){
			init_table();
			
			$('.btn-search').on('click', function(){
				vue.milkName = $("#search").val();
				init_table();
			})
			
			$('.btn-refresh').on('click', function(){
				init_table();
			})
			
			/*表格收缩展开*/
			$("tbody").on('click', ".row-detail", function(){
				if(this.className.indexOf("row-detail-close") > 0){
					this.className = "row-detail row-detail-open";
					$(this).parents("tr").next("tr").show(500);
				}
				else if(this.className.indexOf("row-detail-open") > 0){
					this.className = "row-detail row-detail-close";
					$(this).parents("tr").next("tr").hide(500);
				}
			});
		})
		
		var g_rows = 10;
        var g_page = 1;
        
		function init_table(rows, page){
			if(rows != '' && rows > 0)
				g_rows = rows;
			else
				rows = g_rows;
			
			if(page != '' && page > 0)
				g_page = page;
			else
				page = g_page;
			
			var milkName = vue.milkName;
			
			$.ajax({
				type:'get',
				url:'report/getPurchaseReport.action',
				data:{
					rows: rows,
					page: page,
					milkName: milkName
				},
				success:function(data){
					layer.closeAll('loading');
					data = eval("("+data+")");
					console.info(data);
					//分页
					page_total = get_page_total(data.tableTotal, g_rows);
					paginate_tool.init("init_table", page_total, data.tableTotal, []);
					
					vue.data = data.tableDatas;
					$("#totalPurchaseOrderNumber").html(data.purchaseOrderTotalNumber);
					$("#totalPurchaseNumber").html(data.purchaseTotalNumber);
					$("#totalPurchasePrice").html("￥" + data.purchaseTotalAmout);
					$("#firstThreeGoods").html(data.firstThreeMilkName);
					
					/*折线图数据*/
					var lineXData = data.lineXData;
					lineChart.xAxis.categories = data.lineXData;
					lineChart.xAxis.categories = ["2018-01-10","2018-01-08","2018-01-03","2017-12-19"];
					console.info(lineChart.xAxis.categories);
					lineChartVar = new Highcharts.Chart(lineChart);
					console.info(lineChartVar);
					lineChartVar.addAxis(data.lineYData, true);
					lineChartVar.addSeries(data.lineYData);
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