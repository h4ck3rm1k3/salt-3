#!/usr/bin/php -q
<?php
include 'HttpSend.php';
$sender = new HttpSend();

##############################################
# Varibles for Send SMS
##############################################
$strReg = "101100-WEB-HUAX-643368";
$strPwd = "HEXZUKPF";

$strSourceAdd = "";
$strTim = $sender->gbkToUtf8("2012-2-17 15:00:00");


##############################################
# Varibles for Register an New Account
##############################################
$strUname = $sender->gbkToUtf8("test"); 
$strMobile = "13391750000";
$strRegPhone = "01065685318";
$strFax = "01065685318";
$strEmail = "hxrt@stongnet.com";
$strPostcode = "100080";
$strCompany = $sender->gbkToUtf8("test");
$strAddress = $sender->gbkToUtf8("testja");
$strNewPwd = "AAAAAAAA";
$strRegUrl = "http://www.stongnet.com/sdkhttp/reg.aspx";
$strBalanceUrl = "http://www.stongnet.com/sdkhttp/getbalance.aspx";
$strSmsUrl = "http://www.stongnet.com/sdkhttp/sendsms.aspx";
$strSchSmsUrl = "http://www.stongnet.com/sdkhttp/sendschsms.aspx";
$strStatusUrl = "http://www.stongnet.com/sdkhttp/getmtreport.aspx";
$strUpPwdUrl = "http://www.stongnet.com/sdkhttp/uptpwd.aspx";

##############################################
# Params for API
##############################################
$strRegParam = "reg=" . $strReg . "&pwd=" . $strPwd . "&uname=" . $strUname . "&mobile=" . $strMobile . "&phone=" . $strRegPhone . "&fax=" . $strFax . 
               "&email=" . $strEmail . "&postcode=" . $strPostcode . "&company=" . $strCompany . "&address=" . $strAddress;

#$strSchSmsParam = "reg=" . $strReg . "&pwd=" . $strPwd . "&sourceadd=" . $strSourceAdd . "&tim=" . $strTim . "&phone=" . $strPhone . "&content=" . $strContent;
$strStatusParam = "reg=" . $strReg . "&pwd=" . $strPwd;
$strUpPwdParam = "reg=" . $strReg . "&pwd=" . $strPwd . "&newpwd=" . $strNewPwd;
##############################################


##############################################
#  Call an  API
##############################################
$strRes = "";
#$strRes = $sender->postSend($strRegUrl,$strRegParam);

#定时短信
#$strRes = $sender->postSend($strSchSmsUrl,$strSchSmsParam);
#strRes = $sender->postSend($strStatusUrl,$strStatusParam);
#更新密码
#strRes = $sender->postSend($strUpPwdUrl,$strUpPwdParam);


#查询余额
$strBalanceParam = "reg=" . $strReg . "&pwd=" . $strPwd;
$strRes = $sender->postSend($strBalanceUrl,$strBalanceParam);

##############################################
#  check Result
##############################################
#$strRes = "result=-11&message=余额不足";
$strInfo = split('[&=]',$strRes);
$strResult = $strInfo[1];
$strMessage = $strInfo[3];
#echo $argv[1];
#echo $argv[2];
#短信用完
if ( $strResult == "-11" )
{
    echo $strMessage;
    exit(2);
}
else
{
    #可用短信少于1000条/10元时，发送报警信息
    if ( $strResult == '0' and $strMessage < '1' )
    {
        $strMsg = $strMessage-1 . " SMS left(<1000)";
        echo $strMsg . "\n";
        $strContent = $sender->gbkToUtf8($strMsg);
        #$strRes = $sender->postSend($strSmsUrl,$strSmsParam);
        exit(1);
    }
    else
    {
        #发送短信
        $strPhone = $argv[1];
        $strMsg = $argv[2];
        echo $strMsg;
        $strContent = $sender->gbkToUtf8($strMsg);
        $strSmsParam = "reg=" . $strReg . "&pwd=" . $strPwd . "&sourceadd=" . $strSourceAdd . "&phone=" . $strPhone . "&content=" . $strContent;
        #$strRes = $sender->postSend($strSmsUrl,$strSmsParam);
        echo "SMS send ok\n";
        exit(0);
    }
}
?>
