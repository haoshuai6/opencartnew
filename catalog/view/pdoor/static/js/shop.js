$(document).ready(function(){
    $('.preview-zoom').previewZoom();
    //爆款轮播
    $('.fire-swiper .swiper-container').swiper({
        autoplay:6000,
        autoplayDisableOnInteraction : false,
        speed:1000,
        paginationClickable: true,
        preventClicks:false,
        slidesPerView: 3,
        spaceBetween: 30,
        loop:true,
        nextButton: '.fire-swiper .swiper-button-next',
        prevButton: '.fire-swiper .swiper-button-prev'
    });
    // 猜你喜欢
    $('.like-swiper .swiper-container').swiper({
        autoplay:6000,
        autoplayDisableOnInteraction : false,
        speed:1000,
        paginationClickable: true,
        preventClicks:false,
        slidesPerView: 4,
        spaceBetween: 30,
        loop:true,
        nextButton: '.like-swiper .swiper-button-next',
        prevButton: '.like-swiper .swiper-button-prev'
    });

    $('#shop-tab').scrollFixed("#shop-tab","static");

});

// 发送验证码
function setyzm(obj,countdown) {
    if (countdown == 0) {
        obj.removeAttribute("disabled");
        obj.value="免费获取验证码";
        countdown = 60;
        return;
    } else {
        obj.setAttribute("disabled", true);
        obj.value=countdown + " s";
        countdown--;
    }
    var time = setTimeout(function() {
        setyzm(obj,countdown--) }
    ,1000)
}

//商城详情图片
;(function($){
    $.fn.previewZoom=function(){
        if($(this).length){
            $(this).each(function(){
                var _this=$(this);
                var thums=_this.find('.thum-list');
                var thumli=thums.find('li');
                var thumw = thumli.eq(0).width();//单个宽度
                var len = thumli.length; /* 个数 */
                var bprev=_this.find('.thum-prev');
                var bnext=_this.find('.thum-next');
                var show=_this.find(".pic-show")
                var view=_this.find(".big-view")
                var zoom=_this.find('.zoom')

                var shownum =Number(_this.attr("data-shownum"));//显示数量
                var move=_this.attr("data-move")?Number(_this.attr("data-move")):shownum;//移动数量
                var idx = _this.attr("data-index")?_this.attr("data-index"):0;//初始位置

                thums.find("ul").css("width",len*thumw)
                if(idx==0){bprev.addClass('disabled')}else{thums.find("ul").css("left",-idx*thumw)}
                //缩略图按钮
                _this.find('.btn-pn').click(function(){
                    if ($(this).hasClass('disabled')) {return false;}
                    _this.find('.btn-pn').removeClass('disabled');
                    if ($(this).hasClass('thum-prev')){
                    console.log(idx)
                        if(idx-move<=0){
                            idx = 0;
                            bprev.addClass('disabled')
                        }else{
                            idx = idx-move;
                        }
                    }else{
                        if(idx+shownum+move>len-1){
                            idx = len - shownum;
                            bnext.addClass('disabled')
                        }else{
                            idx = idx+move;
                        }
                    }
                    thums.find("ul").css("left",-idx * thumw)
                });
                //点击到中图
                var midChangeHandler = null;
                thumli.find('img').bind("mouseover", function() {
                    if (!$(this).hasClass('curr')){
                        var pic=$(this).attr("data-pic");
                        var big=$(this).attr("data-big")?$(this).attr("data-big"):pic
                        midChange(pic,big);
                        $(this).parent().addClass('curr').siblings('li').removeClass('curr');
                    }
                });
                //默认展示第一张
                thumli.eq(idx).find('img').trigger('mouseover')
                //加载中图并填充
                function midChange(pic,big) {
                    show.find("img").attr({"src":pic,"data-big":big}).load(function() {
                        view.find("img").attr("src",big);
                    });
                }
                //大视窗看图
                function mouseover(e) {
                    if(zoom.is(":hidden")){
                        zoom.show();
                        view.show();
                    }
                    zoom.css(fixedPosition(e));
                    e.stopPropagation();
                }
                function mouseOut(e) {
                    if (!zoom.is(":hidden")) {
                        zoom.hide();
                        view.hide();
                    }
                    e.stopPropagation();
                }
                //选择器事件
                show.mousemove(mouseover).mouseout(mouseOut);
                zoom.mousemove(mouseover).mouseout(mouseOut);
                var $divWidth = zoom.width(); //选择器宽度
                var $divHeight = zoom.height(); //选择器高度
                var $imgWidth = show.find('img').width(); //中图宽度
                var $imgHeight = show.find('img').height(); //中图高度
                var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度
                view.scrollLeft(0).scrollTop(0);
                function fixedPosition(e) {
                    if (e == null) {return;}
                    var $imgLeft = show.find('img').offset().left; //中图左边距
                    var $imgTop = show.find('img').offset().top; //中图上边距
                    X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
                    Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
                    X = X < 0 ? 0 : X;
                    Y = Y < 0 ? 0 : Y;
                    X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
                    Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

                    if ($viewImgWidth == null) {
                        $viewImgWidth = view.find('img').outerWidth();
                        $viewImgHeight = view.find('img').height();
                        if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                            $viewImgWidth = $viewImgHeight = 800;
                        }
                        $height = $divHeight * $viewImgHeight / $imgHeight;
                        view.width($divWidth * $viewImgWidth / $imgWidth);
                        view.height($height);
                    }
                    var scrollX = X * $viewImgWidth / $imgWidth;
                    var scrollY = Y * $viewImgHeight / $imgHeight;
                    view.find('img').css({
                        "left": scrollX * -1,
                        "top": scrollY * -1
                    });
                    return {left: X,top: Y};
                }
            });
        }
    };
})(jQuery);
