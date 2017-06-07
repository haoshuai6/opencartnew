$(document).ready(function(){
    //左侧悬浮菜单定位
    $('#fixed-menu,#fixed-side').scrollFixed("#position-fixed");

    //导航下拉
    $(".header-nav a").hover(function(){
        var hh = $(".header").outerHeight();
        console.log(hh)
        $("#header-menu").css('top', hh);
        var rel="header-nav-"+$(this).index();
        if($("#"+rel).length>0){
            $(this).addClass('open').siblings().removeClass('open')
            $("#header-menu").show();
            $("#"+rel).stop(true, true).slideDown(300).siblings('.menubox').stop(true, true).slideUp(300);
        }else{
            $("#header-menu").slideUp(300,function(){
                $("#header-menu,#header-menu .menubox").hide();
            })
            $(".header-nav a").removeClass('open')
        }
    }, function() {
        $(".header").mouseleave(function(event) {
            $("#header-menu").slideUp(300,function(){
                $("#header-menu,#header-menu .menubox").hide();
            })
            $(".header-nav a").removeClass('open')
        });
    });


    //回到顶部
    $("#side-code").hover(function() {
        $("#side-code-box").addClass('show')
    }, function() {
        $("#side-code-box").removeClass('show')
    });
    $(window).scroll(function(){200<$(window).scrollTop()?($("#back-top").addClass('show'),$("#back-top").click(function(){if(!$("html,body").is(":animated"))return $("html,body").animate({scrollTop:0}, 500),!1})):$("#back-top").removeClass('show')});

	$.scrollIt({
	  upKey: 38,             // key code to navigate to the next section
	  downKey: 40,           // key code to navigate to the previous section
	  easing: 'linear',      // the easing function for animation
	  scrollTime: 600,       // how long (in ms) the animation takes
	  activeClass: 'curr',   // class given to the active nav element
	  onPageChange: null,    // function(pageIndex) that is called when page is changed
	  //topOffset: -60          // offste (in px) for fixed top navigation
	});
	$('.case-menu').scrollToFixed({marginTop:80});
	$(".lazy").lazyload({threshold:300});
    //通用切换
    $('.tab-over dt').mouseover(function(){
        var dataTab=$(this).attr("data-tab");
        $(this).addClass("curr").siblings("dt").removeClass("curr");
        if(dataTab){
            var strData = new Array();
            strData = dataTab.split(' ');
            for (var i = 0; i < strData.length; i++){
                i==0?$('#'+strData[i]).addClass('show').siblings(".tab-con").removeClass('show'):$('#'+strData[i]).addClass('show');
            };
        }
    });
    $('.tab-click dt').click(function(){
        var dataTab=$(this).attr("data-tab");
        $(this).addClass("curr").siblings("dt").removeClass("curr");
        if(dataTab){
            var strData = new Array();
            strData = dataTab.split(' ');
            for (var i = 0; i < strData.length; i++) {
                i==0?$('#'+strData[i]).addClass('show').siblings(".tab-con").removeClass('show'):$('#'+strData[i]).addClass('show');
            };
        }
    });
    //切换初始状态
    $('.tab-over').each(function(index) {
        var curr = ~~$(this).attr("data-curr");
        !curr?$(this).find('dt').eq(0).mouseover():$(this).find('dt').eq(curr).mouseover()
    });
    $('.tab-click').each(function(index) {
        var curr = ~~$(this).attr("data-curr");
        !curr?$(this).find('dt').eq(0).click():$(this).find('dt').eq(curr).click()
    });

    $('.pb-swiper').each(function(index, el){
        if($(this).find('.swiper-slide').length>1){
            $(this).addClass('pb-swiper-'+index).find('.swiper-container').swiper({
                autoplay:6000,
                autoplayDisableOnInteraction : false,
                speed:1000,
                pagination : ".pb-swiper-"+index+' .swiper-pagination',
                paginationClickable: true,
                preventClicks:false,
                loop:true
            });
        }
    });

    $('.case-view .swiper-container').swiper({
        autoplay:5000,
        autoplayDisableOnInteraction : false,
        speed:800,
        nextButton: '.case-view .swiper-button-next',
        prevButton: '.case-view .swiper-button-prev',
        onlyExternal:true,
        preventClicks:false,
        loop:true
    });
    $('.news-view-play .swiper-container').swiper({
        autoplay:5000,
        autoplayDisableOnInteraction : false,
        speed:800,
        nextButton: '.news-view-play .swiper-button-next',
        prevButton: '.news-view-play .swiper-button-prev',
        onlyExternal:true,
        preventClicks:false,
        loop:true
    });

    $('.full-screen').each(function(index){
    	var ds = $(this).attr("data-scroll-index");
    	if($(this).find('.swiper-wrapper').length>0){
	        $(this).addClass('full-'+index);
	        $("#back-top").hide()
	        $(this).swiper({
	            speed:800,
                preventClicks:false,
	            pagination: '.full-'+index+' .swiper-pagination',
	            paginationClickable: true,
	            direction: 'vertical',
	            mousewheelControl: true,
	            mousewheelReleaseOnEdges:true,
	            paginationBulletRender: function (swiper, index, className) {
	                var t = $(swiper.slides[index]).attr("data-title");
	                return '<span class="' + className + '"><em>'+t+'</em></span>';
	            },
				onTransitionStart: function(swiper){
					if(ds){
						if(swiper.activeIndex!=0 || swiper.activeIndex!=swiper.slides.length-1){
                            $(".ds-btn[data-scroll-nav="+ds+"]").click()
			           	}
					}
		        },
                onInit: function(swiper){
                    $(swiper.container).find('.next-btn').click(function() {
                        swiper.slideNext()
                    });
                },
            });
        }
    });
    //通用弹层
    $(document).on('click',".btn-pop",function(){
        $("body").dialog();
        var pop = "#"+$(this).attr("data-pop");
        popShow(pop);
    });
    $(document).on('click',".pop-box .btn-close,.pop-box .btn-style-close",function(){
        var pop=$(this).parents(".pop-box")
        pop.fadeOut(300);
        $("#MaskID").fadeOut(200,function(){$(this).remove();})
        if(pop.find('video').length>0){
            for (var i = 0; i < pop.find('video').length; i++) {
                pop.find('video')[i].pause()
            }
        }
    })
    // 招聘
    $('.job-item .tab').click(function(){
        var item=$(this).parent();
        var other=item.siblings('.job-item');
        other.removeClass('curr');
        item.hasClass('curr')?item.removeClass('curr'):item.addClass('curr');
    });
});


