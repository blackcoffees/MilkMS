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
	                                    <span class="arrow" :class="{open: menu.href=='javascript:void(0)'}"></span>
	                                </a>
	                                <ul v-if="menu.children" class="sub-menu" style="display: block;">
										<li v-for="child in menu.children"  :class="{'nav-sub-menu-hover': child.href == 'saleReport.jsp'}">
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
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>
                                    <span>销售报表</span>
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
                        <div class="tabbable-custom tabbable-full-width">
                        	<ul class="nav nav-tabs" style="border-bottom:1px solid #cecece;">
								<li>
									<a href="saleReport.jsp" data-toggle="tab">商品销售报表</a>
								</li>
								<li class="active">
									<a href="javascript:void(0)" data-toggle="tab">商家销售报表</a>
								</li>
							</ul>
                        </div>
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                        		 <!-- BEGIN SEARCH -->
								<div class="note note-info">
									<input type="text" placeholder="商家名称" class="form-control input-inline" id="milkName" style="width:150px;" />
									<input type="text" placeholder="销售时间" class="form-control input-inline" id="purchaseTime" style="width:300px" />
									<button type="button" class="btn btn-success btn-search"><i class="fa fa-search"></i>&nbsp;&nbsp;搜索</button>
									<input id="startTime" style="display:none;" />
									<input id="endTime" style="display:none" />
									<p>
										NOTE: 销售时间默认为当月
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
													 销售单数
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
													 销售总数量
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
													 销售总金额
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
													 销售总利润
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
													<th>商家名称</th>
													<th>销售总数量</th>
													<th>销售总金额</th>
													<th>销售总利润</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<template v-for="(sale, $index) in data">
	                        						<tr :key="sale.id">
	                        							<td style="vertical-align: inherit;text-align: center;">
	                        								<span class="row-detail row-detail-close"></span>
	                        							</td>
	                        							<td v-text="$index+1" width="41"></td>
														<td v-text="sale[0].distributor_name"></td>
														<td v-text="sale[0].totalSaleQuantity"></td>
														<td>￥((sale[0].totalSalePrice))</td>
														<td>￥((sale[0].totalSaleProfit))</td>
													</tr>
													<tr style="display: none;">
														<td colspan="6">
															<table class="table table-striped table-hover">
																<thead>
																	<tr>
																		<td>销售单号</td>
																		<td>销售时间</td>
																		<td>商品名称</td>
																		<td>数量</td>
																		<td>销售单价</td>
																		<td>销售总价格</td>
																		<td>采购成本</td>
																		<td>采购总成本</td>
																		<td>利润总价格</td>
																	</tr>
																</thead>
																<tbody>
																	<tr v-for="item in sale">
																		<td style="text-align:center">((item.id))</td>
																		<td>((item.sale_time))</td>
																		<td>((item.milk_name))</td>
																		<td>((item.quantity))</td>
																		<td>￥((item.price))</td>
																		<td>￥((item.total_amount))</td>
																		<td>￥((item.cost_price))</td>
																		<td>￥((item.total_cost_price))</td>
																		<td>￥((item.total_profit))</td>
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
                        		
                        		<div class="pieChart row">
                        			<div id="pieChart" style="min-width:400px;height:400px"></div>
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
				data: []
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
		        text: '销售单走势图'
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
		
		var pieChartVar = null;
		$("#pieChart").highcharts({
			chart: {
	        	renderTo: 'pieChart',
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: '各商品销售占比'
	        },
	        tooltip: {
	            headerFormat: '{series.name}<br>',
	            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: '商品销售占比',
	            data: null
	        }]
	    });
		
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
			
			/*商品编号回车*/
			$("#milkName").keydown(function(event){
				if(event.keyCode == 13){
					init_table();
				}
			})
		})
		
		function init_table(rows, page){
			if(typeof(rows) == 'undefined')
				rows = 10;
			if(typeof(page) == 'undefined')
				page = 1;
			
			var milkName = $("#milkName").val();
			$.ajax({
				type:'get',
				url:'report/getSaleReport.action',
				data:{
					rows: rows,
					page: page,
					info: milkName,
					type: 2
				},
				success:function(data){
					layer.closeAll('loading');
					data = eval("("+data+")");
					if(!data.succ){
						layer.msg(data.message)
					}
					else{
						//分页
						paginate_tool.init("init_table", data.pager, []);
						vue.data = data.tableDatas;
						$("#totalPurchaseOrderNumber").html(data.summarySaleOrderCount);
						$("#totalPurchaseNumber").html(data.summarySaleGoodsQuantity);
						$("#totalPurchasePrice").html("￥" + data.summarySaleGoodsPrice);
						$("#firstThreeGoods").html("￥" + data.summarySaleGoodsProfit);
						
						/*折线图数据*/
						lineChart.xAxis.categories = data.lineXData;
						data.lineYData = data.lineYData.replace(/\"/g, "");
						lineChart.series = eval(data.lineYData);
						lineChartVar = new Highcharts.Chart(lineChart);
						
						/*饼状图数据*/
						var pieDataArray = new Array();
						
						for(i in data.pieData){
							var value = [data.pieData[i].milk_name, parseFloat(data.pieData[i].total_price)];
							pieDataArray.push(value);
						}
						pieChartVar = $("#pieChart").highcharts();
						pieChartVar.series[0].setData(pieDataArray);
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
		
		$("#purchaseTime").daterangepicker({
			opens: 'right',
			alwaysShowCalendars: true,
            showDropdowns: true,
			autoUpdateInput: false,
			showWeekNumbers: false,
			linkedCalendars: false,
			drops: "down",
			locale: {
                format: 'YYYY-MM-DD',
                applyLabel: "应用",
                cancelLabel: "取消",
                daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ], 
                monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',  
                               '七月', '八月', '九月', '十月', '十一月', '十二月' ],
				customRangeLabel : '自定义', 
            },
            ranges: {
            	"本周": [moment().days(1), moment().add(7-moment().days(), 'days')],
            	"上周": [moment().subtract(7+(moment().days()-1), "days"), moment().days(0)],
            	"本月": [moment().startOf("month"), moment().endOf("month")],
            	"上月": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")],
            	"本季度": [moment().quarter(moment().quarter()).startOf("quarter"), moment().quarter(moment().quarter()).endOf("quarter")],
            	"上季度": [moment().quarter(moment().quarter()-1).startOf("quarter"), moment().quarter(moment().quarter()-1).endOf("quarter")]
            }
		},
        function(start, end, label){
			if(!this.startDate)
            	$("#purchaseTime").val('');
			else{
				$("#purchaseTime").val(this.startDate.format(this.locale.format) + " 至 " + this.endDate.format("YYYY-MM-DD"));
				$("#startTime").val(this.startDate.format(this.locale.format));
				$("#endTime").val(this.endDate.format(this.locale.formate));
			}
        });
		
		$("#purchaseTime").on('apply.daterangepicker', function(ev, picker) {
			$("#purchase_time").val(picker.startDate.format('YYYY-MM-DD') + " 至 " + picker.endDate.format("YYYY-MM-DD"));
			$("#startTime").val(picker.startDate.format('YYYY-MM-DD'));
			$("#endTime").val(picker.endDate.format("YYYY-MM-DD"));
        });
        </script>
    </body>

</html>