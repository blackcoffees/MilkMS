<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->

<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>重庆派派食品有限公司</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />
	
	<%@include file="header.jsp" %>
	
</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand" href="index.jsp"><span>重庆派派食品有限公司</span></a>

				<!-- END LOGO -->

				<!-- BEGIN TOP NAVIGATION MENU -->              

				<ul class="nav pull-right">

					<!-- BEGIN USER LOGIN DROPDOWN -->

					<li class="dropdown user">

						<a href="#" class="dropdown-toggle" data-toggle="dropdown">

							<img alt="" src="media/image/avatar1_small.jpg" />
	
							<span class="username">杨定万</span>

						</a>

					</li>

					<!-- END USER LOGIN DROPDOWN -->

				</ul>

				<!-- END TOP NAVIGATION MENU --> 

			</div>

		</div>

		<!-- END TOP NAVIGATION BAR -->

	</div>

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->

	<div class="page-container">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse" id="menu">

			<!-- BEGIN SIDEBAR MENU -->        

			<ul class="page-sidebar-menu">

				<li>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

					<div class="sidebar-toggler hidden-phone" style="margin-bottom:20px;"></div>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

				</li>

				<li v-for="(item, i) in menu_list" :class="{start:i == 0, active: 'milk.jsp' == item.href, last:i == menu_list.length}" :key="item.href">

					<a :href="item.href">

						<i :class="item.span_icon"></i> 
	
						<span class="title" v-text="item.title"></span>
						
						<span class="arrow"></span>
	
						<span class="selected" v-if="'milk.jsp' == item.href"></span>

					</a>

				</li>

			</ul>

			<!-- END SIDEBAR MENU -->

		</div>

		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->

		<div class="page-content">

			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN PAGE TITLE & BREADCRUMB-->

						<h3 class="page-title">
							MILK <small>牛奶管理</small>
						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index.jsp">Home</a> 

								<i class="fa fa-angle-right"></i>

							</li>

							<li><a href="milk.jsp">Milk</a></li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->
						
						<!-- BEGIN PAGE MAIN -->
						<div class="portlet box green-haze">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-globe"></i>牛奶列表
								</div>
								<div class="tools">
									<a href="javascript:;" class="reload"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="col-md-6 col-sm-12">
									牛奶名称 <input type="search" class="form-control input-small input-inline" v-model.lazy="milkName">
									<button type="button" class="btn btn-primary search-btn">搜索</button>
									<button type="button" class="btn right btn-red">新增</button>
								</div>
								<table class="table table-striped table-bordered table-hover" id="sample_1">
									<thead>
										<tr>
											<th width="30">编号</th>
											<th>牛奶名称</th>
											<th>规格</th>
											<th>进货价</th>
											<th>销售价</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(item, index) in data" :key="item.id">
											<td v-text="index+1" style="text-align:center;"></td>
											<td v-text="item.milk_name"></td>
											<td v-text="item.specifications"></td>
											<td v-text="item.purchase_price"></td>
											<td v-text="item.selling_price"></td>
											<td>
												<span class="label btn-light-blue">编辑</span>
												<span class="label btn-gray">删除</span>
											</td>
										</tr>
									
									</tbody>
								</table>
								<div class="bottom-tool row">
										<div class="pageSelect col-md-6 left">
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
												((rows))
										    	<span class="caret"></span>
											</button>
										  	<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											    <li><a href="javascript:;" @click="change_rows(20)">10</a></li>
											    <li><a href="javascript:;" @click="change_rows(20)">20</a></li>
											    <li><a href="javascript:;" @click="change_rows(30)">30</a></li>
											</ul>
										</div>
									</div>
									<div class="paginate col-md-6 right">
										<ul>
											<li class="start"><i class="fa fa-angle-left"></i></li>
											<li v-for="i in pageTotal" v-text="i" :key="i" :class="{active: i == 1}"></li>
											<li class="end"><i class="fa fa-angle-right"></i></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- END PAGE MAIN -->
					</div>

				</div>

				<!-- END PAGE HEADER-->

			</div>

			<!-- END PAGE CONTAINER-->    

		</div>

		<!-- END PAGE -->

	</div>

	<!-- END CONTAINER -->
	<script src="static/js/common.js" type="text/javascript"></script>
	<script>
		var vue = new Vue({
			delimiters:['((', '))'],
			el:'.page-content',
			data:{
				rows: 10,
				page: 1,
				pageTotal: 1,
				milkName: '',
				data: []
			},
			methods:{
				change_rows:function(number){
					this.rows = number;					
				}
			},
			watch:{
				rows:function(){
					init_table();
				},
				page:function(){
					init_table();
				},
				pageTotal:function(){
					init_table();
				}
				
			}
		})
	
		$(function(){
			App.init();
			init_table();
			
			$('.reload').on('click', function(){
				init_table();
			})
			
		})
		
		function init_table(){
			$.ajax({
				type:'post',
				url:'milk/get_milk_condition.action',
				data:{
					rows: vue.rows,
					page: vue.page,
					milkName: vue.milkName
				},
				success:function(data){
					data = eval("("+data+")");
					vue.pageTotal = data[0].total;
					vue.data = data[0].data;
				}
			})
		}
	</script>
	<!-- END JAVASCRIPTS -->
	
</body>

<!-- END BODY -->

</html>