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
                                    <span>商家管理</span>
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
                        <h1 class="page-title"> DISTRIBUTOR
                            <small>商家管理</small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                        	
                        		<!-- BEGIN TABLE-->
                        		<div class="portlet box green">
                        			<div class="portlet-title">
                        				<div class="caption">
                        					<i class="fa fa-globe"></i>商家列表
                        				</div>
                        				<div class="tools">
                                            <span class="btn-refresh"><i class="fa fa-refresh"></i></span>
                                        </div>
                        			</div>
                        			<div class="portlet-body flip-scroll">
                        				<div class="row table-tool">
											<div class="col-md-12">
												<input type="search" placeholder="商家名称/联系人 " class="form-control input-small input-inline" v-model.lazy="milkName" onkeyup="if(event==13){init_table()}">
												<button type="button" class="btn btn-success btn-search">搜索</button>
												<button type="button" class="btn btn-danger btn-add">新增</button>
											</div>
										</div>
                        				<table class="table table-bordered table-striped table-condensed flip-content" id="table">
                        					<thead class="flip-content">
                        						<tr>
                        							<th></th>
													<th>商家名称</th>
													<th>地址</th>
													<th>联系人</th>
													<th>联系电话</th>
													<th>销售总额</th>
													<th>已付总额</th>
													<th>未付总额</th>
													<th>操作</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<tr v-for="(item, index) in data_list" :key="item.id">
                        							<td v-text="index+1"></td>
													<td v-text="item.name"></td>
													<td v-text="item.address"></td>
													<td v-text="item.people"></td>
													<td v-text="item.phone"></td>
													<td v-text="item.total_amount"></td>
													<td v-text="item.paid_amount"></td>
													<td v-text="item.unpaid_amount"></td>
													<td>
														<button class="btn btn-sm green btn-outline filter-submit margin-bottom" @click="edit(item)">编辑</button>
														<button class="btn btn-sm red btn-outline filter-submit margin-bottom" @click="deleted(item.ID)">删除</button>
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
				<form onsubmit="return false" class="layer-form" data-parsley-validate>
					<table>
						<template v-if="edit_data != null">
							<tr>
								<td width="70">商家名称</td>
								<td><input name="name" id="name" :value="edit_data.name" readonly /><span class="red"> *</span></td>
							</tr>
							<tr>
								<td width="70">地址</td>
								<td><input name="address" id="address" :value="edit_data.address"/></td>
							</tr>
							<tr>
								<td width="70">联系人</td>
								<td><input name="people" id="people" :value="edit_data.people"/></td>
							</tr>
							<tr>
								<td width="70">联系电话</td>
								<td><input name="phone" id="phone" data-parsley-type="integer"  :value="edit_data.phone"/></td>
							</tr>
						</template>
						<template v-else>
							<tr>
								<td width="70">商家名称</td>
								<td>
									<input name="name" id="name" data-parsley-required="true" data-parsley-error-message="商家名称必填"/>
									<span class="red"> *</span>
								</td>
							</tr>
							<tr>
								<td width="70">地址</td>
								<td><input name="address" id="address" /></td>
							</tr>
							<tr>
								<td width="70">联系人</td>
								<td><input name="people" id="people"/></td>
							</tr>
							<tr>
								<td width="70">联系电话</td>
								<td><input name="phone" id="phone" data-parsley-type="integer"/></td>
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
        	var g_rows = 10;
        	var g_page = 1;
        	
        	
        	$(function(){
        		init_table();
        		
        		$(".btn-cancle").on("click", function(){
        			layer.closeAll();
        		})
        		
        		$(".btn-refresh").on("click", function(){
        			init_table();
        		})
        		
        		$(".btn-add").on("click", function(){
       				edit_vue.edit_data = null;
       				layer.open({
       					type: '1',
						skin: 'layui-layer-molv',
						title: '新增商家',
						area: ['362px', '323px'],
						content: $('#layer-window')
       				});
        		})
        	})
        	
        	var edit_vue = new Vue({
        		delimeters:["(("+"))"],
        		el: "#layer-window",
        		data:{
        			edit_data: null
        		},
				methods:{
					current: function(){
        				if(edit_vue.edit_data == null){
        					$("form").parsley().on("form:success", function(){
        						$.ajax({
            						type: 'post',
            						url: 'distributor/addDistributor.action',
            						data: $('.layer-form').serialize(),
            						success:function(data){
            							data = eval("("+data+")");
            							layer.msg(data.message);
            							if(data.succ){
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
	        						type: 'post',
	        						url: 'distributor/updateDistributor.action',
	        						data: $('.layer-form').serialize(),
	        						success:function(data){
	        							data = eval("("+data+")");
	        							layer.msg(data.message);
	        							if(data.succ){
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
        	
        	
        	var table_vue = new Vue({
        		delimeters:["(("+"))"],
        		el:"#table",
        		data:{
        			distributorInfo: '',
        			data_list: []
        		},
        		methods:{
        			edit: function(item){
        				edit_vue.edit_data = item;
        				layer.open({
           					type: '1',
    						skin: 'layui-layer-molv',
    						title: '编辑商家',
    						area: ['362px', '323px'],
    						content: $('#layer-window')
           				});
        			},
        			deleted:function(id){
        				$.ajax({
        					type: 'post',
        					url: 'distributor/deleteDistributor.action',
        					data: {'distributorID': id},
        					success:function(data){
        						data = eval("("+data+")");
        						layer.msg(data.message);
        						if(data.succ){
        							layer.closeAll("page");
        							init_table();
        						}
        					}
        					
        				})
        			}
        		}
        	})
        	
        	
       		function init_table(rows, page){
       			if(rows == null || rows == 0 || rows == '') rows = g_rows;
       			else g_rows = rows;
       			
       			if(page == null || page == 0 || page == '') page = g_page;
       			else g_page = page;
       			
       			$.ajax({
       				type:'post',
       				url:'distributor/getDistributorByCondition.action',
       				data:{
       					rows: rows,
       					page: page,
       					distributorInfo: table_vue.distributorInfo
       				},
       				beforeSend:function(){
						layer.load(1, {
							shade:[0.1, "#fff"]
						})	
       				},
       				success:function(data){
       					data = eval("("+data+")");
       					var pageTotal = get_page_total(data.total, rows);
       					paginate_tool.init("init_table", pageTotal, data.total, []);
       					table_vue.data_list = data.data;
       					layer.closeAll("loading");
       				},
       				error:function(){
       					layer.closeAll("loading");
       				}
       				
       			})
       		} 
        </script>
    </body>

</html>