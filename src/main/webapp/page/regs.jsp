<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
  <TITLE>租房 - 用户注册</TITLE>
  <META content="text/html; charset=utf-8" http-equiv=Content-Type>
  <LINK rel=stylesheet type=text/css href="../css/style.css">
  <META name=GENERATOR content="MSHTML 8.00.7601.17514">
</HEAD>
<script type="text/javascript" src="../admin/js/jquery-1.8.3.js"></script>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><img src="../images/logo.gif" alt="找不到图片"></DIV></DIV>
<DIV id=regLogin class=wrap>
<DIV class=dialog>
<DL class=clearfix>
  <DT>新用户注册</DT>
  <DD class=past>填写个人信息</DD></DL>
<DIV class=box>
<FORM action="signUp" method="post" name="form1">
<DIV class=infos>
<TABLE class=field>
  <TBODY>
  <TR>
    <TD class=field>用 户 名：</TD>
    <TD><INPUT class=text id="inputname" type=text name=name onchange="checkName()"><span id="notice"></span>
    </TD>
  </TR>
  <TR>
    <TD class=field>密　　码：</TD>
    <TD><INPUT class=text type=password name=password></TD></TR>
  <TR>
    <TD class=field>确认密码：</TD>
    <TD><INPUT class=text type=password name=repassword> </TD></TR>
  <TR>
    <TD class=field>电　　话：</TD>
    <TD><INPUT class=text type=text name=telephone> </TD></TR>
  </TBODY>
</TABLE>
<DIV class=buttons>
<INPUT value=立即注册 type=submit >
</DIV>
</DIV>
</FORM>
</DIV>
</DIV>
</DIV>
<DIV id=footer class=wrap>
</DIV>
<script>
  function checkName(){
    var name = $("#inputname").val();
    $.post(
          "checkExist",
          {name:name},
          function(data){
            if(data==false){
              $("#notice").html("用户名可注册").css("color","green");
            }else{
              $("#notice").html("用户名已存在").css("color","red");
            }
          }
    );
  }
</script>
</BODY>
</HTML>
