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

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->

				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">

					<img src="media/image/menu-toggler.png" alt="" />

				</a>          

				<!-- END RESPONSIVE MENU TOGGLER -->            

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
				
				<li v-for="(item, i) in menu_list" :class="{start:i == 0, active: 'milk.jsp' == item.href}" :key="item.href">

					<a :href="item.href">

						<i :class="item.span_icon"></i> 
	
						<span class="title" v-text="item.title"></span>
	
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
							MILK <small>milk manage</small>
						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index.jsp">Home</a> 

								<i class="fa fa-angle-right"></i>

							</li>

							<li><a href="500.jsp">500</a></li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->
						
						<!-- BEGIN PAGE MAIN -->
	                    <div class="row">
	                        <div class="col-md-12 page-500">
	                            <div class=" number font-red"> 500 </div>
	                            <div class=" details">
	                                <h3>服务器发生异常错误</h3>
	                                <p> 请立刻联系管理员，我们会尽快为你处理
	                                    <br/>
	                                </p>
	                                <p>
	                                    <a href="index.jsp" class="btn-return-home btn"> 返回 首页 </a>
	                                    <br>
									</p>
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
				milkName:function(){
					init_table();
				}
			},
			beforeUpdated:function(){
				init_table();
			}
		})
	
		$(function(){
			App.init();
			init_table();
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