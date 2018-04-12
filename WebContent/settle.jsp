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
        <link href="static/css/settle.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="favicon.ico" />
	</head>

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <div class="page-wrapper">
            <div class="page-header navbar navbar-fixed-top">
                <div class="page-header-inner ">
                    <!-- BEGIN LOGO -->
                    <div class="page-logo">
                        <a href="javascript:void(0)">
                        	<label class="logo-default" style="font-size:25px;margin-top:7px;color:white;font-family:'仿宋'">超市管理系统</label>
						</a>
                    </div>
                    <!-- END LOGO -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="page-logo" style="float:right;">
                        <a href="index.jsp">
                        	<i class="icon-login"></i>
                        	<label class="logo-default">进入后台</label>
						</a>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
            </div>
            
            <!-- BEGIN CONTAINER -->
            <div class="page-container" style="background-color:white;">
                <div class="page-content-wrapper" style="width:39%">
                	<div class="page-content" style="margin-left:0px;">
                		<div class="portlet light bordered" style="padding:0;min-height: inherit;">
							<div class="portlet-title">
							    <div class="caption font-green" style="margin-left:7px">
							        <i class="icon-layers font-green" style="font-size:21px;"></i>
							        <span class="caption-subject bold uppercase" style="font-size:21px;">订单</span>
							    </div>
							</div>
							<div class="portlet-body table-both-scroll" style="padding-top:1px">
								<div class="dataTables_wrapper no-footer DTS" >
									<div class="table-scrollable">
										<div class="dataTables_scroll">
                                           	<div class="dataTables_scrollBody" style="position: relative; overflow: auto; width: 100%;">
                                           		<table class="table table-striped table-hover order-column dataTable no-footer">
                                           			<thead>
                                               			<tr role="row" style="height: 0px;">
                                               				<th>编号</th>
						                        			<th>商品名称</th>
						                        			<th>商品编码</th>
						                        			<th>商品单价</th>
						                        			<th>商品数量</th>
						                        			<th>商品总价</th>
						                        			<th>操作</th>
                                               			</tr>
													</thead>
													<tbody>
														<tr v-for="(order_item,index) in order_list">
															<td>((index+1))</td>
							                       			<td>((order_item.milk_name))</td>
							                       			<td>((order_item.code))</td>
							                       			<td>￥((order_item.selling_price))</td>
							                       			<td><input class="edit-input price" style="width:60px;" :value="order_item.qty"></td>
							                       			<td>￥((order_item.selling_total_price))</td>
							                       			<td style="cursor:pointer" v-on:click="deleted(order_item)"><i class="icon-trash"></i></td>
														</tr>
													</tbody>
												</table>