// 遮罩
$.fn.dialog=function(){
    var wnd = $(window), doc = $(document),$body=$("body");
    (wnd.height()>doc.height())?wHeight = wnd.height():wHeight =doc.height();
    (wnd.width()>doc.width())?wWidth = wnd.width():wWidth =doc.width();
    $body.append("<div id='MaskID'></div>");
    $body.find("#MaskID").width(wWidth).height(wHeight).css({position:"absolute",top:"0px",left:"0px",background:"#000",filter:"Alpha(opacity=0);",opacity:"0",zIndex:"1000",display:"block"}).animate({ opacity:"0.5"},300 );
};
//通用弹层显示
function popShow(pop){
    var _this=$(pop);
    var aTime=Number(_this.attr("data-poptime"))*1000;
    var ph = -parseInt(_this.height()/2);
    var pw = -parseInt(_this.width()/2);
    _this.css({width:-pw*2,marginTop:ph,marginLeft:pw}).fadeIn(300);
    if(aTime){
        var link=_this.attr("data-popjump");
        _this.delay(aTime).queue(function(){
            _this.stop().fadeOut(300);
            $("#MaskID").fadeOut(200,function(){$(this).remove();})
            if(link){window.location.href=link;}
        });
    }
}
/*! Lazy Load 1.9.5 - MIT license - Copyright 2010-2015 Mika Tuupola */
!function(a,b,c,d){var e=a(b);a.fn.lazyload=function(f){function g(){var b=0;i.each(function(){var c=a(this);if(!j.skip_invisible||c.is(":visible"))if(a.abovethetop(this,j)||a.leftofbegin(this,j));else if(a.belowthefold(this,j)||a.rightoffold(this,j)){if(++b>j.failure_limit)return!1}else c.trigger("appear"),b=0})}var h,i=this,j={threshold:0,failure_limit:0,event:"scroll",effect:"show",container:b,data_attribute:"original",skip_invisible:!1,appear:null,load:null,placeholder:"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"};return f&&(d!==f.failurelimit&&(f.failure_limit=f.failurelimit,delete f.failurelimit),d!==f.effectspeed&&(f.effect_speed=f.effectspeed,delete f.effectspeed),a.extend(j,f)),h=j.container===d||j.container===b?e:a(j.container),0===j.event.indexOf("scroll")&&h.bind(j.event,function(){return g()}),this.each(function(){var b=this,c=a(b);b.loaded=!1,(c.attr("src")===d||c.attr("src")===!1)&&c.is("img")&&c.attr("src",j.placeholder),c.one("appear",function(){if(!this.loaded){if(j.appear){var d=i.length;j.appear.call(b,d,j)}a("<img />").bind("load",function(){var d=c.attr("data-"+j.data_attribute);c.hide(),c.is("img")?c.attr("src",d):c.css("background-image","url('"+d+"')"),c[j.effect](j.effect_speed),b.loaded=!0;var e=a.grep(i,function(a){return!a.loaded});if(i=a(e),j.load){var f=i.length;j.load.call(b,f,j)}}).attr("src",c.attr("data-"+j.data_attribute))}}),0!==j.event.indexOf("scroll")&&c.bind(j.event,function(){b.loaded||c.trigger("appear")})}),e.bind("resize",function(){g()}),/(?:iphone|ipod|ipad).*os 5/gi.test(navigator.appVersion)&&e.bind("pageshow",function(b){b.originalEvent&&b.originalEvent.persisted&&i.each(function(){a(this).trigger("appear")})}),a(c).ready(function(){g()}),this},a.belowthefold=function(c,f){var g;return g=f.container===d||f.container===b?(b.innerHeight?b.innerHeight:e.height())+e.scrollTop():a(f.container).offset().top+a(f.container).height(),g<=a(c).offset().top-f.threshold},a.rightoffold=function(c,f){var g;return g=f.container===d||f.container===b?e.width()+e.scrollLeft():a(f.container).offset().left+a(f.container).width(),g<=a(c).offset().left-f.threshold},a.abovethetop=function(c,f){var g;return g=f.container===d||f.container===b?e.scrollTop():a(f.container).offset().top,g>=a(c).offset().top+f.threshold+a(c).height()},a.leftofbegin=function(c,f){var g;return g=f.container===d||f.container===b?e.scrollLeft():a(f.container).offset().left,g>=a(c).offset().left+f.threshold+a(c).width()},a.inviewport=function(b,c){return!(a.rightoffold(b,c)||a.leftofbegin(b,c)||a.belowthefold(b,c)||a.abovethetop(b,c))},a.extend(a.expr[":"],{"below-the-fold":function(b){return a.belowthefold(b,{threshold:0})},"above-the-top":function(b){return!a.belowthefold(b,{threshold:0})},"right-of-screen":function(b){return a.rightoffold(b,{threshold:0})},"left-of-screen":function(b){return!a.rightoffold(b,{threshold:0})},"in-viewport":function(b){return a.inviewport(b,{threshold:0})},"above-the-fold":function(b){return!a.belowthefold(b,{threshold:0})},"right-of-fold":function(b){return a.rightoffold(b,{threshold:0})},"left-of-fold":function(b){return!a.rightoffold(b,{threshold:0})}})}(jQuery,window,document);

