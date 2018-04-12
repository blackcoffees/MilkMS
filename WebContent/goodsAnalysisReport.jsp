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
        <style type="text/css">
        	.ranges ul li:last-child{
        		display:none;
        	}
        	.range_inputs{
        		display: none;
        	}
        </style>
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
                        		<li class="nav-item" :class="{start: i == 1, active: menu.href=='javascript:void(0)', open: menu.href=='javascript:void(0)'}">
	                                <a :href="menu.href" class="nav-link nav-toggle">
	                                    <i :class="menu.span_icon"></i>
	                                    <span class="title" v-text="menu.title"></span>
	                                    <span class="selected"></span>
	                                    <span class="arrow" :class="{open: menu.href=='javascript:void(0)'}"></span>
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
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>
                                    <span>分析报表</span>
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
								<li class="active">
									<a href="javascript:void(0)" data-toggle="tab">商品销售报表</a>
								</li>
<!-- 								<li class=""> -->
<!-- 									<a href="disAnalysisReport.jsp" data-toggle="tab">商家销售报表</a> -->
<!-- 								</li> -->
							</ul>
                        </div>
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                       			<div class="note note-info">
									<input type="text" placeholder="商品名称/商品编号" class="form-control input-inline" id="milkName" style="width:150px;" />
									<div class="dropdown input-inline" id="status-list"> 
										<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> 
										<span>销售时间</span>
										<span class="caret"></span> 
										</button> 
										<ul class="dropdown-menu">
											<li><a href="javascript:;" date-type="1">最近两天</a></li>
											<li><a href="javascript:;" date-type="2">最近两周</a></li>
											<li><a href="javascript:;" date-type="3">最近两月</a></li>
											<li><a href="javascript:;" date-type="4">最近两季度</a></li>
											<li><a href="javascript:;" date-type="5">最近两年</a></li>
										</ul> 
									</div>
									<button type="button" class="btn btn-success btn-search"><i class="fa fa-search"></i>&nbsp;&nbsp;搜索</button>
									<input id="startStartTime" style="display:none;" />
									<input id="startEndTime" style="display:none" />
									<input id="endStartTime" style="display:none;" />
									<input id="endEndTime" style="display:none" />
									<input id="dateType" style="display:none;">
									<p>
										NOTE: 销售时间默认为最近两天
									</p>
								</div>
								<!-- BEGIN SUMMARY DATA-->
                        		<div class="row">
                        			<div class="portlet light portlet-fit bordered col-md-5" style="margin-left:15px;">
	                                    <div class="portlet-title">
	                                        <div class="caption">
	                                            <i class="icon-microphone font-dark hide"></i>
	                                            <span class="caption-subject bold font-dark uppercase" id="last-date"></span>
	                                        </div>
	                                    </div>
	                                    <div class="portlet-body">
	                                        <div class="row">
	                                            <div class="col-md-4">
	                                                <div class="mt-widget-3">
	                                                    <div class="mt-head bg-blue-hoki">
	                                                        <div class="mt-head-icon">
	                                                        	<i class="fa fa-file-text" aria-hidden="true"></i>
	                                                        </div>
	                                                        <div class="mt-head-desc">销售单数量</div>
	                                                        <span class="mt-head-date" id="last-order-count"></span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-4">
	                                                <div class="mt-widget-3">
	                                                    <div class="mt-head bg-red">
	                                                        <div class="mt-head-icon">
	                                                            <i class="fa fa-cubes" aria-hidden="true"></i>
	                                                        </div>
	                                                        <div class="mt-head-desc">销售数量</div>
	                                                        <span class="mt-head-date" id="last-goods-quantity"></span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-4">
	                                                <div class="mt-widget-3">
	                                                    <div class="mt-head bg-green">
	                                                        <div class="mt-head-icon">
	                                                            <i class="fa fa-jpy" aria-hidden="true"></i>
	                                                        </div>
	                                                        <div class="mt-head-desc">销售金额</div>
	                                                        <span class="mt-head-date" id="last-goods-price"></span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="portlet light portlet-fit bordered col-md-5 right" style="margin-right:13px;">
	                                    <div class="portlet-title">
	                                        <div class="caption">
	                                            <i class="icon-microphone font-dark hide"></i>
	                                            <span class="caption-subject bold font-dark uppercase" id="now-date"></span>
	                                        </div>
	                                    </div>
	                                    <div class="portlet-body">
	                                        <div class="row">
	                                            <div class="col-md-4">
	                                                <div class="mt-widget-3">
	                                                    <div class="mt-head bg-blue-hoki">
	                                                        <div class="mt-head-icon">
	                                                        	<i class="fa fa-file-text" aria-hidden="true"></i>
	                                                        </div>
	                                                        <div class="mt-head-desc">销售单数量</div>
	                                                        <span class="mt-head-date" id="now-order-count"></span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-4">
	                                                <div class="mt-widget-3">
	                                                    <div class="mt-head bg-red">
	                                                        <div class="mt-head-icon">
	                                                            <i class="fa fa-cubes" aria-hidden="true"></i>
	                                                        </div>
	                                                        <div class="mt-head-desc">销售数量</div>
	                                                        <span class="mt-head-date" id="now-goods-quantity"></span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-4">
	                                                <div class="mt-widget-3">
	                                                    <div class="mt-head bg-green">
	                                                        <div class="mt-head-icon">
	                                                            <i class="fa fa-jpy" aria-hidden="true"></i>
	                                                        </div>
	                                                        <div class="mt-head-desc">销售金额</div>
	                                                        <span class="mt-head-date" id="now-goods-price"></span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                        		</div>
							</div>                        		 
                        </div>
                        <!-- END SUMMARY DATA-->
                        <!-- BEGIN GOODS Compater-->
                        <div class="row rose-data">
	                        <div class="col-md-6">
                                <div class="portlet light bordered">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption">
                                            <i class="icon-bubbles font-dark hide"></i>
                                            <span class="caption-subject font-dark bold uppercase">明星商品</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="portlet_comments_1">
                                                <!-- BEGIN: Comments -->
                                                <div class="mt-comments" v-if="rose_up_list.length != 0" v-for="rose in rose_up_list">
                                                    <div class="mt-comment">
                                                        <div class="mt-comment-body">
                                                            <div class="mt-comment-info">
                                                                <span class="mt-comment-author">((rose.name))</span>
                                                                <span class="mt-comment-date up-data"><i style="padding-right:10px" class="fa fa-arrow-up" aria-hidden="true"></i>((rose.rose *100))%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END: Comments -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="portlet light bordered">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption">
                                            <i class="icon-bubbles font-dark hide"></i>
                                            <span class="caption-subject font-dark bold uppercase">危机商品</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="portlet_comments_1">
                                                <!-- BEGIN: Comments -->
                                                <div class="mt-comments" v-if="rose_down_list.length != 0" v-for="rose in rose_down_list">
                                                    <div class="mt-comment">
                                                        <div class="mt-comment-body">
                                                            <div class="mt-comment-info">
                                                                <span class="mt-comment-author">((rose.name))</span>
                                                                <span class="mt-comment-date down-data"><i style="padding-right:10px" class="fa fa-arrow-down" aria-hidden="true"></i>((rose.rose *100))%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END: Comments -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END GOODS Compater-->
                        
                        <!-- BEGIN GOODS Table Compater-->
                        <div class="row">
                        	<div class="col-md-12">
                        		<div class="portlet box green">
	                       			<div class="portlet-title">
	                       				<div class="caption">
	                       					<i class="fa fa-globe"></i>商品列表
	                       				</div>
	                       				<div class="tools">
	                                           <span class="btn-refresh"><i class="fa fa-refresh"></i></span>
	                                       </div>
	                       			</div>
	                       			<div class="portlet-body flip-scroll">
	                       				<table class="table table-bordered table-striped dataTable table-condensed flip-content" id="table">
	                       					<thead class="flip-content">
	                       						<tr>
	                       							<th width="200px"></th>
													<th v-for="item in data">((item.name))</th>
												</tr>
	                       					</thead>
	                       					<tbody>
                        						<tr v-for="item in data">
													<td>((last_date))</td>
													<td>￥ ((item.lastPrice))</td>
												</tr>
												<tr v-for="item in data">
													<td>((now_date))</td>
													<td>￥ ((item.nowPrice))</td>
												</tr>
												<tr v-for="item in data">
													<td>增长幅度</td>
													<td v-if="item.rose > 0" class="up-data">((item.rose * 100))%</td>
													<td v-else class="down-data">((item.rose * 100))%</td>
												</tr>
	                       					</tbody>
	                       				</table>
	                       				<div class="bottom-tool row">
											<wear-paginate></wear-paginate>
										</div>
	                       			</div>
	                       		</div>
                        	</div>
                        </div>
                        <!-- END GOODS TableCompater-->
                        <div class="lineChart row">
                   			<div id="lineChart" style="min-width:400px;height:400px"></div>
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
				data: [],
				last_date: '',
				now_date: ''
			}
		})
        
        var rose_vue = new Vue({
        	delimiters:['((', '))'],
        	el:'.rose-data',
        	data:{
        		rose_up_list:[],
        		rose_down_list:[]
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
		        text: '销售走势图'
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
			get_time_slot(1);
			init_table();
			
			$('.btn-search').on('click', function(){
				vue.milkName = $("#search").val();
				init_table();
			})
			
			$('.btn-refresh').on('click', function(){
				init_table();
			})
			
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
			$("#lineChart").hide();
			$.ajax({
				type:'get',
				url:'report/getGoodsAnalysisReport.action',
				data:{
					rows: rows,
					page: page,
					info: milkName,
					type: 1,
					startStartTime: $("#startStartTime").val(),
					startEndTime: $("#startEndTime").val(),
					endStartTime: $("#endStartTime").val(),
					endEndTime: $("#endEndTime").val()
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
						$("#last-order-count").html(data.lastSummarySaleOrderCount);
						$("#last-goods-quantity").html(data.lastSummarySaleGoodsQuantity+" 件");
						$("#last-goods-price").html("￥" + data.lastSummarySaleGoodsPrice);
						$("#now-order-count").html(data.nowSummarySaleOrderCount);
						$("#now-goods-quantity").html(data.nowSummarySaleGoodsQuantity+" 件");
						$("#now-goods-price").html("￥" + data.nowSummarySaleGoodsPrice);
						rose_vue.rose_up_list = data.roseUpData;
						rose_vue.rose_down_list = data.roseDownData;
						if(milkName!= null && milkName != ''){
							$("#lineChart").show();
							/*折线图数据*/
							lineChart.xAxis.categories = data.lineXData;
							data.lineYData = data.lineYData.replace(/\"/g, "");
							data.lineYData = data.lineYData.replace(/\\/g, "\"");
							lineChart.series = eval(data.lineYData);
							lineChartVar = new Highcharts.Chart(lineChart);
						}
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
		
		/*下拉框*/
		$("#status-list").on('click', 'button.btn', function(e){
			e.stopPropagation();
			$(this).siblings('ul.dropdown-menu').stop().slideDown('fase');
		}).on('click', 'ul.dropdown-menu li', function(e){
			e.stopPropagation();
			$(this).parents('ul.dropdown-menu').stop().slideToggle('fast');
			$(this).parents("ul.dropdown-menu").prev("button").find("span").first().html($(this).find("a").html());
			
			var date_type = $(this).find("a").attr("date-type");
			$("#dateType").val(date_type);
			get_time_slot(date_type);
		});
		$('body').on('click', function(e){
			e.stopPropagation();
			$("#status-list").find("ul.dropdown-menu").stop().slideUp('fast');
		})
		
		function get_time_slot(date_type){
			var startStartTime, startEndTime, endStartTime, endEndTime;
			var format_str = "YYYY-MM-DD";
			if(date_type == 1){
				/*最近两天*/
				startEndTime = moment().format(format_str);
				startStartTime = moment().subtract(1, "days").format(format_str);
				endStartTime = "";
				endEndTime = "";
			}
			else if(date_type == 2){
				/*最近两周*/
				startStartTime = moment().subtract(7+(moment().days()-1), "days").format(format_str); 
				startEndTime = moment().days(0).format(format_str);
				endStartTime = moment().days(1).format(format_str);
				endEndTime = moment().add(7-moment().days(), "days").format(format_str);;
			}
			else if(date_type == 3){
				/*最近两月*/
				startStartTime = moment().subtract(1, "months").startOf("months").format(format_str);;
				startEndTime = moment().subtract(1, "months").endOf("months").format(format_str);;
				endStartTime = moment().startOf("months").format(format_str);;
				endEndTime = moment().endOf("months").format(format_str);;
			}
			else if(date_type == 4){
				/*最近两季度*/
				startStartTime = moment().subtract(1, "quarter").startOf("quarter").format(format_str);;
				startEndTime = moment().subtract(1, "quarter").endOf("quarter").format(format_str);;
				endStartTime = moment().startOf("quarter").format(format_str);;
				endEndTime = moment().endOf("quarter").format(format_str);;
			}
			else if(date_type == 5){
				/*最近两年*/
				startStartTime = moment().subtract(1, "year").startOf("year").format(format_str);;
				startEndTime = moment().subtract(1, "year").endOf("year").format(format_str);;
				endStartTime = moment().startOf("year").format(format_str);;
				endEndTime = moment().endOf("year").format(format_str);;
			}
			if(date_type == 1){
				$("#last-date").html(startStartTime);
				$("#now-date").html(startEndTime);
				vue.now_date = startEndTime;
				vue.last_data = startStartTime;
			}
			else{
				$("#last-date").html(startStartTime+" - "+startEndTime);
				$("#now-date").html(endStartTime+" - "+endEndTime);
				vue.now_date = endStartTime+" - "+endEndTime;
				vue.last_date = startStartTime+" - "+startEndTime;
			}
			$("#startStartTime").val(startStartTime);
			$("#startEndTime").val(startEndTime);
			$("#endStartTime").val(endStartTime);
			$("#endEndTime").val(endEndTime);
			init_table();
		}
        </script>
    </body>

</html>