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
	
});