!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof exports?module.exports=a:a(jQuery)}(function(a){function b(b){var g=b||window.event,h=i.call(arguments,1),j=0,l=0,m=0,n=0,o=0,p=0;if(b=a.event.fix(g),b.type="mousewheel","detail"in g&&(m=-1*g.detail),"wheelDelta"in g&&(m=g.wheelDelta),"wheelDeltaY"in g&&(m=g.wheelDeltaY),"wheelDeltaX"in g&&(l=-1*g.wheelDeltaX),"axis"in g&&g.axis===g.HORIZONTAL_AXIS&&(l=-1*m,m=0),j=0===m?l:m,"deltaY"in g&&(m=-1*g.deltaY,j=m),"deltaX"in g&&(l=g.deltaX,0===m&&(j=-1*l)),0!==m||0!==l){if(1===g.deltaMode){var q=a.data(this,"mousewheel-line-height");j*=q,m*=q,l*=q}else if(2===g.deltaMode){var r=a.data(this,"mousewheel-page-height");j*=r,m*=r,l*=r}if(n=Math.max(Math.abs(m),Math.abs(l)),(!f||f>n)&&(f=n,d(g,n)&&(f/=40)),d(g,n)&&(j/=40,l/=40,m/=40),j=Math[j>=1?"floor":"ceil"](j/f),l=Math[l>=1?"floor":"ceil"](l/f),m=Math[m>=1?"floor":"ceil"](m/f),k.settings.normalizeOffset&&this.getBoundingClientRect){var s=this.getBoundingClientRect();o=b.clientX-s.left,p=b.clientY-s.top}return b.deltaX=l,b.deltaY=m,b.deltaFactor=f,b.offsetX=o,b.offsetY=p,b.deltaMode=0,h.unshift(b,j,l,m),e&&clearTimeout(e),e=setTimeout(c,200),(a.event.dispatch||a.event.handle).apply(this,h)}}function c(){f=null}function d(a,b){return k.settings.adjustOldDeltas&&"mousewheel"===a.type&&b%120===0}var e,f,g=["wheel","mousewheel","DOMMouseScroll","MozMousePixelScroll"],h="onwheel"in document||document.documentMode>=9?["wheel"]:["mousewheel","DomMouseScroll","MozMousePixelScroll"],i=Array.prototype.slice;if(a.event.fixHooks)for(var j=g.length;j;)a.event.fixHooks[g[--j]]=a.event.mouseHooks;var k=a.event.special.mousewheel={version:"3.1.12",setup:function(){if(this.addEventListener)for(var c=h.length;c;)this.addEventListener(h[--c],b,!1);else this.onmousewheel=b;a.data(this,"mousewheel-line-height",k.getLineHeight(this)),a.data(this,"mousewheel-page-height",k.getPageHeight(this))},teardown:function(){if(this.removeEventListener)for(var c=h.length;c;)this.removeEventListener(h[--c],b,!1);else this.onmousewheel=null;a.removeData(this,"mousewheel-line-height"),a.removeData(this,"mousewheel-page-height")},getLineHeight:function(b){var c=a(b),d=c["offsetParent"in a.fn?"offsetParent":"parent"]();return d.length||(d=a("body")),parseInt(d.css("fontSize"),10)||parseInt(c.css("fontSize"),10)||16},getPageHeight:function(b){return a(b).height()},settings:{adjustOldDeltas:!0,normalizeOffset:!0}};a.fn.extend({mousewheel:function(a){return a?this.bind("mousewheel",a):this.trigger("mousewheel")},unmousewheel:function(a){return this.unbind("mousewheel",a)}})});

