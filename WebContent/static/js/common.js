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
		}],
		now_href: window.location.href.split("MilkMS/")[1]
	},
	methods:{
		to_page:function(name){
			window.location.href=name+".jsp";
		}
	}
});

$(function(){
	
	App.init();
	
	
});
