var menu_vue = new Vue({
	delimiters:['((', '))'],
	el:'.page-sidebar-menu',
	data:{
		menu_list:[{
			span_icon:'icon-home',
			title:'HOME',
			href:'index.jsp'
		},{
			span_icon:'icon-diamond',
			title:'商品管理',
			href:'milk.jsp'
		},/*{
			span_icon: 'icon-user',
			title:'商家管理',
			href:'distributor.jsp'
		},*/{
			span_icon: 'icon-basket',
			title: '采购管理',
			href: 'purchase.jsp'
		},{
			span_icon: 'icon-drawer',
			title: '销售管理',
			href: 'sale.jsp'
		},{
			span_icon: 'icon-social-dropbox',
			title: '库存管理',
			href: 'stock.jsp'
		},{
			span_icon: 'icon-layers',
			title: '报表中心',
			href: 'javascript:void(0)',
			children: [{
				span_icon: 'icon-pie-chart',
				title: '  采购报表',
				href: 'purchaseReport.jsp'
			},{
				span_icon: 'icon-briefcase',
				title: '  销售报表',
				href: 'saleReport.jsp'
			},{
				span_icon: 'icon-paper-plane',
				title: '  分析报表',
				href: 'goodsAnalysisReport.jsp'
			}]
		}],
		now_href: window.location.href.split("MilkMS/")[1]
	}
});


function get_page_total(total, rows){
	var shang = Math.floor(total/rows);
	var yushu = total%rows;
	if(yushu > 0)
		shang += 1;
	return shang;
}

$(function(){
	$('form').parsley();//调用parsley表单验证插件(提交时才会验证 是否必填和输入格式)
	//$('form').parsley().validate();//调用parsley表单验证插件(页面加载时就验证 是否必填和输入格式)
});
