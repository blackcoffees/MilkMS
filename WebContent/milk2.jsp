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

								<i class="fa fa-home"></i>

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
									<a href="javascript:;" class="reload" onclick="init_table()"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="col-md-6 col-sm-12">
									牛奶名称 <input type="search" class="form-control input-small input-inline" v-model.lazy="milkName">
									<button type="button" class="btn btn-primary search-btn">搜索</button>
									<button type="button" class="btn right btn-red btn-add">新增</button>
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
											<td v-text="item.number" style="text-align:center;"></td>
											<td v-text="item.milk_name"></td>
											<td v-text="item.specifications"></td>
											<td v-text="item.purchase_price"></td>
											<td v-text="item.selling_price"></td>
											<td>
												<span class="label btn-light-blue" @click="edit(item)">编辑</span>
												<span class="label btn-gray" @click="deleted(item.number)">删除</span>
											</td>
										</tr>
									
									</tbody>
								</table>
								<div class="paginate-tool row">
									<div class="pageSelect col-md-6 left">
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
												((rows))
										    	<span class="caret"></span>
											</button>
										  	<ul class="dropdown-menu">
											    <li><a href="javascript:;" @click="change_rows(10)">10</a></li>
											    <li><a href="javascript:;" @click="change_rows(20)">20</a></li>
											    <li><a href="javascript:;" @click="change_rows(30)">30</a></li>
											</ul>
										</div>
									</div>
									<div class="paginate col-md-6 right">
										<ul>
											<li class="start" @click="pre_page"><i class="fa fa-angle-left"></i></li>
											<template v-for="i in showPage">
												<li v-text="i" :key="i" :class="{active: i == 1}" @click="change_page(i, $event)"></li>
											</template>
											<li class="end" @click="next_page"><i class="fa fa-angle-right"></i></li>
										</ul>
									</div>
								</div>
								<paginate_tool></paginate_tool>
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
	<div id="layer-window" style="display:none">
		<div class="col-mid-6">
			<form onsubmit="return false" class="layer-form">
				<table>
					<template v-if="edit_data != null">
						<tr>
							<td width="70">编号</td>
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
							<td width="70">编号</td>
							<td><input name="number" id="number" onkeyup="value=value.replace(/[^0-9]/g, '')" onblur="if(this.value.length!=4){layer.tips('编号长度只能是4位', this);$(this).css('color','red');$(this).attr('data-validat', 'false');}else{$(this).attr('data-validat', 'true');$(this).css('color', 'black')}" data-validat="false"/><span class="red"> *</span></td>
						</tr>
						<tr>
							<td width="70">牛奶名称</td>
							<td><input name="milk_name" id="milk_name" data-validat="true"/><span class="red"> *</span></td>
						</tr>
						<tr>
							<td width="70">规格</td>
							<td><input name="specifications" id="specifications" value="件" readonly data-validat="true"/><span class="red"> *</span></td>
						</tr>
						<tr>
							<td width="70">进货价</td>
							<td><input name="purchase_price" id="purchase_price" @blur="check_price" @keyup="check_price_format" data-validat="false"/> 元<span class="red"> *</span></td>
						</tr>
						<tr>
							<td width="70">销售价</td>
							<td><input name="selling_price" id="selling_price" @blur="check_price" @keyup="check_price_format" data-validat="false"/> 元<span class="red"> *</span></td>
						</tr>
					</template>
				</table>
			</form>
			<div class="layer-button">
				<button type="button" class="btn btn-red" @click="current">确定</button>
				<button type="button" class="btn btn-gray btn-cancle" >取消</button>
			</div>
		</div>
	</div>
	<!-- END Layer -->
	
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
				showPage:[],
				milkName: '',
				data: []
			},
			methods:{
				change_rows:function(number){
					this.rows = number;					
				},
				change_page:function(i, event){
					if(event.target.className == 'start' ||event.target.className == 'end'){
						;
					}
					else{
						$('.paginate ul li').removeAttr('class');
						$('.paginate ul li:first-child').attr('class', 'start');
						$('.paginate ul li:last-child').attr('class', 'end');
						$(event.target).attr('class', 'active');
						this.page = event.target.innerText;
					}
				},
				pre_page:function(){
					if(this.page == 1);
					else{
						this.page = this.page-1;
						var active = $('.paginate li.active');
						active.removeAttr('class');
						active.prev().attr('class', 'active');
					}
				},
				next_page:function(){
					if(this.page == this.pageTotal);
					else{
						this.page = this.page+1;
						var active = $('.paginate li.active');
						active.removeAttr('class');
						active.next().attr('class', 'active');
					}
				},
				edit: function(milk){
					edit_vue.edit_data = milk;
					layer.open({
						type: '1',
						skin: 'layui-layer-molv',
						title: '编辑牛奶',
						area: ['362px', '339px'],
						content: $('#layer-window')
					})
				},
				deleted: function(number){
					$.ajax({
						type:"post",
						url:"milk/delete_milk.action",
						data:{"number": number},
						success:function(data){
							if(data.succ){
								layer.msg("删除成功");
								init_table();
							}
							else{
								layer.msg("删除失败");								
							}
						}
					})
				},
				showPaged:function(){
					this.showPage = [];
					if(this.pageTotal > 10){
						if(this.page >= 5){
							var page_end = parseInt(this.page) + 5;
							this.showPage.push(1);
							this.showPage.push("···");
							for(i=this.page;i<page_end;i++){
								this.showPage.push(i);
							}
							this.showPage.push("···");
							this.showPage.push(this.pageTotal);
						}
						else{
							for(i=1;i<6;i++){
								this.showPage.push(i);
							}
							this.showPage.push("···");
							this.showPage.push(this.pageTotal);
						}
					}
					else{
						for(i=1;i<this.pageTotal;i++){
							this.showPage.push(i);					
						}
					}
				}
			},
			watch:{
				rows:function(){
					init_table();
				},
				page:function(){
					init_table();
					showPaged();
				},
				pageTotal:function(){
					init_table();
					this.showPaged();
				}
				
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
					if(obj.value > 2000){
						layer.tips('金额不能超过2000且只能保留两位小数', obj);
						$(obj).css('color', 'red');
						$(obj).attr('data-validat', 'false');
					}
					else{
						$(obj).css('color', 'black');
						$(obj).attr('data-validat', 'true');
					}
				},
				current:function(){
					var inputs = $('.layer-form input');
					var is_validat = true;
					inputs.each(function(){
						if(!$(this).attr('data-validat')){
							layer.msg('输入错误，请检查并重新输入');
							is_validat = false;
							return;
						}
					});
					if(!is_validat) return;
					if(this.edit_data != null){
						$.ajax({
							type:'post',
							url:'milk/edit_milk.action',
							data:$('.layer-form').serialize(),
							success:function(data){
								data = eval("("+data+")");
								console.info(data);
								if(data[0].succ){
									layer.closeAll();
									init_table();
									layer.msg('编辑成功');
								}						
								else{
									layer.msg(data[0].message);
								}
							}
						});
					}
					else{
						$.ajax({
							type:'post',
							url:'milk/add_milk.action',
							data:$('.layer-form').serialize(),
							success:function(data){
								data = eval("("+data+")");
								if(data[0].succ){
									layer.msg('新增成功');
									init_table();
									layer.closeAll();
								}						
								else{
									layer.msg(data[0].message);
								}
							}
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
					area: ['362px', '339px'],
					content: $('#layer-window')
				})
			})
			
			$(".btn-cancle").on('click', function(){
				layer.closeAll();
				edit_vue.edit_data = null;
			})
			
			$('.search-btn').on('click', function(){
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
					var shang = Math.floor(data[0].total/vue.rows);
					var yushu = data[0].total%vue.rows;
					if(yushu > 0)
						shang += 1;
					vue.pageTotal = shang;
					
					vue.pageTotal = 100;
					vue.showPaged();
					
					vue.data = data[0].data;
					layer.closeAll();
				},
				beforeSend:function(){
					layer.load(1, {
						shade: [0.1, '#fff']
					});
				},
				error: function(){
					layer.closeAll();
				}
				
			})
		}
	</script>
	<!-- END JAVASCRIPTS -->
	
</body>

<!-- END BODY -->

</html>