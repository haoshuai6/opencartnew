﻿<?php
// cvn2加密 1：加密 0:不加密
const SDK_CVN2_ENC = 0;
// 有效期加密 1:加密 0:不加密
const SDK_DATE_ENC = 0;
// 卡号加密 1：加密 0:不加密
const SDK_PAN_ENC = 0;

// ######(以下配置为PM环境：入网测试环境用，生产环境配置见文档说明)#######
// 签名证书路径
const SDK_SIGN_CERT_PATH = '/home/wwwroot/airgle_com_cn/public_html/upop/certs/PM_898440357221925_acp.pfx';

// 签名证书密码 
const SDK_SIGN_CERT_PWD = '123456';

// 密码加密证书（这条用不到的请随便配）
const SDK_ENCRYPT_CERT_PATH = '/home/wwwroot/airgle_com_cn/public_html/upop/certs/verify_sign_acp.cer';

// 验签证书路径（请配到文件夹，不要配到具体文件）
const SDK_VERIFY_CERT_DIR = '/home/wwwroot/airgle_com_cn/public_html/upop/certs/';

// 前台请求地址
const SDK_FRONT_TRANS_URL = 'https://gateway.95516.com/gateway/api/frontTransReq.do';

// 后台请求地址
const SDK_BACK_TRANS_URL = 'https://gateway.95516.com/gateway/api/backTransReq.do';

// 批量交易
const SDK_BATCH_TRANS_URL = 'https://gateway.95516.com/gateway/api/batchTrans.do';

//单笔查询请求地址
const SDK_SINGLE_QUERY_URL = 'https://gateway.95516.com/gateway/api/queryTrans.do';

//文件传输请求地址
const SDK_FILE_QUERY_URL = 'https://101.231.204.80:9080/';

//有卡交易地址
const SDK_Card_Request_Url = 'https://gateway.95516.com/gateway/api/cardTransReq.do';

//App交易地址
const SDK_App_Request_Url = 'https://gateway.95516.com/gateway/api/appTransReq.do';


// 前台通知地址 (商户自行配置通知地址)
const SDK_FRONT_NOTIFY_URL = 'http://http://www.airgle.com.cn/upop/FrontReceive.php';

// 后台通知地址 (商户自行配置通知地址)
const SDK_BACK_NOTIFY_URL = 'http://http://www.airgle.com.cn/upop/BackReceive.php';

//文件下载目录 
const SDK_FILE_DOWN_PATH = '/home/wwwroot/airgle_com_cn/public_html/upop/file/';

//日志 目录 
const SDK_LOG_FILE_PATH = '/home/wwwroot/airgle_com_cn/public_html/upop/logs/';

//日志级别
const SDK_LOG_LEVEL = 6;
?>