<!-- 												<div style="position: relative; top: 0px; left: 0px; width: 1px; height: 344px;"></div> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<span style="font-size:25px;">总金额:￥((total_price))</span>
							<br/>
							<button type="button" class="btn red btn-lg" style="width:100px" onclick="buy()">结算(K)</button>
							<button type="button" class="btn default btn-lg" style="width:100px" onclick="location.reload()">取消(S)</button>
						</div>
					</div>
                </div>
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper" style="float:right;width:60%;">
                    <div class="page-content s-right">
                        <!-- BEGIN PAGE TITLE-->
                        <div class="caption font-green" style="margin-bottom:6px;">
							<i class="icon-briefcase font-green" style="font-size:21px;"></i>
                        	<span class="caption-subject bold uppercase" style="font-size:21px;">商品</span>
						</div>
                        <input placeholder="条形码/商品编号/商品名称" id="goods_info" class="form-control" onchange="getGoods()"/>
                        <!-- END PAGE TITLE-->
                        
                        <!-- BEGIN PAGE MAIN-->
						<div class="rows goods-scroll" style="overflow-y:auto;margin-top:10px;">
							<div class="portlet col-md-4 goods-card" v-for="goods in goods_list" v-bind:title="goods.milk_name">
								<div class="portlet-body" v-on:click="choosed(goods)">
									<div>
										<div class="goods-name" >((goods.milk_name))</div>
	                                  	<div class="goods-price">￥((goods.selling_price))</div>
									</div>
									<div style="margin-left:5px;both:clear;">((goods.code))</div>
								</div>
							</div>
						</div>
						
                        <!-- END PAGE MAIN-->
                    </div>
                </div>
                <!-- END CONTENT -->
            </div>
            <!-- END CONTAINER -->
        </div>
        
        <script>
        	var vue = new Vue({
        		delimiters:["((","))"],
        		el: ".page-container",
        		data:{
        			goods_list:[],
        			order_list:[],
        			total_price:0
        		},
        		methods:{
        			choosed:function(goods){
        				this.total_price += goods.selling_price;
        				if($.inArray(goods, this.order_list) > 0){
        					this.order_list[$.inArray(goods, this.order_list)].qty += 1;
        					this.order_list[$.inArray(goods, this.order_list)].selling_total_price = this.order_list[$.inArray(goods, this.order_list)].qty * this.order_list[$.inArray(goods, this.order_list)].selling_price;
        				}
        				else{
        					goods.qty = 1;
        					goods.selling_total_price = goods.selling_price;
        					this.order_list.push(goods);
        				}
        			},
        			deleted:function(goods){
        				this.total_price -= goods.selling_price;
        				this.order_list.splice($.inArray(goods, this.order_list), 1);
        			}
        		}
        	})
        	$(function(){
        		var height = $(".page-content").css("min-height").split("px")[0];
        		$(".dataTables_scrollBody").css("height", height*0.8598);
        		$(".goods-scroll").css("height", height*0.8188);
        		getGoods();
        		$(document).keydown(function(event){
        			console.info(event.keyCode);
        			if(event.keyCode == 75) buy();
        			else if(event.keyCode == 83) location.reload();
        		})
        	})
        	
        	function getGoods(){
        		var goods_info = $("#goods_info").val();
        		$.ajax({
        			url: 'milk/getMilkFront.action',
        			type: 'get',
        			data:{
        				"milkInfo": goods_info,
        			},
        			success:function(data){
        				data = eval("("+data+")");
        				if(data.succ){
        					vue.goods_list = data.datas;
        				}
        				else{
        					layer.msg(data.message);
        				}
        				
        			}
        		})
        	}
        	
        	function buy(){
        		var list = new Array();
        		if(vue.order_list.length == 0){
        			layer.msg("请选择购买的商品");
        			return;
        		}
        		for(i=0;i<vue.order_list.length;i++){
        			var item = vue.order_list[i];
        			if(item.selling_price <= 0 || item.selling_price == "" || item.selling_price == null){
        				layer.msg("商品价格错误");
        				return;
        			}
        			if(item.qty <=0 || item.qty == "" || item.qty == null){
        				layer.msg("商品数量错误");
        				return;
        			}
        			if(item.selling_total_price <= 0 || item.selling_total_price == "" || item.selling_total_price == null || item.selling_total_price != item.qty*item.selling_price){
        				layer.msg("商品总价错误");
        				return;
        			}
        			var obj = {
       					"milkName" : item.milk_name,
       					'number' : item.qty,
       					'price' : item.selling_price,
       					'totalPrice' : item.selling_total_price
        			}
        			list.push(obj);
        		}
        		var now = new Date();
        		var obj2 = {
       				'time' : now.getFullYear()+"-"+now.getMonth()+1+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds(),
       				'totalPrice' : vue.total_price,
       				'list' : list, 
       				'distributorID': 1,
       				'status': 1
        		}
        		var list2 = new Array();
        		list2.push(obj2);
        		list2 = JSON.stringify(list2);
        		$.ajax({
    				type : 'post',
    				url : 'sale/addSale.action',
    				data : {
    					"data" :list
    				},
    				success : function(data) {
    					data = eval("(" + data + ")");
    					layer.msg(data.message);
    					if (data.succ) {
    						location.reload();
    					}
    				}
    			})
        	}
        	
        </script>
    </body>

</html>