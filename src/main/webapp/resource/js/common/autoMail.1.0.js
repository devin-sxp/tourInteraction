/**
*改进	1、支持多个input上下按键选择
*改进	2、当面板显示状态，禁止回车提交，使用了keypress事件，兼容了IE
*改进	3、禁止输入空格键
*改进	4、当input各种height各种padding时，也能精确定位
*改进	5、鼠标事件改为mousedown，在blur之前执行，防止点击失败
*改进	6、兼容IE6/IE7下宽度也可以随内容长度自动拉宽
*/
(function($){

	$.fn.autoMail = function(options){
		/*面板样式*/
		var style = '<style type="text/css">\n'+
						'.autoMail{position:absolute;z-index:9999;background:#fff;border:1px solid #e5e5e5;font-size:12px;padding:2px;font-family:Georgia;display:none;}\n'+
						'.autoMail ul{margin:0;padding:0;background:#f5f5f5;}\n'+
						'.autoMail ul li{list-style:none;line-height:30px;text-indent:10px;border-top:1px solid #fff;border-bottom:1px solid #E5E5E5;color:#666;cursor:pointer;}\n'+
						'.autoMail .cmail{background:#e5e5e5;color:#000;}\n'+
					'</style>';
		$('head').append(style);
		/*主体功能*/
		var opts = $.extend({}, $.fn.autoMail.defaults, options);
		return this.each(function(i){
			//获取初始化参数
			var $this = $(this);
			var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
			
			//页面插入空下拉列表html
			var $autoMail = $('<div class="autoMail""></div>');
			$('body').append($autoMail);
			
			//设置高亮li
			function setEmailLi(index){
				$('.autoMail').eq(i).find('li').removeClass('cmail').eq(index).addClass('cmail');
				//防止上下键时 光标跳动*
				return false;
			}
			//初始化邮箱列表
			var emails = o.emails;
			//当前选中li下标
			var eindex = -1;
			//初始化填充下拉列表
			var init = function(input){
				//取消浏览器自动提示
				input.attr('autocomplete','off');
				//添加提示邮箱列表
				if(input.val()!=""){
					var emailList = '<ul>';
					for(var i = 0; i < emails.length; i++) {
						emailList += '<li>'+input.val()+'@'+emails[i]+'</li>';
					}
					$autoMail.html(emailList).show();
				}
				//添加鼠标事件
				$('.autoMail li').hover(function(){
					$(this).addClass('cmail');
				},function(){
					$(this).removeClass('cmail');
				}).mousedown(function(){//用mousedown事件，在blur事件之前执行，防止面板消失点击失败
					input.val($(this).html()).focus();
					$autoMail.hide();
				});
			}
			//监听事件
			$this.focus(function(){
				//初始化下标
				eindex = -1;
				//初始化面板位置
				$autoMail.css({'top':$this.offset().top+$this.outerHeight(true)+'px','left':$this.offset().left+'px'});
				//控制显示时机
				if($this.val().indexOf('@') == -1){
					init($this);
				}
			}).blur(function(){
				//失去焦点后隐藏面板,延迟，for 点击版权链接
				$autoMail.delay(100).hide(0);
			}).keyup(function(e){
				if($this.val().indexOf('@') == -1){
					//上键
					if(e.keyCode == 40){
						eindex ++;
						if(eindex >= $('.autoMail').eq(i).find('li').length){
							eindex = 0;
						}
						setEmailLi(eindex);
					//下键
					}else if(e.keyCode == 38){
						eindex --;
						if(eindex < 0){
							eindex = $('.autoMail').eq(i).find('li').length-1;
						}
						setEmailLi(eindex);
					//回车键
					}else if(e.keyCode == 13){
						if(eindex >= 0){
							$this.val($('.autoMail').eq(i).find('li').eq(eindex).html());
							$autoMail.hide();
						}
					}else{
						eindex = -1;
						init($this);
					}
				}
			}).keypress(function(e){
				//禁止输入空格
				if(e.keyCode == 32){
					return false;
				}
				//当面板显示状态，禁止回车提交
				if(e.keyCode == 13){
					if(!$autoMail.is(":hidden")){
						return false;
					}
				}
			});
		});
	}
	$.fn.autoMail.defaults = {
		emails:[]
	}
})(jQuery);
