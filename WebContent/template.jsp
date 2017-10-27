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
                                    <span>Dashboard</span>
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
                        <h1 class="page-title"> Admin Dashboard
                            <small>statistics, charts, recent events and reports</small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        
                        <!-- BEGIN PAGE MAIN-->
                        <div class="row">
                        	<div class="col-md-12">
                        	
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
													<th>编号</th>
													<th>牛奶名称</th>
													<th>规格</th>
													<th>进货价</th>
													<th>销售价</th>
													<th>操作</th>
												</tr>
                        					</thead>
                        					<tbody>
                        						<tr v-for="(item, index) in data" :key="item.id">
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
                        
                        <div class="row">
                        	<form data-validate-parsley id="form">
                        		<div>
      <label for="userName">姓名：</label>
	  <input type="text" id="userName" name="userName" data-parsley-required="true"/>
	</div>
	
	<div>
      <label for="email">邮箱：</label>
	  <input type="text" id="email" name="email" data-parsley-required="true" data-parsley-type="email"/>
	</div>
	
	<div>
      <label for="age">年龄：</label>
	  <input type="text" id="age" name="age" data-parsley-type="integer" />
	</div>
	
	<div>
      <label for="age1">测试trigger：</label>
	  <input type="text" id="age1" name="age1" data-parsley-type="integer" data-parsley-trigger="change"/>
	</div>
	
	<div>
      <label for="salary">薪资：</label>
	  <input type="text" id="salary" name="salary" data-parsley-type="digits"/>
	</div>
	
	<div>
      <label for="deposit">存款：</label>
	  <input type="text" id="deposit" name="deposit" data-parsley-type="number"/>
	</div>
	
	<div>
      <label for="extractedCode">提取码</label>
	  <input type="text" id="extractedCode" name="extractedCode" data-parsley-type="alphanum"/>
	</div>
	
	<div>
      <label for="personWebSite">个人网站：</label>
	  <input type="text" id="personWebSite" name="personWebSite" data-parsley-type="url"/>
	</div>
	
	<div>
      <label for="hobby">特长：</label>
	  <input type="text" id="hobby" name="hobby" data-parsley-length="[6, 10]"/>
	</div>
	
	<div>
      <label for="minValue">最小值：</label>
	  <input type="text" id="minValue" name="minValue" data-parsley-min="5"/>
	</div>
	
	<div>
      <label for="maxValue">最大值：</label>
	  <input type="text" id="maxValue" name="maxValue" data-parsley-max="6"/>
	</div>
	
	<div>
      <label for="rangeValue">数值范围：</label>
	  <input type="text" id="rangeValue" name="rangeValue" data-parsley-range="[6, 10]"/>
	</div>
	
	<div>
      <label for="regularExpression">正则表达式：</label>
	  <input type="text" id="regularExpression" name="regularExpression" data-parsley-pattern="\d{2}"/>
	</div>
	
	<div>
      <label>最少选中几项复选：</label>
	  <input type="checkbox" name="xCheckbox" data-parsley-required="true"/>
	  <input type="checkbox" name="xCheckbox" data-parsley-mincheck="2"/>
	  <input type="checkbox" name="xCheckbox"/>
	</div>
	
	<div>
      <label>最多选中几项复选：</label>
	  <input type="checkbox" name="yCheckbox" data-parsley-required="true"/>
	  <input type="checkbox" name="yCheckbox" data-parsley-maxcheck="2"/>
	  <input type="checkbox" name="yCheckbox"/>
	</div>
	
	<div>
      <label>选中几项复选（范围）：</label>
	  <input type="checkbox" name="zCheckbox" data-parsley-required="true"/>
	  <input type="checkbox" name="zCheckbox" data-parsley-check="[1,2]"/>
	  <input type="checkbox" name="zCheckbox"/>
	</div>
	
	<div>
      <label>密码：</label>
	  <input type="password" id="password1"/>
	  <input type="password" data-parsley-equalto="#password1"/>
	</div>
	
	<div>
	  <input type="submit" value="提交"/>
	</div>
                        	</form>
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
								<td><input name="purchase_price" id="purchase_price" v-model="edit_data.purchase_price" @blur="check_price" @keyup="check_price_format" data-validat="false"/> 元<span class="red"> *</span></td>
							</tr>
							<tr>
								<td width="70">销售价</td>
								<td><input name="selling_price" id="selling_price" v-model="edit_data.selling_price" @blur="check_price" @keyup="check_price_format" data-validat="false"/> 元<span class="red"> *</span></td>
							</tr>
						</template>
						<template v-else>
							<tr>
								<td width="70">商品编号</td>
								<td>
									<input name="number" type="text" id="number" data-parsley-required="true" data-parsley-length="[4,4]"
										data-parsley-error-message="商品编号长度只能是4位" data-parsley-required-message="商品编号必须填写" data-parsley-trigger="change" />
									<span class="red"> *</span>
								</td>
							</tr>
							<tr>
								<td width="70">牛奶名称</td>
								<td>
									<input name="milk_name" id="milk_name" data-validat="true" data-parsley-required="true"
										data-parsley-required-message="牛奶名称必填" data-parsley-trigger="change"/>
									<span class="red"> *</span>
								</td>
							</tr>
							<tr>
								<td width="70">规格</td>
								<td>
									<input name="specifications" id="specifications" value="件" readonly/>
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
        
        </script>
    </body>

</html>