!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a("object"==typeof exports?require("jquery"):jQuery)}(function(a){"use strict";function b(b,e){function f(){return m.update(),h(),m}function g(){r.css(x,m.contentPosition/m.trackRatio),o.css(x,-m.contentPosition),p.css(w,m.trackSize),q.css(w,m.trackSize),r.css(w,m.thumbSize)}function h(){u?n[0].ontouchstart=function(a){1===a.touches.length&&(a.stopPropagation(),i(a.touches[0]))}:(r.bind("mousedown",i),q.bind("mousedown",k)),a(window).resize(function(){m.update("relative")}),m.options.wheel&&window.addEventListener?b[0].addEventListener(v,j,!1):m.options.wheel&&(b[0].onmousewheel=j)}function i(b){a("body").addClass("noSelect"),s=t?b.pageX:b.pageY,m.thumbPosition=parseInt(r.css(x),10)||0,u?(document.ontouchmove=function(a){a.preventDefault(),k(a.touches[0])},document.ontouchend=l):(a(document).bind("mousemove",k),a(document).bind("mouseup",l),r.bind("mouseup",l))}function j(c){if(m.contentRatio<1){var d=c||window.event,e="delta"+m.options.axis.toUpperCase(),f=-(d[e]||d.detail||-1/3*d.wheelDelta)/40;m.contentPosition-=f*m.options.wheelSpeed,m.contentPosition=Math.min(m.contentSize-m.viewportSize,Math.max(0,m.contentPosition)),b.trigger("move"),r.css(x,m.contentPosition/m.trackRatio),o.css(x,-m.contentPosition),(m.options.wheelLock||m.contentPosition!==m.contentSize-m.viewportSize&&0!==m.contentPosition)&&(d=a.event.fix(d),d.preventDefault())}}function k(a){if(m.contentRatio<1){var c=t?a.pageX:a.pageY,d=c-s;m.options.scrollInvert&&u&&(d=s-c);var e=Math.min(m.trackSize-m.thumbSize,Math.max(0,m.thumbPosition+d));m.contentPosition=e*m.trackRatio,b.trigger("move"),r.css(x,e),o.css(x,-m.contentPosition)}}function l(){a("body").removeClass("noSelect"),a(document).unbind("mousemove",k),a(document).unbind("mouseup",l),r.unbind("mouseup",l),document.ontouchmove=document.ontouchend=null}this.options=a.extend({},d,e),this._defaults=d,this._name=c;var m=this,n=b.find(".viewport"),o=b.find(".overview"),p=b.find(".scroll-bar"),q=p.find(".track"),r=p.find(".thumb"),s=0,t="x"===this.options.axis,u="ontouchstart"in document.documentElement,v="onwheel"in document||document.documentMode>=9?"wheel":void 0!==document.onmousewheel?"mousewheel":"DOMMouseScroll",w=t?"width":"height",x=t?"left":"top";return this.contentPosition=0,this.viewportSize=0,this.contentSize=0,this.contentRatio=0,this.trackSize=0,this.trackRatio=0,this.thumbSize=0,this.thumbPosition=0,this.update=function(a){var b=w.charAt(0).toUpperCase()+w.slice(1).toLowerCase();switch(this.viewportSize=n[0]["offset"+b],this.contentSize=o[0]["scroll"+b],this.contentRatio=this.viewportSize/this.contentSize,this.trackSize=this.options.trackSize||this.viewportSize,this.thumbSize=Math.min(this.trackSize,Math.max(0,this.options.thumbSize||this.trackSize*this.contentRatio)),this.trackRatio=this.options.thumbSize?(this.contentSize-this.viewportSize)/(this.trackSize-this.thumbSize):this.contentSize/this.trackSize,s=q.offset().top,p.toggleClass("disable",this.contentRatio>=1),a){case"bottom":this.contentPosition=this.contentSize-this.viewportSize;break;case"relative":this.contentPosition=Math.min(Math.max(this.contentSize-this.viewportSize,0),Math.max(0,this.contentPosition));break;default:this.contentPosition=parseInt(a,10)||0}return g(),m},f()}var c="tinyscrollbar",d={axis:"y",wheel:!0,wheelSpeed:40,wheelLock:!0,scrollInvert:!1,trackSize:!1,thumbSize:!1};a.fn[c]=function(d){return this.each(function(){a.data(this,"plugin_"+c)||a.data(this,"plugin_"+c,new b(a(this),d))})}});


