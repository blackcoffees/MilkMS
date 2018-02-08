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
        <style type="text/css">
        	.daterangepicker_input{
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
                                    <span>销售管理</span>
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
                        <h1 class="page-title"> SALE
                            <small>销售单管理</small>
                        </h1>
                        
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                        	
                        		<!-- BEGIN TABLE-->
                        		<div class="portlet box green">
                        			<div class="portlet-title">
                        				<div class="caption">
                        					<i class="fa fa-globe"></i>销售单列表
                        				</div>
                        				<div class="tools">
                                            <span class="btn-refresh"><i class="fa fa-refresh"></i></span>
                                        </div>
                        			</div>
                        			<div class="portlet-body flip-scroll">
                        				<div class="row table-tool">
											<div class="col-md-12">
												<input type="search" placeholder="销售单号" class="form-control input-small input-inline" onchange="vue.saleID=this.value" onkeyup="if(event.keyCode==13){vue.saleID=this.value;init_table()}">
												<input type="search" placeholder="商家名称" class="form-control input-small input-inline" id="distributorName" onkeyup="if(event.keyCode==13){init_table()}">
												<input type="text" id="time" placeholder="销售时间" class="form-control input-inline" style="width: 260px;"/>
												<div class="dropdown input-inline" id="status-list"> 
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> 
													<span>全部</span>
													<span class="caret"></span> 
													</button> 
													<ul class="dropdown-menu"> 
														<li><a href="javascript:;" data-status="0">全部</a></li>
														<li><a href="javascript:;" data-status="1">已支付</a></li>
														<li><a href="javascript:;" data-status="2">未支付</a></li>
														<li><a href="javascript:;" data-status="3">废弃</a></li>
													</ul> 
												</div>
												
												<button type="button" class="btn btn-success btn-search"><i class="fa fa-search"></i>&nbsp;&nbsp;搜索</button>
												<button type="button" class="btn btn-danger btn-add"><i class="fa fa-plus"></i>&nbsp;&nbsp;新增</button>
												<button type="button" class="btn blue btn-export"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;导出</button>
											</div>
											<form style="display: none">
												<input id="startTime" name="startTime" />
												<input id="endTime" name="endTime" />
												<input id="status" name="status" value="0"/>
											</form>
										</div>
                        				<table class="table table-bordered table-striped dataTable table-condensed flip-content" id="table">
                        					<thead class="flip-content">
                        						<tr>
                        							<th text-align="center"></th>
                        							<th>销售单号</th>
													<th>销售时间</th>
													<th>商家名称</th>
													<th>应收金额</th>
													<th>实收金额</th>
													<th>未收金额</th>
													<th>状态</th>
													<th>支付时间</th>
													<th>操作</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<template v-for="sale in data">
	                        						<tr :key="sale.id">
	                        							<td style="vertical-align: inherit;text-align: center;">
	                        								<span class="row-detail row-detail-close"></span>
	                        							</td>
	                        							<td v-text="sale[0].id"></td>
														<td v-text="sale[0].sale_time"></td>
														<td v-text="sale[0].distributor_name"></td>
														<td>￥((sale[0].receivables_price))</td>
														<td>￥((sale[0].paid_price))</td>
														<td>￥((sale[0].unpaid_price))</td>
														<td v-if="sale[0].status == 1">已支付</td>
														<td v-else-if="sale[0].status == 2">未支付</td>
														<td v-else-if="sale[0].status == 3">废弃</td>
														<td>((sale[0].paid_time))</td>
														<td>
															<button v-if="sale[0].status == 2" class="btn btn-sm blue btn-outline filter-submit margin-bottom" @click="balance(sale[0])"><i class="fa fa-check"></i>&nbsp;&nbsp;结算</button>
															<button v-if="sale[0].status == 2" class="btn btn-sm red btn-outline filter-submit margin-bottom" @click="deleted(sale[0].id)"><i class="fa fa-times"></i>&nbsp;&nbsp;废弃</button>
														</td>
													</tr>
													<tr style="display: none;">
														<td colspan="10">
															<table class="table table-striped table-hover">
																<thead>
																	<tr>
																		<th width="60"></th>
																		<td>商品名称</td>
																		<td>数量</td>
																		<td>销售单价</td>
																		<td>总价格</td>
																	</tr>
																</thead>
																<tbody>
																	<tr v-for="item in sale">
																		<td></td>
																		<td>((item.milk_name))</td>
																		<td>((item.quantity))件</td>
																		<td>￥((item.price))</td>
																		<td>￥((item.total_amount))</td>
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
		<div id="layer-window" style="display:none">
			<div class="col-mid-6">
				<form class="layer-form" data-parsley-validate onsubmit="return false">
					<table>
						<tr>
							<td width="70">应收金额:</td>
							<td>
								<label name="receivables_amount" type="receivables_amount" id="receivables_amount" style="font-size:28px"></label>
							</td>
						</tr>
						<tr>
							<td width="70">结算金额:</td>
							<td>
								<input name="amount" type="number" id="amount" data-parsley-type="integer" style="color:red;"/>
								<input id="saleID" style="display:none"/>
							</td>
						</tr>
					</table>
					<div class="layer-button">
						<input type="submit" class="btn btn-danger btn-submit" onclick="current()" value="确定"/>
						<button type="button" class="btn grey-cascade btn-cancle" >取消</button>
					</div>
				</form>
			</div>
		</div>
		
		<div id="layer-export" style="display:none">
			<div class="col-mid-6">
				<form class="layer-form" data-parsley-validate onsubmit="return false">
					<table>
						<tr>
							<td width="70">采购时间</td>
							<td><input name="export_time" id="export_time"/><span class="red"> *</span></td>
						</tr>
					</table>
					<input style="display:none" id="exportStartTime"/>
					<input style="display:none" id="exportEndTime"/>
					<div class="layer-button">
						<input type="button" class="btn btn-danger btn-submit btn-export-sure" value="确定"/>
					<button type="button" class="btn grey-cascade btn-cancle" >取消</button>
					</div>
				</form>
			</div>
		</div>
		<!-- END LAYER -->
		
        <script src="static/js/common.js" type="text/javascript"></script>
        <script src="static/js/paginate_tool.js" type="text/javascript"></script>
        <script>
        var vue = new Vue({
			delimiters:['((', '))'],
			el:'#table',
			data:{
				saleID: '',
				data: []
			},
			methods:{
				deleted: function(saleID){
					$.ajax({
						type:"get",
						url:"sale/abandonSale.action",
						data:{"saleID": saleID},
						success:function(data){
							data = eval("("+data+")");
							layer.msg(data.message);
							if(data.succ){
								init_table();
							}
						}
					})
				},
				balance: function(sale){
					$("#receivables_amount").html("￥"+sale.unpaid_amount);
					$("#amount").val(sale.unpaid_amount);
					$("#saleID").val(sale.id);
					layer.open({
						type: '1',
						skin: 'layui-layer-molv',
						title: '结算',
						area: ['362px', '231px'],
						content: $('#layer-window')
					})
				}
			}
		})
		
        function current(){
			var saleID = $("#saleID").val();
			var amount = $("#amount").val();
			$.ajax({
				type: 'post',
				url: 'sale/balanceSale.action',
				data:{
					'saleID': saleID,
					'amount': amount
				},
				success:function(data){
					data = eval("("+data+")");
					layer.closeAll("page");
					layer.msg(data.message);
					init_table();
				}
			})
		}
		
		$(function(){
			init_table();
			$('.btn-add').on('click', function(){
				location.href="addSale.jsp";
			});
			
			$(".btn-cancle").on('click', function(){
				layer.closeAll();
			})
			
			$('.btn-search').on('click', function(){
				init_table();
			})
			
			$('.btn-refresh').on('click', function(){
				init_table();
			})
			
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
			
			/*导出*/
			$(".btn-export").click(function(){
				layer.open({
					type: '1',
					skin: 'layui-layer-molv',
					title: '导出',
					area: ['362px', '200px'],
					content: $('#layer-export')
				})
			});
			
			$(".btn-export-sure").on("click",function(){
				var startTime = $("#exportStartTime").val();
				var endTime = $("#exportEndTime").val();
				$.ajax({
					type: 'post',
					url: 'report/exportExcel.action',
					data:{
						'startTime': startTime,
						'endTime': endTime,
						'type': 2
					},
					beforeSend:function(){
						layer.load(1, {
							shade: [0.1, '#fff']
						});
					},
					error: function(){
						layer.closeAll("loading");
					},
					success:function(data){
						layer.closeAll("loading");
						data = eval("("+data+")");
						layer.msg(data.message);
					}
				})
			});
			
			$("#time").daterangepicker({
                showDropdowns: true,
				autoUpdateInput: false,
				showWeekNumbers: false,
				linkedCalendars: false,
				drops: "down",
				"locale": {
                    format: 'YYYY-MM-DD',
                    applyLabel: "应用",
                    cancelLabel: "取消",
                    daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ], 
                    monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',  
                                   '七月', '八月', '九月', '十月', '十一月', '十二月' ],
                }
			},
            function(start, end, label){
				if(!this.startDate)
                	$("#time").val('');
				else{
					$("#time").val(this.startDate.format(this.locale.format) + " 至 " + this.endDate.format("YYYY-MM-DD"));
					$("#startTime").val(this.startDate.format(this.locale.format));
					$("#endTime").val(this.endDate.format("YYYY-MM-DD"));
				}
            });
			
			$("#time").on('apply.daterangepicker', function(ev, picker) {
				$("#time").val(picker.startDate.format('YYYY-MM-DD') + " 至 " + picker.endDate.format("YYYY-MM-DD"));
				$("#startTime").val(picker.startDate.format('YYYY-MM-DD'));
				$("#endTime").val(picker.endDate.format("YYYY-MM-DD"));
            });
			
			/*下拉框*/
			$("#status-list").on('click', 'button.btn', function(e){
				e.stopPropagation();
				$(this).siblings('ul.dropdown-menu').stop().slideDown('fase');
			}).on('click', 'ul.dropdown-menu li', function(e){
				e.stopPropagation();
				$(this).parents('ul.dropdown-menu').stop().slideToggle('fast');
				$(this).parents("ul.dropdown-menu").prev("button").find("span").first().html($(this).find("a").html());
				$("#status").val($(this).find("a").attr("data-status"));
			});
			$('body').on('click', function(e){
				e.stopPropagation();
				$("#status-list").find("ul.dropdown-menu").stop().slideUp('fast');
			})
			
			$("#export_time").daterangepicker({
                showDropdowns: true,
				autoUpdateInput: false,
				showWeekNumbers: false,
				linkedCalendars: false,
				drops: "down",
				"locale": {
                    format: 'YYYY-MM-DD',
                    applyLabel: "应用",
                    cancelLabel: "取消",
                    daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ], 
                    monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',  
                                   '七月', '八月', '九月', '十月', '十一月', '十二月' ],
                }
			},
            function(start, end, label){
				if(!this.startDate)
                	$("#export_time").val('');
				else{
					$("#export_time").val(this.startDate.format(this.locale.format) + " 至 " + this.endDate.format("YYYY-MM-DD"));
					$("#exportStartTime").val(this.startDate.format(this.locale.format));
					$("#exportEndTime").val(this.endDate.format("YYYY-MM-DD"));
				}
            });
			
			$("#export_time").on('apply.daterangepicker', function(ev, picker) {
				$("#export_time").val(picker.startDate.format('YYYY-MM-DD') + " 至 " + picker.endDate.format("YYYY-MM-DD"));
				$("#exportStartTime").val(picker.startDate.format('YYYY-MM-DD'));
				$("#exportEndTime").val(picker.endDate.format("YYYY-MM-DD"));
            });
		})
		
		function init_table(rows, page){
			if(typeof(rows) == 'undefined')
				rows = 10;
			if(typeof(page) == 'undefined')
				page = 1;
			var saleID = vue.saleID;
			if(saleID == '' || saleID == null){
				saleID = 0;				
			}
			else if(saleID != '' && !Number(saleID)){
				layer.msg("销售单号必须是数字");
				return;
			}
			
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var distributorName = $("#distributorName").val();
			var status =$("#status").val();
			$.ajax({
				type:'get',
				url:'sale/getSaleByCondition.action',
				data:{
					rows: rows,
					page: page,
					saleID: saleID,
					startTime: startTime,
					endTime: endTime,
					distributorName: distributorName,
					status: status					
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