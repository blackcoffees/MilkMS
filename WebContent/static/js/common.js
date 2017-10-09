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
		}]
	},
	methods:{
		to_page:function(name){
			window.location.href=name+".jsp";
		}
	}
});

$(function(){
	
	set_center_height();
	
	$('.paginate ul li').bind('click', function(){
		if($(this)[0].className == 'start' || $(this)[0].className == 'end');
		else{
			$('.paginate ul li').removeAttr('class', 'active');
			$(this).attr('class', 'active');
			console.info(this);
		}
	});
});


function set_center_height(){
	var all_height = $(document).height();
	$('.center').css('height', all_height - $('.top').css('height'));
}

