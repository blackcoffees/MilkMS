<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>重庆派派食品有限公司</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="author" />
<%@include file="header.jsp"%>
<link rel="shortcut icon" href="favicon.ico" />
</head>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<div class="page-wrapper">

		<div class="page-header navbar navbar-fixed-top">
			<div class="page-header-inner ">

				<!-- BEGIN LOGO -->
				<div class="page-logo">
					<a href="index.jsp"> <label class="logo-default">重庆派派食品有限公司</label>
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
                        		<li class="nav-item" :class="{start: i == 1, active: menu.href=='sale.jsp', open: menu.href==now_href}">
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
							<li><a href="index.jsp">Home</a> <i
								class="fa fa-angle-right"></i></li>
							<li><span>销售管理</span></li>
						</ul>
						<div class="page-toolbar">
							<div id="dashboard-report-range"
								class="pull-right tooltips btn btn-sm" data-container="body"
								data-placement="bottom"
								data-original-title="Change dashboard date range">
								<i class="icon-calendar"></i>&nbsp; <span
									class="thin uppercase hidden-xs"></span>&nbsp; <i
									class="fa fa-angle-down"></i>
							</div>
						</div>
					</div>
					<!-- END PAGE BAR -->

					<!-- BEGIN PAGE TITLE-->
					<h1 class="page-title">
						SALE <small>销售管理</small>
					</h1>
					<!-- END PAGE TITLE-->

					<!-- BEGIN PAGE MAIN-->

					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-equalizer"></i>新增销售单
							</div>
							<div class="tools"></div>
						</div>
						<div class="portlet-body form">
							
							<input id="distributorID" style="display: none" />
							<input id="status" style="display:none" value="2"/>
							
							<!-- BEGIN FORM-->
							<form action="#" class="horizontal-form" data-parsley-validate
								onsubmit="return false">
								<div class="form-body">
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<i class="icon-speedometer left" style="padding-top: 7px;"></i>
												<h3 class="control-label col-md-3" style="font-size: 18px; padding-top: 4px;">销售时间</h3>
												<div class="col-md-7">
													<div class="input-group date btn-datepicker" data-provide="datepicker">
														<input type="text" class="form-control" id="purchase_time" readonly name="datepicker" style="width: 200px" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
												</div>
												<div>
													<span class="red">*</span>
												</div>
											</div>
										</div>
										<div class="col-md-4" style="margin-left: 18px">
											<i class="icon-user left" style="padding-top: 7px;"></i>
											<h3 class="control-label col-md-4" style="font-size: 18px; padding-top: 4px;">商家名称</h3>
											<input id="distributorName" class="form-control input-small input-inline" @keyup="disChange($event)"/>
											<div class="goods-list" style="width:300px;margin-top:10px;margin-left:141px;background: #f9f9f9;">
												<table class="table table-hover">
													<thead>
														<tr>
															<th>商家名称</th>
															<th>地址</th>
															<th>联系人</th>
															<th>联系电话</th>
														</tr>
													</thead>
													<tbody>
														<tr v-for="item in dis_list" :key="item.id" @click="chooseDis(item, $event)">
															<td v-text="item.name"></td>
															<td v-text="item.address"></td>
															<td v-text="item.people"></td>
															<td v-text="item.phone"></td>
														</tr>
													</tbody>
												</table>
											</div>
											
										</div>
										<div class="col-md-3" style="width:23%;">
											<i class="icon-notebook left" style="padding-top: 7px;"></i>
											<h3 class="control-label col-md-4" style="font-size: 18px; padding-top: 4px;">支付状态</h3>
											<div class="btn-group">
												<button type="button" class="btn btn-default">未支付</button>
												<button type="button"
													class="btn btn-default dropdown-toggle"
													data-toggle="dropdown">
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="javascript:void(0)" data-status="2"> 未支付 </a></li>
													<li><a href="javascript:void(0)" data-status="1"> 已支付 </a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 20px;">
										<div class="col-md-12">
											<div class="form-group">
												<div class="portlet">
													<div class="portlet-title">
														<div class="caption">
															<i class="fa fa-bell-o"></i>销售列表
														</div>
														<div class="tools">
															<button type="button" class="btn btn-success" @click="addRow"><i class="fa fa-plus"></i>&nbsp;&nbsp;新增一行</button>
														</div>
													</div>
													<div class="portlet-body">
														<div class="table-scrollable">
															<table
																class="table table-striped table-bordered table-advance edit-table">
																<thead>
																	<tr>
																		<th width="193"><i class="fa fa-briefcase"></i>&nbsp;商品名称</th>
																		<th width="30"><i class="fa fa-star">&nbsp;规格 </th>
																		<th width="87"><i class="fa fa-shopping-cart"></i>&nbsp;数量</th>
																		<th width="117"><i class="fa fa-money"></i> 单价（￥）</th>
																		<th width="117"><i class="fa fa-money"></i> 合计（￥）</th>
																		<th><i class="fa fa-cog"></i> 操作</th>
																	</tr>
																</thead>
																<tbody>
																	<tr v-for="index in rows" class="add-tr">
																		<td><input class="name edit-input" @keyup="change($event)" />
																			<div class="goods-list">
																				<table class="table table-hover">
																					<thead>
																						<tr>
																							<th width="50" align="center">编号</th>
																							<th width="80" align="center">商品名称</th>
																							<th width="70" align="center">库存数</th>
																						</tr>
																					</thead>
																					<tbody>
																						<tr v-for="item in data_list" :key="item.code" 
																							@click="selectGoods($event, item)">
																							<td v-text="item.code"></td>
																							<td v-text="item.milkName"></td>
																							<td>((item.quantity))</td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</td>
																		<td></td>
																		<td><input type="number" class="edit-input number" data-parsley-type="integer" @change="countTotalPrice" style="width: 70px" /></td>
																		<td><input class="edit-input price" style="width: 100px" @change="check_price" @keyup="check_price_format" /></td>
																		<td><input class="edit-input totalPrice" style="width: 100px" readonly /></td>
																		<td><a href="javascript:;" class="btn btn-outline btn-circle btn-sm red" @click="deleteRow"><i class="fa fa-times"></i>&nbsp;&nbsp;删除</a></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- END FORM-->
							<div class="row">
								<div class="col-md-12">
									<div style="padding-left: 21px; font-size: 19px">总计:
										￥((totalPrice))</div>
								</div>
							</div>
							<div class="row" style="padding-bottom: 20px;">
								<div class="col-md-12">
									<button class="btn btn-danger btn-submit" onclick="add()" style="margin-left: 200px; width: 150px;"> <i class="fa fa-check"></i>&nbsp;&nbsp;确定并打印</button>
									<button class="btn btn-info" style="margin-left: 30px; width: 150px" onclick="preview()"><i class="fa fa-search"></i>&nbsp;&nbsp;预览</button>
									<button class="btn btn-danger default" onclick="window.location.href='purchase.jsp'" style="margin-left: 30px; width: 150px;"><i class="fa fa-times"></i>&nbsp;&nbsp;取消</button>
								</div>
							</div>
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
	<div id="layer-window" style="display: none;overflow:hidden;">
		<div class="row" style="margin:10px;">
			<div class="row">
				<div class="col-md-12" style="text-align:center;font-size:25px;"><b>重庆派派食品有限公司销货清单</b></div>
			</div>
			<div class="row" style="margin-top:10px">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12" style="margin-bottom:2px;">
							<span>购物单位（人）：<span>((disturName))</span></span>
							<span style="float:right">((saleTime))</span>
						</div>
					</div>
					<table class="printTable" border="1" text-align="center" style="width: 100%;">
						<thead>
							<tr>
								<th>产品形码</th>
								<th>产品名称</th>
								<th>规格</th>
								<th>生产日期</th>
								<th>保质期</th>
								<th>单位</th>
								<th>单价（元）</th>
								<th>数量</th>
								<th>金额</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in view_list">
								<td></td>
								<td>((item.milkName))</td>
								<td>((item.spe))</td>
								<td></td>
								<td></td>
								<td></td>
								<td>((item.price))</td>
								<td>((item.number))</td>
								<td>((item.totalPrice))</td>
							</tr>
							<tr>
								<td colspan="9">
									<span>金 额 合 计（大写）</span>
									<span>((sumOfMoney))</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-12" style="margin-top:3px;">
							购 货 者 声 明 ： 已 查 验 供 货 者 的 许 可 证 （ 编 号 ：   S P 5 0 0 1 0 9 1 6 1 0 0 6 7 1 0 2 ）
						</div>
						<div class="col-md-12" style="margin-top:7px;">
							<span>营 业 执 照</span><span style="padding-left:50px;">注册号代码：91500109MA5U4CB32H。</span><span style="padding-left:50px;">和上述食品的合格证明</span>
						</div>
						<div class="col-md-12" style="margin-top:7px;">
							供 货 商 地 址 ： 北 碚 区 辽 宁 路 7 3  号
						</div>
						<div class="col-md-12" style="margin-top:7px;">
							<span>订货电话： 13368329389</span><span style="padding-left:50px;">68287903</span><span style="padding-left:50px;">13983205989</span>
						</div>
						<div class="col-md-12" style="margin-top:7px;">
							<span>供货商（签章）： 李小君</span><span style="padding-left:200px;">收验货人（签章）：</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END Layer -->
	<script src="static/js/common.js" type="text/javascript"></script>
	<script>
		var layer_vue = new Vue({
			delimiters : [ "((", "))" ],
			el: '#layer-window',
			data:{
				view_list: [],
				saleTime: '',
				disturName: '',
				sumOfMoney: ''
			}
		})
		var table_vue = new Vue({
			delimiters : [ "((", "))" ],
			el : ".form",
			data : {
				rows : 0,
				data_list : [],
				totalPrice : 0,
				dis_list: []
			},
			methods : {
				addRow : function() {
					this.rows += 1;
				},
				change : function(event) {
					var name = event.target.value;
					if (name == '') {
						return;
					}
					$.ajax({
						type : 'post',
						url : 'stock/getStockByMilkName.action',
						data : {
							'name' : name
						},
						success : function(data) {
							data = eval("(" + data + ")");
							pager = eval("("+data.pager+")");
							if (pager.total > 0) {
								table_vue.data_list = data.datas;
								$(event.target).parent().find(".goods-list").show('slow');
							}
						}
					});
				},
				selectGoods : function(event, item) {
					var input = $(event.target).parent().parent().parent().parent().prev("input");
					var td = $(event.target).parent().parent().parent().parent().parent();
					td.next("td").text(item.specifications);
					input.val(item.milkName);
					td.next("td").next("td").next("td").val(item.selling_price);
				},
				check_price_format : function(event) {
					var obj = event.target;
					obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的  
					obj.value = obj.value.replace(".", "$#$").replace(
							/\./g, "").replace("$#$", ".");
					obj.value = obj.value.replace(
							/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');//只能输入两个小数  
					if (obj.value.indexOf(".") < 0 && obj.value != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
						obj.value = parseFloat(obj.value);
					}
				},
				check_price : function(event) {
					var obj = event.target;
					if (obj.value > 20000) {
						layer.tips('金额不能超过20000且只能保留两位小数', obj);
						$(obj).css('color', 'red');
						$(obj).attr('data-validat', 'false');
					} else {
						$(obj).css('color', 'black');
						$(obj).attr('data-validat', 'true');
						this.countTotalPrice(event);
					}
				},
				countTotalPrice : function(event) {
					var obj = event.target;
					var totalInput = $(obj).parent().parent().find(
							".totalPrice");
					var number = $(obj).parent().parent().find(
							".number").val();
					var price = $(obj).parent().parent().find(".price")
							.val();
					if (number == '' || price == '')
						return;
					var totalPrice = (price * number);
					totalInput.val(totalPrice);
					this.totalPrice += totalPrice;
				},
				deleteRow : function(event) {
					var tr = $(event.target).parent().parent();
					this.rows -= 1;
					tr.remove();
					var amount = $(event.target).parent().prev().find("input").val();
					this.totalPrice -= amount;
				},
				disChange: function(event){
					/*商家选择*/
					$.ajax({
						type: 'get',
						url: 'distributor/getDistributorByCondition.action',
						data:{
							'page': 0,
							'rows': 100,
							'distributorInfo': $(event.target).val()
						},
						success:function(data){
							data = eval("("+data+")");
							table_vue.dis_list = data.datas;
							$(event.target).parent().find(".goods-list").show('slow');
						}
					})
				},
				chooseDis: function(item, event){
					$("#distributorName").val(item.name);
					$("#distributorID").val(item.id);
				}
			}

		})

		function add() {
			var time = $("input[name='datepicker']").val();
			if (time == '') {
				layer.msg("请填写销售时间");
				return;
			}
			var trs = $(".add-tr");
			if (trs.length == 0) {
				layer.msg("销售项不能为空");
				return;
			}
			var distributorID = $("#distributorID").val();
			if(distributorID == null || distributorID == ''){
				layer.msg("请选择销售的商家");
				return;
			}
			var status = $("#status").val();
			if(status == null || status == ''){
				layer.msg("请选择支付状态");
				return;
			}
			list = getRows();
			var obj = {
				'time' : time,
				'totalPrice' : table_vue.totalPrice,
				'list' : list, 
				'distributorID': distributorID,
				'status': status
			}
			var list2 = new Array()
			list2.push(obj)
			data = JSON.stringify(list2);

			$.ajax({
				type : 'post',
				url : 'sale/addSale.action',
				data : {
					"data" : data
				},
				success : function(data) {
					data = eval("(" + data + ")");
					if (data.succ) {
						layer.msg(data.message);
						$("#layer-window").jqprint();
					} else {
						layer.msg(data.message);
					}
				}
			})

		}

		$(function() {
			$('.btn-datepicker').daterangepicker({
				singleDatePicker : true,
				showDropdowns : true,
				timePicker24Hour : true,
				timePicker : true,
				drops : "down",
				autoUpdateInput : false,
				"locale" : {
					format : 'YYYY-MM-DD HH:mm:ss',
					applyLabel : "应用",
					cancelLabel : "取消",
					daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
					monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
							'七月', '八月', '九月', '十月', '十一月', '十二月' ],
				}
			},
			function(start, end, label) {
				beginTimeTake = start;
				if (!this.startDate) {
					$("#purchase_time").val('');
				} else {
					$("#purchase_time").val(this.startDate.format(this.locale.format));
				}
			});

			$(".btn-datepicker").on('apply.daterangepicker', function(ev, picker) {
				$("#purchase_time").val(picker.startDate.format('YYYY-MM-DD HH:mm:ss'));
			});

			$(document).bind("click", function() {
				$(".goods-list").hide('slow');
			});
			
			$(".dropdown-menu").on('click', "a", function(){
				$(this).parents(".dropdown-menu").prev("button").prev("button").text($(this).text());
				$("#status").val($(this).attr("data-status"));
			})
			
			$(".btn-close-layer").click(function(){
				layer.closeAll("iframe");
			})
		})
		
		function preview(){
			if(getRows()){
				layer.open({
				  type: 1,
				  title: false,
				  closeBtn: 0,
				  area: '884px',
				  shadeClose: true,
				  content: $('#layer-window')
				});
			}
		}
		
		function getRows(){
			var trs = $(".add-tr");
			list = new Array();
			if(trs.length == 0){
				layer.msg("请选择商品");
				return false;
			}
			for (i = 0; i < trs.length; i++) {
				var tr = $(trs[i]);
				var milk_name = $(tr.children()[0]).find("input").val();
				if (milk_name == '') {
					layer.msg("请选择商品");
					return false;
				}

				var number = $(tr.children()[2]).find("input").val();
				if (number == '') {
					layer.msg("请输入数量");
					return false;
				}

				var price = $(tr.children()[3]).find("input").val();
				if (price == '') {
					layer.msg("请输入单价");
					return false;
				} else if (price <= 0) {
					layer.msg("商品单价不能小于等于0");
					return false;
				}

				var totalPrice = $(tr.children()[4]).find("input").val();
				if (totalPrice == '') {
					layer.msg("请输入商品总价");
					return false;
				} else if (totalPrice <= 0) {
					layer.msg("商品总价不能小于等于0");
					return false;
				}
				var one = {
					"milkName" : milk_name,
					'number' : number,
					'price' : price,
					'totalPrice' : totalPrice,
					'spe': $(tr.children()[1]).html()
				}
				list.push(one);
			}
			var saleTime = $("input[name='datepicker']").val();
			if(saleTime == 'undefined' || saleTime == ''){
				layer.msg("请选择销售时间");
				return false;
			}
			layer_vue.saleTime = saleTime.split("-")[0]+" 年 "+saleTime.split("-")[1]+" 月 "+saleTime.split("-")[2].split(" ")[0]+" 日"
			var disturName = $("#distributorName").val();
			if(typeof(disturName) == 'undefined' || disturName == "" || disturName == null){
				layer.msg("请选择商家");
				return false;
			}
			layer_vue.disturName = disturName;
			layer_vue.view_list = list;
			layer_vue.sumOfMoney = amountInWords(table_vue.totalPrice);
			return true;
		}
		
		function amountInWords(sumOfMoney){
			/*大写金额*/
			var string = '';
			if(sumOfMoney >= 10000){
				string += capitalMap(sumOfMoney / 10000) + " 万 ";
				sumOfMoney = sumOfMoney % 10000;
			}
			if(sumOfMoney >= 1000){
				string += capitalMap(sumOfMoney / 1000) + " 仟 ";
				sumOfMoney = sumOfMoney % 1000;
			}
			if(sumOfMoney >= 100){
				string += capitalMap(sumOfMoney / 100) + " 佰 ";
				sumOfMoney = sumOfMoney % 100;
			}
			if(sumOfMoney >= 10){
				string += capitalMap(sumOfMoney / 10) + " 拾 ";
				sumOfMoney = sumOfMoney % 10;
			}
			if(sumOfMoney >= 1){
				string += capitalMap(sumOfMoney / 1) + " 元 ";
				sumOfMoney = sumOfMoney % 1;
			}
			if(sumOfMoney >= 0.1){
				string += capitalMap(sumOfMoney / 0.1) + " 角 ";
				sumOfMoney = sumOfMoney % 0.1;
			}
			if(sumOfMoney >= 0.01){
				string += capitalMap(sumOfMoney / 0.01) + " 分 ";
				sumOfMoney = sumOfMoney % 0.01;
			}
		}
		
		function capitalMap(number){
			switch(number){
				case 0: return '零';
				case 1: return '壹';
				case 2: return '贰';
				case 3: return '叁';
				case 4: return '肆';
				case 5: return '伍';
				case 6: return '陆';
				case 7: return '柒';
				case 8: return '捌';
				case 9: return '玖';
				
			}
		}
	</script>
</body>

</html>