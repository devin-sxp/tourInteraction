/**
 * 
 */
var closepop= function(){
    $(".pop").hide();
    $(".popinto").hide();
 
}

var popshow = function(){
    $(".pop").show();
}

var publish = function(){
    popshow();
    if(!isPhone()){
        $("#publish").css({
            'marginTop':-$("#publish").height()/2,
        })
    }else{
    	$("#publish").css({
    		'left':'0px',
    		'top':'0px',
    		'width':'100%',
    		'height':'100%'
    		
    	});
    	$("#div_publish_app").removeClass("hidden");

    }
    $("#publish").show("fast");  

    $("#publish").css("overflow", "visible");//用于解决wangeditor全屏花屏问题
}

var writeArticle = function(){
    popshow();
    if(!isPhone()){
        $("#write_article").css({
            'marginTop':-$("#write_article").height()/2,
        })
    }else{
    	$("#write_article").css({
    		'left':'0px',
    		'top':'0px',
    		'width':'100%',
    		'height':'100%'
    		
    	});

    }
    $("#write_article").show("fast");  

    $("#write_article").css("overflow", "visible");//用于解决wangeditor全屏花屏问题
}

var edit_text = function(){
    popshow();
    if(!isPhone()){

	    $("#edit_text").css({
	        'marginTop':-$("#edit_text").height()/2,
	    })
    }else{
    	$("#edit_text").css({
    		'left':'0px',
    		'top':'0px',
    		'width':'100%',
    		'height':'100%'
    		
    	});
    	$("#div_edit_text_app").removeClass("hidden");
    }
    $("#edit_text").show("fast");
    $("#edit_text").css("overflow", "visible");//用于解决wangeditor全屏花屏问题

};

var edit_password = function(){
	popshow();

	
    if(!isPhone()){
    	$("#edit_password").css({
    		'marginTop':-$("#edit_password").height()/2,
    	})
    }else{
    	$("#edit_password").css({
    		'left':'0px',
    		'top':'0px',
    		'width':'100%',
    		'height':'100%'
    		
    	});
    }
	
	$("#edit_password").show("fast");
};

var create_subject = function(){
    popshow();
    if(!isPhone()){
        $("#create_subject").css({
            'marginTop':-$("#create_subject").height()/2,
        })
    }else{
    	$("#create_subject").css({
    		'left':'0px',
    		'top':'0px',
    		'width':'100%',
    		'height':'100%'
    		
    	});

    }
    $("#create_subject").show("fast");  

    $("#create_subject").css("overflow", "visible");//用于解决wangeditor全屏花屏问题
}

var submitArticle = function(){
    popshow();
    if(!isPhone()){
        $("#submit_article").css({
            'marginTop':-$("#submit_article").height()/2,
        })
    }else{
    	$("#submit_article").css({
    		'left':'0px',
    		'top':'0px',
    		'width':'100%',
    		'height':'100%'
    		
    	});

    }
    $("#submit_article").show("fast");  
}