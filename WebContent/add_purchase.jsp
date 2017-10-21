<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->

<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<!-- <title>重庆派派食品有限公司</title> -->
	<title>test</title>

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

				<!--<a class="brand" href="index.jsp"><span>重庆派派食品有限公司</span></a> -->

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

				<li v-for="(item, i) in menu_list" :class="{start:i == 0, active: 'purchase.jsp' == item.href, last:i == menu_list.length}" :key="item.href">

					<a :href="item.href">

						<i :class="item.span_icon"></i> 
	
						<span class="title" v-text="item.title"></span>
						
						<span class="arrow"></span>
	
						<span class="selected" v-if="'add_purchase.jsp' == item.href"></span>

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
							PURCHASE <small>采购管理</small>
						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="fa fa-home"></i>

								<a href="index.jsp">Home</a> 

								<i class="fa fa-angle-right"></i>

							</li>

							<li>
								<a href="purchase.jsp">采购管理</a> 
								<i class="fa fa-angle-right"></i>
							</li>
							
							<li>
								<a href="add_purchase.jsp">新增采购单</a> 
							</li>
						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->
						
						<!-- BEGIN PAGE MAIN -->
						<div class="portlet box green-haze">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-globe"></i>新增采购单
								</div>
							</div>
							<div class="portlet-body" id="sample_1">
								<div class="col-md-11 col-sm-12">
									<button type="button" class="btn right btn-red" @click="add">新增一行</button>
								</div>
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>牛奶名称</th>
											<th>规格</th>
											<th>进货价</th>
											<th>数量</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(item, index) in data" :key="item.id">
											<td v-text="item.milk_name"></td>
											<td v-text="item.specifications"></td>
											<td v-text="item.purchase_price"></td>
											<td v-text="item.selling_price"></td>
											<td>
												<span class="label btn-gray" @click="deleted(item.number)">删除</span>
											</td>
										</tr>
									
									</tbody>
								</table>
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
	
	<!-- BEGIN Layer -->
	
	<!-- END Layer -->
	
	<!-- END CONTAINER -->
	<script src="static/js/common.js" type="text/javascript"></script>
	<script>
		var vue = new Vue({
			delimiters:['((', '))'],
			el:'#sample_1',
			data:{
				data:[]
			},
			methods:{
				add:function(){
					this.data.push({'':''});
				}
			}
		})
		
	</script>
	
	<!-- END JAVASCRIPTS -->
	
</body>

<!-- END BODY -->

</html>