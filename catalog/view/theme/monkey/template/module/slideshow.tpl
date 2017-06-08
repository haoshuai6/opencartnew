<!-- banner轮播 start -->
<div class="pb-swiper shop-swiper pb-swiper-0">
    <div class="menu">
        <h3>所有空间</h3>
        <a href="javascript:;"><i class="fm-ico fm-ct"></i>餐厅</a>
        <a href="javascript:;"><i class="fm-ico fm-ws"></i>卧室</a>
        <a href="javascript:;"><i class="fm-ico fm-sf"></i>书房</a>
        <a href="javascript:;"><i class="fm-ico fm-etf"></i>儿童房</a>
        <a href="javascript:;"><i class="fm-ico fm-ys"></i>浴室</a>
        <a href="javascript:;"><i class="fm-ico fm-fl"></i>辅料</a>
        <a href="javascript:;"><i class="fm-ico fm-wj"></i>五金</a>
        <p>咨询电话<br><strong>400-700-8123</strong></p>
    </div>
    <div class='swiper-container'>
        <div class='swiper-wrapper'>
            <?php foreach ($banners as $banner) { ?>
            <?php if ($banner['link']) { ?>
            <div class='swiper-slide'><a href="<?php echo $banner['link']; ?>"><img class="center-h" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a></div>
            <?php } else { ?>
            <div class='swiper-slide'><img  class="center-h" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></div>
            <?php } ?>
            <?php } ?>
        </div>
    </div>
    <div class='swiper-pagination'></div>
</div>
<!-- banner轮播 end -->