/**
 * ScrollPlug:滚动插件
 * 使用方法：type:"x|y"方向 btn:1|0按钮 item:".item"子元素 num:5显示个数 line:3滚动个数 speed:600 动画时长 选填 timer:1000自动间隔，0或不填取消自动 选填
**/
jQuery.fn.extend({ScrollPlug:function(a){if(!a){var a={}}var b,t,f,p=this.find(".scroll-area"),r=p.find(".scroll-action"),q=r.find(a.item),g=a.line?parseInt(a.line,10):1,e=r.find(a.item).length,o=a.speed?parseInt(a.speed,10):600,h=a.timer==0?h=0:(a.timer?parseInt(a.timer,10):3000),l=a.type=="y"?q.eq(0).height():q.eq(0).width(),n=0-g*l;p.css({overflow:"hidden",position:"relative"});r.css({overflow:"hidden",position:"relative"});if(e>a.num){if(a.type=="y"){p.height(a.num*l);r.height(e*l);t={marginTop:n};f={marginTop:0}}else{p.width(a.num*l);r.width(e*l);t={marginLeft:n};f={marginLeft:0}}var d=function(){r.stop(true,true).animate(t,o,function(){for(i=1;i<=g;i++){r.find(a.item+":first").appendTo(r)}r.css(f)})};var c=function(){for(i=1;i<=g;i++){r.find(a.item+":last").prependTo(r)}r.css(t).stop(true,true).animate(f,o)};var m=function(){if(h){b=window.setInterval(function(){d()},h)}};var j=function(){if(h){window.clearInterval(b)}};p.parent().hover(j,m).mouseout();if(a.btn){var k=a.tprev?a.tprev:"PREV";var s=a.tnext?a.tnext:"NEXT";this.append("<span class='pn-btn prev'>"+k+"</span><span class='pn-btn next'>"+s+"</span>");prev=$(this).find(".prev"),next=$(this).find(".next");next.click(function(){d()});prev.click(function(){c()})}}}});

