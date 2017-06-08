<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>


<!-- 爆款专区 -->
<div class="h2-title">
  <h2>爆款专区</h2>
  <p>我们不相信会有完美无缺的家，但是我们相信家能够完美彰显房子主人的风格特点。</p>
</div>
<div class="fire-swiper" id="position-fixed">
  <div class='swiper-container'>
    <div class='swiper-wrapper'>
      <div class="shop-item swiper-slide">
        <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/7.jpg"></a>
        <div class="info animate">
          <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
          <p class="toe">油漆系列</p>
          <div class="price">¥ 3,499.00</div>
          <a href="view.html" class="btn-style">立即购买</a>
        </div>
      </div>
      <div class="shop-item swiper-slide">
        <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/8.jpg"></a>
        <div class="info animate">
          <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
          <p class="toe">油漆系列</p>
          <div class="price">¥ 3,499.00</div>
          <a href="view.html" class="btn-style">立即购买</a>
        </div>
      </div>
      <div class="shop-item swiper-slide">
        <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/9.jpg"></a>
        <div class="info animate">
          <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
          <p class="toe">油漆系列</p>
          <div class="price">¥ 3,499.00</div>
          <a href="view.html" class="btn-style">立即购买</a>
        </div>
      </div>
      <div class="shop-item swiper-slide">
        <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/1.jpg"></a>
        <div class="info animate">
          <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
          <p class="toe">油漆系列</p>
          <div class="price">¥ 3,499.00</div>
          <a href="view.html" class="btn-style">立即购买</a>
        </div>
      </div>
      <div class="shop-item swiper-slide">
        <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/2.jpg"></a>
        <div class="info animate">
          <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
          <p class="toe">油漆系列</p>
          <div class="price">¥ 3,499.00</div>
          <a href="view.html" class="btn-style">立即购买</a>
        </div>
      </div>
      <div class="shop-item swiper-slide">
        <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/3.jpg"></a>
        <div class="info animate">
          <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
          <p class="toe">油漆系列</p>
          <div class="price">¥ 3,499.00</div>
          <a href="view.html" class="btn-style">立即购买</a>
        </div>
      </div>



    </div>
  </div>
  <div class="swiper-button-prev swiper-button"></div>
  <div class="swiper-button-next swiper-button"></div>
</div>
<!-- 爆款专区 end -->
<!-- 空间分类 -->
<div class="shop-space cf">
  <a href="javascript:;" class="hover"><span>客厅</span><img src="catalog/view/pdoor/static/pic/shop/sk1.jpg"></a>
  <a href="javascript:;" class="hover"><span>卧室</span><img src="catalog/view/pdoor/static/pic/shop/sk2.jpg"></a>
  <a href="javascript:;" class="hover"><span>厨房</span><img src="catalog/view/pdoor/static/pic/shop/sk3.jpg"></a>
  <a href="javascript:;" class="hover"><span>书房</span><img src="catalog/view/pdoor/static/pic/shop/sk4.jpg"></a>
  <a href="javascript:;" class="hover"><span>其他</span><img src="catalog/view/pdoor/static/pic/shop/sk5.jpg"></a>
  <a href="javascript:;" class="hover"><span>卫生间</span><img src="catalog/view/pdoor/static/pic/shop/sk6.jpg"></a>
</div>
<a href="javascript:;" class="hover shop-pic"><img src="catalog/view/pdoor/static/pic/shop/shop-pic.jpg"></a>
<!-- 空间分类 end -->
<!-- 明星产品 -->
<div class="h2-title">
  <h2>明星产品</h2>
  <p>我们不相信会有完美无缺的家，但是我们相信家能够完美彰显房子主人的风格特点。</p>
</div>
<div class="shop-star cf">
  <a href="view.html" class="hover n1">
    <img src="catalog/view/pdoor/static/pic/shop/star1.jpg">
    <span class="info">
                <strong>派的门99分白系列</strong>
                <span>油漆系列</span>
                <em class="price">¥ 3,499.00</em>
            </span>
  </a>
  <a href="view.html" class="hover n2">
    <img src="catalog/view/pdoor/static/pic/shop/star2.jpg">
    <span class="info">
                <strong>派的门99分白系列</strong>
                <span>油漆系列</span>
                <em class="price">¥ 3,499.00</em>
            </span>
  </a>
  <a href="view.html" class="hover n3">
    <img src="catalog/view/pdoor/static/pic/shop/star3.jpg">
    <span class="info">
                <strong>派的门99分白系列</strong>
                <span>油漆系列</span>
                <em class="price">¥ 3,499.00</em>
            </span>
  </a>
  <a href="view.html" class="hover n4">
    <img src="catalog/view/pdoor/static/pic/shop/star4.jpg">
    <span class="info">
                <strong>派的门99分白系列</strong>
                <span>油漆系列</span>
                <em class="price">¥ 3,499.00</em>
            </span>
  </a>
</div>
<!-- 明星产品 end -->
<!-- 热评产品 -->
<div class="h2-title">
  <h2>热评产品</h2>
  <p>我们不相信会有完美无缺的家，但是我们相信家能够完美彰显房子主人的风格特点。</p>
</div>
<div class="shop-list cf">
  <div class="shop-item fl">
    <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/1.jpg"></a>
    <div class="info animate">
      <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
      <p class="toe">油漆系列</p>
      <div class="price">¥ 3,499.00</div>
      <a href="view.html" class="btn-style">立即购买</a>
    </div>
  </div>
  <div class="shop-item fl">
    <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/2.jpg"></a>
    <div class="info animate">
      <div class="t"><a href="view.html">派的门99分白系列</a></div>
      <p>油漆系列</p>
      <div class="price">¥ 3,499.00</div>
      <a href="view.html" class="btn-style">立即购买</a>
    </div>
  </div>
  <div class="shop-item fl">
    <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/3.jpg"></a>
    <div class="info animate">
      <div class="t"><a href="view.html">派的门99分白系列</a></div>
      <p>油漆系列</p>
      <div class="price">¥ 3,499.00</div>
      <a href="view.html" class="btn-style">立即购买</a>
    </div>
  </div>
  <div class="shop-item fl">
    <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/4.jpg"></a>
    <div class="info animate">
      <div class="t toe"><a href="view.html">派的门99分白系列</a></div>
      <p class="toe">油漆系列</p>
      <div class="price">¥ 3,499.00</div>
      <a href="view.html" class="btn-style">立即购买</a>
    </div>
  </div>
  <div class="shop-item fl">
    <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/5.jpg"></a>
    <div class="info animate">
      <div class="t"><a href="view.html">派的门99分白系列</a></div>
      <p>油漆系列</p>
      <div class="price">¥ 3,499.00</div>
      <a href="view.html" class="btn-style">立即购买</a>
    </div>
  </div>
  <div class="shop-item fl">
    <a href="view.html" class="hover"><img src="catalog/view/pdoor/static/pic/shop/6.jpg"></a>
    <div class="info animate">
      <div class="t"><a href="view.html">派的门99分白系列</a></div>
      <p>油漆系列</p>
      <div class="price">¥ 3,499.00</div>
      <a href="view.html" class="btn-style">立即购买</a>
    </div>
  </div>
</div>
<!-- 热评产品 end -->