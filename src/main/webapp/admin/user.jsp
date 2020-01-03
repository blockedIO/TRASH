<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索用户</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script>
        $(function(){
            //1.使用datagrid组件绑定数据
            $("#data").datagrid({
                url:"getUserData",
                pagination:true,  //开启分页
                pageSize:3,  //初始化页大小
                pageList:[3,9,27,81],  //页大小选项
                toolbar:'#ToolBar',
                columns:[[
                    {checkbox:true,width:100,align:'right'},
                    {field:'id',title:'用户编号',width:100,align:'right'},
                    {field:'name',title:'用户名',width:100,align:'right'},
                    {field:'telephone',title:'电话',width:100,align:'right'},
                    {field:'isAdmin',title:'是否为管理员',width:100,align:'right',
                        formatter: function(value,row,index){
                            return value===0?"否":"是";
                        }
                    }
                ]]
            });
        });
    </script>
</head>
<body>
<div id="ToolBar">
    <div style="height: 40px;">
        <a href="#" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a>
        <a href="#" class="easyui-linkbutton"
           iconCls="icon-edit" plain="true">修改</a>
        <a href="#" class="easyui-linkbutton"
           iconCls="icon-remove" plain="true">批量删除</a>
        名称:<input type="text" id="inputName">
        电话:<input type="text" id="inputTel">
        <a id="btn" href="javascript:searchUser()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
    </div>
</div>
<table id="data"></table>
<script>
    function searchUser(){
        var inputName = $("#inputName").val();
        var inputTel = $("#inputTel").val();
        $("#data").datagrid("load",{
            searchName: inputName,
            searchTel: inputTel
            }
        );
    }
</script>
</body>
</html>
