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
                        		<li class="nav-item" :class="{start: i == 1, active: menu.href=='javascript:void(0)', open: menu.href=='javascript:void(0)', hasChildren: menu.children!=null}">
	                                <a :href="menu.href" class="nav-link nav-toggle">
	                                    <i :class="menu.span_icon"></i>
	                                    <span class="title" v-text="menu.title"></span>
	                                    <span class="selected"></span>
	                                    <span class="arrow"></span>
	                                </a>
	                                <ul v-if="menu.children" class="sub-menu" >
	                                	<li v-for="child in menu.children" :class="child.href==now_href ? 'nav-sub-menu-hover': ''">
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
                        <h1 class="page-title"> Procurement Report
                            <small>采购报表</small>
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
												<div class="number">
													 1349
												</div>
												<div class="desc">
													 采购总数
												</div>
											</div>
											<a class="more" href="#">
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
												<div class="number">
													 12,5M$
												</div>
												<div class="desc">
													 采购总额
												</div>
											</div>
											<a class="more" href="#">
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
												<div class="number">
													 549
												</div>
												<div class="desc">
													 采购总件数
												</div>
											</div>
											<a class="more" href="#">
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
												<div class="number">
													 +89%
												</div>
												<div class="desc">
													 热销
												</div>
											</div>
											<a class="more" href="#">
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
                        					<i class="fa fa-globe"></i>商品列表
                        				</div>
                        				<div class="tools">
                                            <span class="btn-refresh"><i class="fa fa-refresh"></i></span>
                                        </div>
                        			</div>
                        			<div class="portlet-body flip-scroll">
                        				<table class="table table-bordered table-striped table-condensed flip-content" id="table">
                        					<thead class="flip-content">
                        						<tr>
                        							<th>商品号</th>
													<th>商品编号</th>
													<th>牛奶名称</th>
													<th>规格</th>
													<th>进货价</th>
													<th>销售价</th>
													<th>操作</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<tr v-for="(item, index) in data" :key="item.id">
                        							<td v-text="item.id"></td>
													<td v-text="item.number"></td>
													<td v-text="item.milk_name"></td>
													<td v-text="item.specifications"></td>
													<td v-text="item.purchase_price"></td>
													<td v-text="item.selling_price"></td>
													<td>
														<button class="btn btn-sm green btn-outline filter-submit margin-bottom" @click="edit(item)">编辑</button>
														<button class="btn btn-sm red btn-outline filter-submit margin-bottom" @click="deleted(item.number)">删除</button>
													</td>
												</tr>
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
		
		<!-- BEGIN Layer -->
		<div id="layer-window" style="display:none">
			<div class="col-mid-6">
				<form class="layer-form" data-parsley-validate onsubmit="return false">
					<table>
						<template v-if="edit_data != null">
							<tr>
								<td width="70">商品编号</td>
								<td><input name="number" id="number" v-model="edit_data.number" data-validat="false" readonly /><span class="red"> *</span></td>
							</tr>
							<tr>
								<td width="70">牛奶名称</td>
								<td><input name="milk_name" id="milk_name" v-model="edit_data.milk_name" data-validat="true" readonly/><span class="red"> *</span></td>
							</tr>
							<tr>
								<td width="70">规格</td>
								<td><input name="specifications" id="specifications" value="件" readonly data-validat="true"/><span class="red"> *</span></td>
							</tr>
							<tr>
								<td width="70">进货价</td>
								<td><input name="purchase_price" id="purchase_price" :value="edit_data.purchase_price" @blur="check_price" @keyup="check_price_format" data-validat="false"/> 元<span class="red"> *</span></td>
							</tr>
							<tr>
								<td width="70">销售价</td>
								<td><input name="selling_price" id="selling_price" :value="edit_data.selling_price" @blur="check_price" @keyup="check_price_format" data-validat="false"/> 元<span class="red"> *</span></td>
							</tr>
						</template>
						<template v-else>
							<tr>
								<td width="70">商品编号</td>
								<td>
									<input name="number" type="number" id="number" data-parsley-type="integer" data-parsley-required="true" data-parsley-length="[4,4]"
										data-parsley-error-message="商品编号只能是4位数字" data-parsley-required-message="商品编号必须填写" data-parsley-trigger="change" />
									<span class="red"> *</span>
								</td>
							</tr>
							<tr>
								<td width="70">牛奶名称</td>
								<td>
									<input name="milk_name" id="milk_name" data-parsley-required="true"
										data-parsley-required-message="牛奶名称必填" data-parsley-trigger="change"/>
									<span class="red"> *</span>
								</td>
							</tr>
							<tr>
								<td width="70">规格</td>
								<td>
									<select name="specifications" id="specifications" data-parsley-required="true" data-parsley-required-message="规格必填">
										<option></option>
										<option>件</option>
										<option>提</option>
										<option>个</option>
									</select>
									<span class="red"> *</span>
								</td>
							</tr>
							<tr>
								<td width="70">进货价</td>
								<td>
									<input name="purchase_price" id="purchase_price" @blur="check_price" @keyup="check_price_format" data-parsley-required="true"
										data-parsley-required-message="进货价必填"/> 元
									<span class="red"> *</span>
								</td>
							</tr>
							<tr>
								<td width="70">销售价</td>
								<td>
									<input name="selling_price" id="selling_price" @blur="check_price" @keyup="check_price_format" data-parsley-required="true"
										data-parsley-required-message="销售价必填"/> 元
									<span class="red"> *</span>
								</td>
							</tr>
						</template>
					</table>
					<div class="layer-button">
						<input type="submit" class="btn btn-danger btn-submit" @click="current" value="确定"/>
						<button type="button" class="btn grey-cascade btn-cancle" >取消</button>
					</div>
				</form>
			</div>
		</div>
		<!-- END Layer -->
		
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
				edit: function(milk){
					edit_vue.edit_data = milk;
					layer.open({
						type: '1',
						skin: 'layui-layer-molv',
						title: '编辑牛奶',
						area: ['362px', '368px'],
						content: $('#layer-window')
					})
				},
				deleted: function(number){
					$.ajax({
						type:"post",
						url:"milk/delete_milk.action",
						data:{"number": number},
						success:function(data){
							data = eval("("+data+")");
							layer.msg(data[0].message);
							if(data[0].succ){
								init_table();
							}
						}
					})
				},
			}
		})
	
		var edit_vue = new Vue({
			delimiters:['((', '))'],
			el:'#layer-window',
			data:{
				edit_data: null
			},
			methods:{
				check_price_format:function(event){
					var obj = event.target;
				    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
				    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
				    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数  
				    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
				        obj.value= parseFloat(obj.value);
				    } 
				},
				check_price:function(event){
					var obj = event.target;
					if(obj.value > 20000){
						layer.tips('金额不能超过20000且只能保留两位小数', obj);
						$(obj).css('color', 'red');
						$(obj).attr('data-validat', 'false');
					}
					else{
						$(obj).css('color', 'black');
						$(obj).attr('data-validat', 'true');
					}
				},
				current:function(){
					if(this.edit_data != null){
						$("form").parsley().on("form:success", function(){
							$.ajax({
								type:'post',
								url:'milk/edit_milk.action',
								data:$('.layer-form').serialize(),
								success:function(data){
									data = eval("("+data+")");
									layer.msg(data[0].message);
									if(data[0].succ){
										layer.closeAll("page");
										init_table();
									}						
								}
							});
						});
					}
					else{
						$("form").parsley().on("form:success", function(){
							$.ajax({
								type:'post',
								url:'milk/add_milk.action',
								data:$('.layer-form').serialize(),
								success:function(data){
									data = eval("("+data+")");
									layer.msg(data[0].message);
									if(data[0].succ){
										layer.closeAll("page");
										init_table();
									}						
								}
							});
						});
					}
				}
			}
		})
		$(function(){
			init_table();
			$('.btn-add').on('click', function(){
				edit_vue.edit_data = null;
				
				layer.open({
					type: '1',
					skin: 'layui-layer-molv',
					title: '新增牛奶',
					area: ['362px', '368px'],
					content: $('#layer-window')
				})
			})
			
			$(".btn-cancle").on('click', function(){
				layer.closeAll();
				edit_vue.edit_data = null;
			})
			
			$('.btn-search').on('click', function(){
				init_table();
			})
			
			$('.btn-refresh').on('click', function(){
				init_table();
			})
			
			$("#purchaseTime").daterangepicker({
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
                	$("#purchaseTime").val('');
				else
					$("#purchaseTime").val(this.startDate.format(this.locale.format) + " 至 " + this.endDate.format(this.locale.formate));
            });
			
			$("#purchaseTime").on('apply.daterangepicker', function(ev, picker) {
				$("#purchaseTime").val(picker.startDate.format('YYYY-MM-DD') + " 至 " + picker.endDate.format("YYYY-MM-DD"));
            });
		})
		
		var g_rows = 10;
        var g_page = 1;
        
		function init_add_layer(){
			$("#number").val("");
			$("#milk_name").val("");
			$("#purchase_price").val("");
			$("#selling_price").val("");
		}        
		
		function init_table(rows, page){
			if(rows != '' && rows > 0)
				g_rows = rows;
			else
				rows = g_rows;
			
			if(page != '' && page > 0)
				g_page = page;
			else
				page = g_page;
			
			$.ajax({
				type:'post',
				url:'milk/get_milk_condition.action',
				data:{
					rows: rows,
					page: page,
					milkInfo: vue.milkName
				},
				success:function(data){
					data = eval("("+data+")");
					
					//一共生成多少页
					page_total = get_page_total(data[0].total, g_rows);
					paginate_tool.init("init_table", page_total, data[0].total, []);
					
					vue.data = data[0].data;
					layer.closeAll('loading');
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