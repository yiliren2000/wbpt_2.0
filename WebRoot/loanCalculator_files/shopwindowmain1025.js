//version 2011-03-17 01
var curUrl = window.location.host+window.location.pathname;
    var jiatxShopWindow = function(){
        jQuery.jiatxShopMsgBox = {};
        jQuery.jiatxShopMsgBox.msgBoxHtml='\<div class="jiatxShop-msgBox-jquery" style="'+((jQuery.browser.version!="6.0")?'position:fixed;':'position:absolute!important;')+'display:none;bottom:0px;right:0px;width:352px;z-index:900;height:290px;overflow:hidden;background-color:#fff;">\
                <span style="position:relative;margin-bottom:-17px;float:right;padding:3px 4px 0 0;width:16px;height:14px;z-index:999;"><img src="http://show.soufun.com/core/blank.gif" width="16" height="14" style="cursor:pointer" /></span><iframe src="http://www.jiatx.com/ShowWindow.aspx?url='+ curUrl +'" scrolling="no" frameborder="0" width="352px" height="290px" style="z-index:900;"></iframe>\
            </div>';

        jQuery.jiatxShopMsgBox.msgBoxJQ = jQuery(jQuery.jiatxShopMsgBox.msgBoxHtml);
        if(jQuery.browser.version=="6.0"){
        	jQuery(window).scroll(function(){jQuery.jiatxShopMsgBox.msgBoxJQ.css("top",jQuery(document).scrollTop()+jQuery(window).height()-jQuery.jiatxShopMsgBox.msgBoxJQ.height());}); 
        	jQuery(window).resize(function(){jQuery.jiatxShopMsgBox.msgBoxJQ.css("top",jQuery(document).scrollTop()+jQuery(window).height()-jQuery.jiatxShopMsgBox.msgBoxJQ.height());});
        }
        jQuery.extend(jQuery.jiatxShopMsgBox,{        
                msgBoxJquery : jQuery.jiatxShopMsgBox.msgBoxJQ     
                ,show : function(paramObj){
                    this.msgBoxJquery.find("img").click(function(){
                        jQuery.jiatxShopMsgBox.msgBoxJQ.slideUp(1000);
                    });
                    this.msgBoxJquery.slideDown(1500);
                }
        });

        var jQueryF_ShowJiatxShopMsg = function(){
            jQuery.jiatxShopMsgBox.show({});        
        };
        
        jQuery.jiatxShopMsgBox.msgBoxJQ.appendTo(jQuery("body"));
	jQuery.jiatxShopMsgBox.msgBoxJQ.find("iframe").load(function(){
	    jQuery(function(){
                if(jQuery("body").html().indexOf("富媒体视窗")==-1){
            	    jQueryF_ShowJiatxShopMsg();
                }
            });
        });
    };
    
    if(typeof(window.jQuery)!="undefined"){
        //jiatxShopWindow();
    }
    else{        
        jiatxShopLoadScript("http://js.soufunimg.com/home/weike/js/jquery-1.3.2.min.js",function(){
	    jQuery.noConflict();
	    jQuery(function(){
		if(jQuery("body").html().indexOf("富媒体视窗")==-1){
	            //jiatxShopWindow();
		}
	    });
        });
    }