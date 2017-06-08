<?php echo $header; ?>
<!-- 位置 -->
<div class="location wrap">
  <a href="../html-p/index.html">首页</a> / <span>会员登录</span>
</div>
<!-- 位置 end -->
<div class="wrap" id="position-fixed">
  <!-- 注册 -->
  <div class="register">
    <div class="my-form cf">
      <div class="my-box">
        <div class="form-block">
          <div class="t"><strong>注册新账户</strong></div>
          <p>创建并登录您的个人账户，您将在派的门网站享受更多。</p>
          <div class="sp20"></div>
          <dl class="item cf">
            <dt><em>*</em>手机</dt>
            <dd>
              <input type="text" placeholder="请输入手机号码" maxlength="11" style="width:141px">
              <input type="button" class="btn-style btn-send-yzm" onclick="setyzm(this,60)" value="获取验证码" />
              <span class="tip"><i class="pd-ico pd-ok"></i></span>
            </dd>
          </dl>
          <dl class="item cf">
            <dt><em>*</em>验证码</dt>
            <dd>
              <input type="text" placeholder="请输入短信验证码">
              <span class="tip"><i class="pd-ico pd-ok"></i></span>
            </dd>
          </dl>
          <dl class="item cf">
            <dt><em>*</em>密码</dt>
            <dd>
              <input type="password" placeholder="请输入7-20个字符">
              <span class="tip"><i class="pd-ico pd-err"></i></span>
            </dd>
          </dl>
          <dl class="item cf">
            <dt><em>*</em>确认密码</dt>
            <dd>
              <input type="password">
              <span class="tip"><i class="pd-ico pd-err"></i></span>
            </dd>
          </dl>
          <dl class="item cf" id="enterprise" style="display:none;">
            <dt><em>*</em>企业名称</dt>
            <dd>
              <input type="text">
              <p class="tip">企业账号需通过审核后才能正常使用</p>
            </dd>
          </dl>
          <p class="agreement"><label class="label-input"><input type="checkbox" onchange="$(this).is(':checked')?$('#enterprise').show():$('#enterprise').hide()"><em></em><span>我要注册为企业账号</span></label></p>
          <p class="agreement"><label class="label-input"><input type="checkbox"><em></em><span>我已阅读并同意网站的 <a href="javascript:;" class="fc-blue">注册协议</a> 和 <a href="javascript:;" class="fc-blue">隐私政策</a></span></label></p>
          <div class="sp20"></div>
          <div class="form-btn">
            <a href="login.html" class="btn-style blue big">立即注册</a>
            <a href="shop.html" class="btn-style bor big">返回</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
