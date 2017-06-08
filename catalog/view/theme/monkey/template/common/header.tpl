<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>商城 - 派的门</title>
  <meta name="Keywords" content="" />
  <meta name="Description" content=""/>
  <link rel="stylesheet" type="text/css" href="catalog/view/pdoor/static/basic.css">
  <link rel="stylesheet" type="text/css" href="catalog/view/pdoor/static/shop.css">
  <script type="text/javascript" src="catalog/view/pdoor/static/js/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="catalog/view/pdoor/static/js/swiper.min.js"></script>
  <script type="text/javascript" src="catalog/view/pdoor/static/js/common.js"></script>
  <script type="text/javascript" src="catalog/view/pdoor/static/js/shop.js"></script>
  <style>
    .pb-swiper .swiper-container .swiper-slide img{
      width: 100% !important;
    }
  </style>
</head>
<body>
<!-- 顶部 -->
<div class="shop-topbar wrap">
  欢迎光临派的门
  <a href="login.html">请登录</a>
  <a href="reg.html">免费注册</a>
  <i class="pipe"></i>
  <a href="my-order.html">我的订单</a>
  <a href="javascript:;">企业采购</a>
  <a href="javascript:;">客户服务</a>
  <i class="pipe"></i>
  <a href="cart.html"><i class="fm-ico fm-cart"></i>购物车（0）</a>

  <?php if ($qq_login_status) {  ?>
  <?php if (!$logged) { ?>
  <?php if ($qq_nickname) {  ?>
  <?php echo $qq_nickname; ?>
  <?php } else { ?>
       <a href="<?php echo $qq_login_url; ?>"><span class="hidden-xs hidden-sm hidden-md"><img src="catalog/view/theme/default/image/qq_login.png"></span></a>
  <?php
        	}
            }
            }
        ?>
  <a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span>
  <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>

  <?php if ($logged) { ?>
  <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
  <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
  <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
  <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
  <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
  <?php } else { ?>
  <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
  <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
  <?php } ?>

  <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a>
  <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a>
  <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a>
</div>
<!-- 顶部 -->

<div class="shop-header header cf">
  <div class="wrap">
    <div class="logo"><a href="catalog/view/pdoor/html-p/index.html">派的门</a></div>
    <div class="fr">
      <div class="shop-header-search">
        <form>
          <input id="searchtext" name="keyword" type="text" placeholder="请输入搜索内容...">
          <button type="submit" class="animate">搜索</button>
        </form>
      </div>
      <div class="shop-header-nav header-nav">
        <a class="curr" href="/">首页</a>
        <a href="<?php echo $shop; ?>">发现更多产品</a>
        <a href="<?php echo $classic; ?>">经典系列</a>
        <a href="<?php echo $case; ?>">客户案例</a>
        <a href="<?php echo $activity; ?>">最新活动</a>
        <a href="<?php echo $news; ?>">知识课堂</a>
        <a href="<?php echo $brand; ?>">品牌精髓</a>
      </div>
    </div>
  </div>
  <div id="header-menu" class="cf">
    <!-- <div id="header-nav-1" class="menubox cf">
       <a href="catalog/view/pdoor/pc-shop/list.html"><img src="catalog/view/pdoor/static/pic/shop/1.jpg">餐厅</a>
       <a href="catalog/view/pdoor/pc-shop/list.html"><img src="catalog/view/pdoor/static/pic/shop/2.jpg">卧室</a>
       <a href="catalog/view/pdoor/pc-shop/list.html"><img src="catalog/view/pdoor/static/pic/shop/3.jpg">书房</a>
       <a href="catalog/view/pdoor/pc-shop/list.html"><img src="catalog/view/pdoor/static/pic/shop/4.jpg">儿童房</a>
       <a href="catalog/view/pdoor/pc-shop/list.html"><img src="catalog/view/pdoor/static/pic/shop/5.jpg">浴室</a>
       <a href="catalog/view/pdoor/pc-shop/list.html"><img src="catalog/view/pdoor/static/pic/shop/6.jpg">辅料</a>
       <a href="catalog/view/pdoor/pc-shop/list.html"><img src="catalog/view/pdoor/static/pic/shop/7.jpg">五金</a>
     </div>
     <div id="header-nav-2" class="menubox">
       <a href="classic.html"><img src="catalog/view/pdoor/static/pic/shop/8.jpg">经典系列</a>
     </div>
     <div id="header-nav-3" class="menubox">
       <a href="case.html"><img src="catalog/view/pdoor/static/pic/shop/2.jpg">客户案例</a>
     </div>
     <div id="header-nav-4" class="menubox">
       <a href="activity.html"><img src="catalog/view/pdoor/static/pic/shop/4.jpg">最新活动</a>
     </div>
     <div id="header-nav-5" class="menubox">
       <a href="news.html"><img src="catalog/view/pdoor/static/pic/shop/6.jpg">知识课堂</a>
     </div>
     <div id="header-nav-6" class="menubox">
       <a href="brand.html"><img src="catalog/view/pdoor/static/pic/shop/3.jpg">品牌精髓</a>
       <a href="brand-ut.html"><img src="catalog/view/pdoor/static/pic/shop/1.jpg">极致工艺</a>
       <a href="brand-ss.html"><img src="catalog/view/pdoor/static/pic/shop/7.jpg">服务体系</a>
     </div>
   </div>-->
  </div>
  <!-- 头部 end -->
</div>