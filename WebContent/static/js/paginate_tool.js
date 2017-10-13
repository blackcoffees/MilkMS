var paginate_html= function(){
	/*
	<div class="paginate-tool row"> 
		<div class="pageSelect col-md-6 left"> 
			<div class="dropdown"> 
				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> 
					{{rows}} 
					<span class="caret"></span> 
				</button> 
				<ul class="dropdown-menu"> 
					<template v-for="item in rows_list">
						<li><a href="javascript:;" @click="child_change_rows(item)">{{item}}</a></li> 
					</template> 
				</ul> 
			</div> 
		</div> 
		<div class="paginate col-md-6 right"> 
			<ul class="left"> 
				<li class="start" @click="child_pre_page"><i class="fa fa-angle-left"></i></li> 
				<template v-for="i in show_page">
					<li v-if="i == '···'" class="ellipsis" v-text="i" :key="i" ></li> 
					<li v-else v-text="i" :key="i" :class="{active: i == 1}" @click="child_change_page(i, $event)"></li>
				</template> 
				<li class="end" @click="child_next_page"><i class="fa fa-angle-right"></i></li> 
			</ul>
			<div class="left">
				跳转到
				<input />
				<button />
			</div>
		</div> 
	</div>
	*/
}

var html = new String(paginate_html);  
html = html.substring(html.indexOf("/*") + 3, html.lastIndexOf("*/"));

Vue.component('paginate-tool', {
	template: html,
	props:['rows', 'rows_list', 'show_page'],
	methods:{
		child_change_rows: function(item){
			this.$emit('change_rows', item);
		},
		child_change_page: function(i, event){
			this.$emit('change_page', i, event);
		},
		child_pre_page: function(){
			
		},
		child_next_page: function(){
			
		}
	}
})

var paginate_vue = new Vue({
	delimiters:['((', '))'],
	el:'.bottom-tool',
	data:{
		rows: 10,
		page: 1,
		page_total: 1,
		show_page: [],
		rows_list: [10, 20, 30],
		target: ''
	},
	watch:{
		rows:function(){
			invoke(this.rows, this.page);
		},
		page:function(){
			invoke(this.rows, this.page);
			this.show_paged();
		},
		page_total:function(){
			this.show_paged();
		}
	},
	methods:{
		change_rows: function(item){
			this.rows = item;
		},
		change_page:function(i, event){
			console.info(event.target);
			if(event.target.className == 'start' ||event.target.className == 'end' || event.target.className == 'ellipsis'){
				;
			}
			else{
				this.page = event.target.innerText;
				
				var start = $('.paginate .start');
				var end = $('.paginate .end');
				var ellipsis = $('.paginate .ellipsis');
				$('.paginate ul li').removeAttr('class');
				
				start.attr('class', 'start');
				end.attr('class', 'end');
				ellipsis.attr('class', 'ellipsis');
				$(event.target).attr('class', 'active');
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
			if(this.page == this.page_total);
			else{
				this.page = this.page+1;
				var active = $('.paginate li.active');
				active.removeAttr('class');
				active.next().attr('class', 'active');
			}
		},
		show_paged:function(){
			this.show_page = [];
			if(this.page_total > 10){
				if(this.page >= 5){
					if(this.page_total - this.page <= 5){
						this.show_page.push(1);
						this.show_page.push("···");
						for(i=this.page_total-4;i<=this.page_total;i++){
							this.show_page.push(i);
						}
					}
					else{
						var page_end = parseInt(this.page) + 5;
						this.show_page.push(1);
						this.show_page.push("···");
						for(i=this.page-2;i<page_end-2;i++){
							this.show_page.push(i);
						}
						this.show_page.push("···");
						this.show_page.push(this.page_total);
					}
				}
				else{
					for(i=1;i<6;i++){
						this.show_page.push(i);
					}
					this.show_page.push("···");
					this.show_page.push(this.page_total);
				}
			}
			else{
				for(i=1;i<this.page_total;i++){
					this.show_page.push(i);					
				}
			}
		}
	}
})

var paginate_tool = new Object();

paginate_tool.method_name = "";

paginate_tool.init = function (method_name, page_total, rows_list){

		paginate_vue.page_total = page_total;
		this.method_name = method_name;
		if(rows_list != null && rows_list != '' ){
			if(rows_list.length != 0){
				paginate_vue.rows_list = rows._list;
			}
		}
	}

function invoke(rows, page){
	var func = eval(paginate_tool.method_name);
	new func(rows, page);
}

	