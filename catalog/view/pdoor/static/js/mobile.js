$(function(){
    $(document).on('click','.tab-click dt', function () {
        var dataTab=$(this).attr("data-tab");
        $(this).addClass("curr").siblings("dt").removeClass("curr");
        if(dataTab){
            var strData = new Array();
            strData = dataTab.split(' ');
            for (var i = 0; i < strData.length; i++) {
                i==0?$('#'+strData[i]).show().siblings(".tab-con").hide():$('#'+strData[i]).show();
            };
        }
    });
    //切换初始状态
    $('.tab-click').each(function(index) {
        var curr = ~~$(this).attr("data-curr");
        !curr?$(this).find('dt').eq(0).click():$(this).find('dt').eq(curr).click()
    });
    // 招聘
    $(document).on('click','.job-item .tab', function () {
        var item=$(this).parent();
        var other=item.siblings('.job-item');
        other.removeClass('curr');
        item.hasClass('curr')?item.removeClass('curr'):item.addClass('curr');
    });

    //预约
    $(document).on('click','.btn-appointment', function () {
        $.modal({
            extraClass:'pop-appoint',
            title:'免费申请专属服务',
            text: '<h4>专属设计师免费1对1全程服务 <br>免费电话申请: <em class="fc-org">400-717-0065</em></h4><input type="text" name="name" class="modal-text-input" placeholder="输入您的姓名"><input type="text" name="phone" class="modal-text-input" placeholder="输入您联系电话">',
            verticalButtons: true,
            buttons: [
                {
                    text: '申请专属服务',
                    bold: true,
                    onClick: function() {
						//$.toast("恭喜您，预约成功！");
						mbm();
					}
                },
                {
                    text: '关闭'
                }
            ]
        })
    });

    $(document).on("pageInit", function(e, id, page) {
        //导航
        if(!$('#panel-nav').length){
            if ($('body').hasClass('body-shop')){
                $('body').append(panelNavShop);
            }else{
                $('body').append(panelNav);
            }
        }
        $(document).on('click','#panel-nav .toggle', function(){
            var li=$(this).parent('li');
            if(li.hasClass('open')){
                li.removeClass('open');
                $(this).siblings('ul').slideUp(300);
            }else{
                li.addClass('open')
                $(this).siblings('ul').slideDown(300);
            }
        });


        $("#city-picker").cityPicker({
            toolbarTemplate:'<header class="bar bar-nav">\
                                <button class="button button-link pull-right close-picker">完成</button>\
                                <h1 class="title">选择所在地区</h1>\
                             </header>'
        });
        // 滚动监听
        $(".content").on('scroll',function(){
            var top = $(this).scrollTop()
            if(top>$('body').height()/2){
                $('.back-top').addClass('show')
            }else{
                $('.back-top').removeClass('show')
            }
            $(document).on('click','.back-top', function () {
                $('.content').scrollTop(0);
            });
        });
    });

	$.init();


    //案例下拉加载
    var loading = false;
    var itemsPerLoad = 5;
    var maxItems = 100;
    var lastIndex=5;
    $(document).on('infinite', '.infinite-scroll',function() {
        if (loading) return;
        // 设置flag
        loading = true;
        // 模拟1s的加载过程
        setTimeout(function() {
            // 重置加载flag
            loading = false;
            if (lastIndex >= maxItems) {
                // 加载完毕，则注销无限加载事件，以防不必要的加载
                $.detachInfiniteScroll($('.infinite-scroll'));
                // 删除加载提示符
                $('.infinite-scroll-preloader').remove();
                return;
            }
            // 添加新条目
            addItems(itemsPerLoad, lastIndex);
            // 更新最后加载的序号
            lastIndex = $('.infinite-list').children().length;
            //容器发生改变,如果是js滚动，需要刷新滚动
        }, 1000);
    });
});


function addItems(number, lastIndex) {
    // 生成新条目的HTML
    var html = '';
    //for (var i = lastIndex + 1; i <= lastIndex + number; i++) {
	var data=100;
	$.post('/case/getcase', {'data': data}, function(data) {

		if (data != 0) {
			html = eval(data);
			 // 添加新条目
			$('.infinite-list').append(html);
		} else {
			html = '<div class="no-case">没有了</div>';
			$('.infinite-list').append(html);
            $.detachInfiniteScroll($('.infinite-scroll'));
            // 删除加载提示符
            $('.infinite-scroll-preloader').remove();
		}

	});

      //html += '<div class="case-single">Item ' + i + '</div>';
    //}

}

