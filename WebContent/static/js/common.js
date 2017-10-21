var menu_vue = new Vue({
	delimiters:['((', '))'],
	el:'.page-sidebar-menu',
	data:{
		menu_list:[{
			span_icon:'icon-home',
			title:'HOME',
			href:'index.jsp'
		},{
			span_icon:'icon-drop',
			title:'牛奶管理',
			href:'milk.jsp'
		},{
			span_icon:'icon-basket',
			title:'采购管理',
			href:'purchase.jsp'
		}]
	},
	methods:{
		to_page:function(name){
			window.location.href=name+".jsp";
		}
	}
});

$(function(){
	
	App.init();
	
	set_center_height();
	
});


function set_center_height(){
	var all_height = $(document).height();
	$('.center').css('height', all_height - $('.top').css('height'));
}

