<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
    <TITLE>租房 - 用户管理</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <LINK rel=stylesheet type=text/css href="../css/style.css">
    <META name=GENERATOR ></HEAD>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV>
<DIV class=search><LABEL class="ui-green searchs"><a href="fabu.jsp">发布房屋信息</a></LABEL>
<LABEL class=ui-green><INPUT value="退       出" type=button name=search></LABEL>
 欢迎:${user.name}
</DIV></DIV>
<DIV class="main wrap">
<DIV id=houseArea>
<TABLE class=house-list>
  <TBODY>
  <c:forEach items="${pageInfo.list}" var="house">
  <TR>
    <TD class=house-thumb>
        <SPAN><A href="details.htm" target="_blank">
            <img src="http://localhost:80/${house.path}" width="100" height="75" alt="加载失败">
        </A></SPAN>
    </TD>
    <TD>
      <DL>
        <DT><A href="details.htm" target="_blank">${house.title}</A></DT>
        <DD>${house.dname}${house.sname},${house.floorage}平米<BR>联系方式：${house.contact}</DD></DL>
    </TD>
      <td>
          <c:if test="${house.ispass==0}">
              <span style="color:red">等待审核</span>
          </c:if>
          <c:if test="${house.ispass==1}">
              <span style="color:green">审核通过</span>
          </c:if>
      </td>
    <TD class=house-type>
        <LABEL class=ui-green><INPUT onclick="location.href='beforeUpdate?id=${house.id}'" value="修    改" type=button name=search></LABEL>
    </TD>
    <TD class=house-price>
        <LABEL class=ui-green><INPUT onclick="location.href='deleteHouse?id=${house.id}'" value="删    除" type=button name=search></LABEL>
    </TD>
  </TR>
  </c:forEach>
  </TBODY>
</TABLE>
</DIV>
<DIV class=pager>
<ul>
    <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="p">
  <li class=current>
      <a href="http://localhost:8080/page/getHouseByUser?page=${p}"
        parseContent="true" showError="true" targets="houseArea"
        ajaxAfterValidation="false" validate="false"
        dojoType="struts:BindAnchor">${p}</a>
  </li>
    </c:forEach>
</ul><SPAN class=total>${pageInfo.pageNum}/${pageInfo.pages}页</SPAN></DIV></DIV>
<DIV id=footer class=wrap>
</DIV>
</BODY>
</HTML>