// 遮罩
$.fn.dialog=function(cAllback){
   var wnd = $(window), doc = $(document);
   if(wnd.height() > doc.height()){wHeight = wnd.height();}else{wHeight = doc.height();}
   $(this).append("<div ID=MaskID></div>");
   $(this).find("#MaskID").width(wnd.width()).height(wHeight).css({position:"fixed",top:"0",left:"0",background:"#000",filter:"Alpha(opacity=30);",opacity:"0.3",zIndex:"3000",display:"block"});
};
// 发送验证码
function setyzm(obj,countdown) {
    if (countdown == 0) {
        obj.removeAttribute("disabled");
        obj.value="免费获取验证码";
        countdown = 60;
        return;
    } else {
        obj.setAttribute("disabled", true);
        obj.value="重新发送(" + countdown + ")";
        countdown--;
    }
    var time = setTimeout(function() {
        setyzm(obj,countdown--) }
    ,1000)
}

var panelNav='<div class="panel-overlay"></div><div class="panel panel-right panel-reveal" id="panel-nav"><div class="content-block"><div class="close tr"><span class="close-panel">关闭</span></div><ul class="nav"><li><a href="index.html" external>首页</a></li><li><a href="javascript:;" class="toggle">发现更多产品<span class="icon icon-right animate"></span></a><ul><li><a href="../m-shop/shop.html" external>全部</a></li><li><a href="../m-shop/list.html" external>餐厅</a></li><li><a href="../m-shop/list.html" external>卧室</a></li><li><a href="../m-shop/list.html" external>书房</a></li><li><a href="../m-shop/list.html" external>儿童房</a></li><li><a href="../m-shop/list.html" external>浴室</a></li><li><a href="../m-shop/list.html" external>辅料</a></li><li><a href="../m-shop/list.html" external>五金</a></li></ul></li><li><a href="classic.html" external>经典系列</a></li><li><a href="case.html" external>客户案例</a></li><li><a href="activity.html" external>最新活动</a></li><li><a href="news.html" external>知识课堂</a></li><li><a href="javascript:;" class="toggle">品牌精髓<span class="icon icon-right animate"></span></a><ul><li><a href="brand.html" external>品牌精髓</a></li><li><a href="brand-ut.html" external>极致工艺</a></li><li><a href="brand-ss.html" external>服务体系</a></li></ul></li><li><a href="job.html" external>客户服务</a></li></ul></div></div>';
var panelNavShop='<div class="panel-overlay"></div><div class="panel panel-right panel-reveal" id="panel-nav"><div class="content-block"><div class="close tr"><span class="close-panel">关闭</span></div><ul class="nav"><li><a href="../html-m/index.html" external>首页</a></li><li><a href="javascript:;" class="toggle">发现更多产品<span class="icon icon-right animate"></span></a><ul><li><a href="shop.html" external>全部</a></li><li><a href="list.html" external>餐厅</a></li><li><a href="list.html" external>卧室</a></li><li><a href="list.html" external>书房</a></li><li><a href="list.html" external>儿童房</a></li><li><a href="list.html" external>浴室</a></li><li><a href="list.html" external>辅料</a></li><li><a href="list.html" external>五金</a></li></ul></li><li><a href="../html-m/classic.html" external>经典系列</a></li><li><a href="../html-m/case.html" external>客户案例</a></li><li><a href="../html-m/activity.html" external>最新活动</a></li><li><a href="../html-m/news.html" external>知识课堂</a></li><li><a href="javascript:;" class="toggle">品牌精髓<span class="icon icon-right animate"></span></a><ul><li><a href="../html-m/brand.html" external>品牌精髓</a></li><li><a href="../html-m/brand-ut.html" external>极致工艺</a></li><li><a href="../html-m/brand-ss.html" external>服务体系</a></li></ul></li><li><a href="../html-m/job.html" external>客户服务</a></li></ul></div></div>';
