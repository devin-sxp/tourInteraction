/**
 * 
 */

getConfigure();
function getConfigure(){
	$("#ul_image_pre").empty();
	$.post(getRootPath()+"/configure/getConfigure.do",function(data){
		configure_have_back = false;
		var data = eval("("+data+")")
		$.each(data,function(index,configure){
			console.log(configure)
			if(configure.staticCodeConfigure == "configure_pic"){
				if(configure.staticCodeUse == "configure_pic_use_pre"){
					var html = "<li>"
						+"<div class=\"slider-info\">"
						+"<img src=\""+getRootPath()+configure.file+"\" style=\"height:210px\" alt=\"\"></div></li>"
					$("#ul_image_pre").append(html);
				}else{
					$(".banner").css("background","url("+getRootPath()+configure.file+")");
					$(".banner").css("background-size","cover");
				}

				
			}else{
				$("#div_title_description").empty();

				var html = "<h1 style=\"color: aqua;\">"+configure.title+"</h1>"
						+"<h2 style=\"color: burlywood; margin:10px\">"+configure.description+"</h2>"
					
				$("#div_title_description").append(html);
			}
		});
		$('.flexslider').flexslider({
			animation : "slide",
			animation: "fade",              //String: Select your animation type, "fade" or "slide"图片变换方式：淡入淡出或者滑动
			  slideDirection: "horizontal",   //String: Select the sliding direction, "horizontal" or "vertical"图片设置为滑动式时的滑动方向：左右或者上下
			  slideshow: true,                //Boolean: Animate slider automatically 载入页面时，是否自动播放
			  slideshowSpeed: 5000,           //Integer: Set the speed of the slideshow cycling, in milliseconds 自动播放速度毫秒
			  animationDuration: 600,         //Integer: Set the speed of animations, in milliseconds动画淡入淡出效果延时
			  directionNav: true,             //Boolean: Create navigation for previous/next navigation? (true/false)是否显示左右控制按钮
			  controlNav: true,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage是否显示控制菜单
			  keyboardNav: true,              //Boolean: Allow slider navigating via keyboard left/right keys键盘左右方向键控制图片滑动
			  mousewheel: true,              //Boolean: Allow slider navigating via mousewheel鼠标滚轮控制制图片滑动
			  prevText: "Previous",           //String: Set the text for the "previous" directionNav item
			  nextText: "Next",  
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});
	},'json');
}
