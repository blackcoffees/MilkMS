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
                        		<li class="nav-item" :class="{start: i == 1, active: menu.href=='purchase.jsp', open: menu.href==now_href}">
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
                                    <span>采购管理</span>
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
                        <h1 class="page-title"> PURCHASE
                            <small>采购管理</small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        
                        <!-- BEGIN PAGE MAIN-->
						
						<div class="portlet box green">
							<div class="portlet-title">
								<div class="caption">
									<i class="icon-equalizer"></i>新增采购单
								</div>
								<div class="tools"></div>
							</div>
							<div class="portlet-body form">
								
								<!-- BEGIN FORM-->
								<form action="#" class="horizontal-form" data-parsley-validate onsubmit="return false">
									<div class="form-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<h3 class="control-label col-md-4">采购时间</h3>
													<div class="col-md-7">
														<div class="input-group date btn-datepicker" data-provide="datepicker">
		                                                	<input type="text" class="form-control" id="purchase_time" readonly name="datepicker" style="width:224px"/>
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
										</div>
										<div class="row" style="margin-top:20px;">
											<div class="col-md-12">
												<div class="form-group">
													<div class="portlet">
					                                    <div class="portlet-title">
					                                        <div class="caption">
					                                            <i class="fa fa-bell-o"></i>采购列表</div>
					                                        <div class="tools">
					                                        	<button type="button" class="btn btn-success" @click="addRow"><i class="fa fa-plus"></i>&nbsp;&nbsp;新增一行</button>
					                                        </div>
					                                    </div>
					                                    <div class="portlet-body">
					                                        <div class="table-scrollable">
					                                            <table class="table table-striped table-bordered table-advance edit-table">
					                                                <thead>
					                                                    <tr>
					                                                        <th width="193">
					                                                            <i class="fa fa-briefcase"></i> 商品名称 
					                                                        </th>
					                                                        <th width="30">
					                                                        	<i class="fa fa-star">规格
																			</th>
					                                                        <th width="87">
					                                                            <i class="fa fa-shopping-cart"></i> 数量
																			</th>
					                                                        <th width="117">
					                                                            <i class="fa fa-money"></i> 单价（￥）
																			</th>
					                                                        <th width="117">
					                                                        	<i class="fa fa-money"></i> 合计（￥）
					                                                        </th>
					                                                        <th>
					                                                        	<i class="fa fa-cog"></i> 操作
					                                                        </th>
					                                                    </tr>
					                                                </thead>
					                                                <tbody>
					                                                    <tr v-for="index in rows" class="add-tr">
					                                                        <td>
					                                                            <input class="name edit-input" @keyup="change($event)"/>
					                                                            <div class="goods-list">
					                                                            	<table class="table table-hover">
					                                                            		<thead>
					                                                            			<tr>
					                                                            				<th width="50" align="center">编号</th>
					                                                            				<th width="80" align="center">商品名称</th>
					                                                            				<th width="50" align="center">规格</th>
					                                                            			</tr>
					                                                            		</thead>
					                                                            		<tbody>
					                                                            			<tr v-for="item in data_list" :key="item.code" @click="selectGoods($event, item)">
					                                                            				<td v-text="item.code"></td>
					                                                            				<td v-text="item.milk_name"></td>
					                                                            				<td v-text="item.specifications"></td>
					                                                            			</tr>
					                                                            		</tbody>
					                                                            	</table>
					                                                            </div>
					                                                        </td>
					                                                        <td></td>
					                                                        <td><input type="number" class="edit-input number" data-parsley-type="integer" @change="countTotalPrice" style="width:70px"/></td>
					                                                        <td><input class="edit-input price" style="width:100px" @change="check_price" @keyup="check_price_format"/></td>
					                                                        <td><input class="edit-input totalPrice" style="width: 100px" readonly/></td>
					                                                        <td>
					                                                        	<a href="javascript:;" class="btn btn-outline btn-circle btn-sm red" @click="deleteRow">
					                                                                <i class="fa fa-times"></i>&nbsp;&nbsp; 删除
																				</a>
					                                                        </td>
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
										<div style="padding-left:21px;font-size:19px">总计: ￥((totalPrice))</div>
									</div>
								</div>
								<div class="row" style="padding-bottom:20px;">
									<div class="col-md-12">
										<button class="btn btn-danger btn-submit" onclick="add()" style="margin-left:270px;width:150px;"><i class="fa fa-check"></i>&nbsp;&nbsp;确定</button>
										<button class="btn btn-danger default" onclick="window.location.href='purchase.jsp'" style="margin-left:30px;width:150px;"><i class="fa fa-times"></i>&nbsp;&nbsp;取消</button>
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
        
        
        <script src="static/js/common.js" type="text/javascript"></script>
        <script>
        
        	var table_vue = new Vue({
        		delimiters:["((","))"],
        		el: ".form",
        		data:{
        			rows: 0,
        			data_list: [],
        			totalPrice: 0
        		},
        		methods: {
        			addRow: function(){
        				this.rows += 1;
        			},
        			change: function(event){
        				var name = event.target.value;
    					if(name == ''){
    						return;
    					}
    					$.ajax({
    						type: 'post',
    						url: 'milk/getMilkByName.action',
    						data: {'name': name},
    						success:function(data){
    							data = eval("("+data+")");
    							pager = eval("("+data.pager+")")
    							if(pager.total>0){
    								table_vue.data_list = data.datas;
    								$(event.target).parent().find(".goods-list").show('slow');
    							}
    						}
    					});
        			},
        			selectGoods: function(event, item){
        				var input = $(event.target).parent().parent().parent().parent().prev("input");
        				var td = $(event.target).parent().parent().parent().parent().parent();
        				td.next("td").text(item.specifications);
        				input.val(item.milk_name);
        			},
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
    						this.countTotalPrice(event);
    					}
    				},
    				countTotalPrice: function(event){
    					var obj = event.target;
    					var totalInput = $(obj).parent().parent().find(".totalPrice");
    					var number = $(obj).parent().parent().find(".number").val();
    					var price = $(obj).parent().parent().find(".price").val();
    					if(number == '' || price == '') return;
    					var totalPrice = (price * number);
    					totalInput.val(totalPrice);
    					this.totalPrice += totalPrice;
    				},
					deleteRow: function(event){
						var tr = $(event.target).parent().parent();
						this.rows -= 1;
						tr.remove();
					}
        		}
        		
        	})
        	
        	function add(){
        		var time=$("input[name='datepicker']").val();
        		if(time == ''){
        			layer.msg("请填写采购时间");
        			return;
        		}
        		var trs = $(".add-tr");
        		var list = new Array();
        		if(trs.length == 0){
        			layer.msg("采购项不能为空");
        			return;
        		}
        		for(i=0;i<trs.length;i++){
        			var tr = $(trs[i]);
        			var milk_name = $(tr.children()[0]).find("input").val();
        			if(milk_name == ''){
        				layer.msg("请选择商品");
        				return;
        			}
        			
        			var quantity = $(tr.children()[2]).find("input").val();
        			if(quantity == ''){
        				layer.msg("请输入数量");
        				return;
        			}
        			
        			var price = $(tr.children()[3]).find("input").val();
        			if(price == ''){
        				layer.msg("请输入单价");
        				return;
        			}
        			else if(price <= 0){
        				layer.msg("商品单价不能小于等于0");
        				return;
        			}
        			
        			var total_amount = $(tr.children()[4]).find("input").val();
        			if(total_amount == ''){
        				layer.msg("请输入商品总价");
        				return;
        			}
        			else if(total_amount <= 0){
        				layer.msg("商品总价不能小于等于0");
        				return;
        			}
        			
        			var one = {
        				"milk_name": milk_name,
        				'quantity': quantity,
        				'price': price,
        				'total_amount': total_amount
        			}
        			list.push(one);
        		}
        		var obj = {
        			'time': time,
        			'total_price': table_vue.totalPrice,
        			'list': list
        		}
        		var list2 = new Array()
        		list2.push(obj)
        		data = JSON.stringify(list2);
        		
        		$.ajax({
        			type:'post',
        			url: 'purchase/addPurchase.action',
        			data: {"data": data},
        			success:function(data){
        				data = eval("("+data+")");
        				if(data.succ){
        					layer.msg(data.message);
        					setTimeout(function(){
        						window.location.href="purchase.jsp";
        					}, 2000);
        				}
        				else{
        					layer.msg(data.message);
        				}
        			}
        		})
        		
        	}
        	
			$(function(){
				$('.btn-datepicker').daterangepicker({
	                singleDatePicker: true,
	                showDropdowns: true,
	                timePicker24Hour : true,
	                timePicker : true,
	                drops: "down",
	                autoUpdateInput: false,
	                "locale": {
	                    format: 'YYYY-MM-DD HH:mm:ss',
	                    applyLabel: "应用",
	                    cancelLabel: "取消",
	                    daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ], 
	                    monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',  
                                       '七月', '八月', '九月', '十月', '十一月', '十二月' ],
	                }
	            }, 
	            function(start, end, label) {
	                beginTimeTake = start;
	                if(!this.startDate){
	                	$("#purchase_time").val('');
	                }else{
	                    $("#purchase_time").val(this.startDate.format(this.locale.format));
	                }
	            });
				
				$(".btn-datepicker").on('apply.daterangepicker', function(ev, picker) {
					$("#purchase_time").val(picker.startDate.format('YYYY-MM-DD HH:mm:ss'));
                });
				
				$(document).bind("click", function(){
					$(".goods-list").hide('slow');
				});
			})    	 
        </script>
    </body>

</html>