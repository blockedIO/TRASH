<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>租房 -发布房屋信息</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <LINK rel=stylesheet type=text/css href="../css/style.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.17514">
    <script src="../scripts/jquery-1.8.3.js" type="text/javascript"></script>
</HEAD>
<BODY>
<script>
    $(function(){
        $.post("getTypeList",{},function(data){
            for (var i = 0; i < data.length; i++) {
                var node = $("<option value='"+data[i]["id"]+"'>"+data[i]["name"]+"</option>");
                $("#typelist").append(node);
            }
            $("#typelist").val(${house.typeId});
        });

        $.post("getDistrictList",{},function(data){
            for (var i = 0; i < data.length; i++) {
                var node = $("<option value='"+data[i]["id"]+"'>"+data[i]["name"]+"</option>");
                $("#districtlist").append(node);
            }
            $("#districtlist").val(${house.did});
            $.post("getStreetList",{"districtId":${house.did}},function(data){
                for (var i = 0; i < data.length; i++) {
                    var node = $("<option value='" + data[i]["id"] + "'>" + data[i]["name"] + "</option>");
                    $("#streetlist").append(node);
                }
                $("#streetlist").val(${house.streetId});
            });
        });

        $("#districtlist").on("change",function(){
            var districtId = $(this).val();
            $("#streetlist").html("<option value='-1'>==请选择==</option>");
            $.post("getStreetList",{"districtId":districtId},function(data){
                for (var i = 0; i < data.length; i++) {
                    var node = $("<option value='" + data[i]["id"] + "'>" + data[i]["name"] + "</option>");
                    $("#streetlist").append(node);
                }
            });
        });
    })
</script>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=regLogin class=wrap>
    <DIV class=dialog>
        <DL class=clearfix>
            <DT>房屋信息展示</DT>
            <DD class=past>修改房屋信息</DD></DL>
        <DIV class=box>
            <FORM method="post" action="updateHouse?id=${house.id}" enctype="multipart/form-data">
                <DIV class=infos>
                    <input type="hidden" name="path" value="${house.path}">
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD class="field">标　　题：</TD>
                            <TD><INPUT class="text" type="text" name="title" value="${house.title}"></TD>
                        </TR>
                        <TR>
                            <TD class="field">户　　型：</TD>
                            <TD>
                                <SELECT class="text" name="typeId" id="typelist">
                                    <option value="-1">==请选择==</option>
                                </SELECT>
                            </TD>
                        </TR>
                        <TR>
                            <TD class="field">面　　积：</TD>
                            <TD><INPUT class="text" type="text" name="floorage" value="${house.floorage}"></TD>
                        </TR>
                        <TR>
                            <TD class="field">价　　格：</TD>
                            <TD><INPUT class="text" type="text" name="price" value="${house.price}"></TD>
                        </TR>
                        <TR>
                            <TD class="field">房产证日期：</TD>
                            <TD><INPUT class="text" type="date" name="pubdate" value="<fmt:formatDate value='${house.pubdate}' pattern='yyyy-MM-dd'/>"></TD></TR>
                        <TR>
                            <TD class="field">位　　置：</TD>
                            <TD>区：
                                <SELECT class="text" id="districtlist">
                                    <option value="-1">==请选择==</option>
                                </SELECT>
                                街：<SELECT class="text" name="streetId" id="streetlist">
                                    <option value="-1">==请选择==</option>
                                </SELECT>
                            </TD>
                        </TR>
                        <TR>
                            <TD class="field">联系方式：</TD>
                            <TD><INPUT class="text" type="text" name="contact" value="${house.contact}"></TD>
                        </TR>
                        <TR>
                            <TD class="field">详细信息：</TD>
                            <TD><TEXTAREA name="description" style="resize: none">${house.description}</TEXTAREA></TD>
                        </TR>
                        <TR>
                            <TD class="field">修改图片：</TD>
                            <TD><img src="http://localhost:80/${house.path}" width="100">
                                <input type="file" name="insertFile"></TD>
                        </TR>
                        </TBODY></TABLE>
                    <DIV class=buttons><INPUT onclick="document.location='list.htm'" value="立即修改" type="submit">
                    </DIV></DIV></FORM></DIV></DIV></DIV>
<DIV id=footer class=wrap></DIV>
</BODY>
</HTML>
