<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>租房 - 用户登录</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel=stylesheet href="../css/style.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.17514">
    <script src="../scripts/jquery-1.8.3.js" type="text/javascript"></script>
</HEAD>
<BODY>
<DIV id=header class=wrap>
    <DIV id=logo><img src="../images/logo.gif" alt="找不到图片"></DIV></DIV>
<DIV id=regLogin class=wrap>
    <DIV class=dialog>
        <DIV class=box>
            <H4>用户登录</H4>
            <FORM id=user method=post name=user action="#">
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD colspan=2></TD></TR>
                        <TR>
                            <TD class=field>手    机：</TD>
                            <TD><INPUT id="phoneNum" class=text type=text name="phoneNum">
                                <input id="getCode" type="button" value="获取验证码">
                                <span id="counting"></span></TD></TR>
                        <TR>
                            <TD class=field>密　　码：</TD>
                            <TD><INPUT id=user_password class=text type=password name=password> </TD>
                        </TR>
                        </TBODY>
                    </TABLE>
                    <DIV class=buttons> <INPUT value=登陆 type=submit name="sum1">
                        <INPUT onclick='document.location="regs.jsp"' value=注册 type=button>
                    </DIV>
                </DIV>
            </FORM>
        </DIV>
    </DIV>
</DIV>
<DIV id=footer class=wrap>
</DIV>
<script>
    $("#getCode").on("click",function(){
        $.post("getVerifyCode",{"phoneNum":$("#phoneNum").val()},function(data){
            if(data["result"]>0){
                countDown();
            }
        },"json")
    });

    function countDown(){
        $("#getCode").hide();
        var i = 60;
        var interval = setInterval(function(){
            $("#counting").text("获取成功，"+i+"秒后失效");
            i--;
            if(i<0){
                $("#counting").text("");
                $("#getCode").show();
                clearInterval(interval);
            }
        },1000);
    }
</script>
</BODY>
</HTML>