//ScrollIt
(function(e){"use strict";var t="ScrollIt",n="1.0.3";var r={upKey:38,downKey:40,easing:"linear",scrollTime:600,activeClass:"active",onPageChange:null,topOffset:0};e.scrollIt=function(t){var n=e.extend(r,t),i=0,s=e("[data-scroll-index]:last").attr("data-scroll-index");var o=function(t){if(t<0||t>s)return;var r=e("[data-scroll-index="+t+"]").offset().top+n.topOffset+1;e("html,body").animate({scrollTop:r,easing:n.easing},n.scrollTime)};var u=function(t){var n=e(t.target).closest("[data-scroll-nav]").attr("data-scroll-nav")||e(t.target).closest("[data-scroll-goto]").attr("data-scroll-goto");o(parseInt(n))};var a=function(t){var r=t.which;if(e("html,body").is(":animated")&&(r==n.upKey||r==n.downKey)){return false}if(r==n.upKey&&i>0){o(parseInt(i)-1);return false}else if(r==n.downKey&&i<s){o(parseInt(i)+1);return false}return true};var f=function(t){if(n.onPageChange&&t&&i!=t)n.onPageChange(t);i=t;e("[data-scroll-nav]").removeClass(n.activeClass);e("[data-scroll-nav="+t+"]").addClass(n.activeClass)};var l=function(){var t=e(window).scrollTop();var r=e("[data-scroll-index]").filter(function(r,i){return t>=e(i).offset().top+n.topOffset&&t<e(i).offset().top+n.topOffset+e(i).outerHeight()-1});var i=r.first().attr("data-scroll-index");f(i)};e(window).on("scroll",l).scroll();e(window).on("keydown",a);e("body").on("click","[data-scroll-nav], [data-scroll-goto]",function(e){e.preventDefault();u(e)})}})(jQuery);

//通用层滚动定位
(function($){
    $.fn.scrollFixed=function(parent,type){
        $(this).each(function() {
            type=type?type:"absolute";
            if($(this).length && $(parent).length){
                var obj=$(this);
                var pT= $(parent).offset().top;
                obj.css({'top':pT,"position":type});
                $(window).scroll(function(){
                    var winT=$(window).scrollTop();
                    if(winT>pT){
                        obj.css({'top':0,"position":"fixed"});
                    }else{
                        obj.css({'top':pT,"position":type});
                    }
                })
            }
        });
    };
})(jQuery);