<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>区域管理</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script>
        $(function(){
            //1.使用datagrid组件绑定数据
            $("#data").datagrid({
                url:"getDistrictData",
                pagination:true,  //开启分页
                pageSize:3,  //初始化页大小
                pageList:[3,9,27,81],  //页大小选项
                toolbar:'#ToolBar',
                columns:[[
                    {checkbox:true,width:100,align:'right'},
                    {field:'id',title:'编号',width:100,align:'right'},
                    {field:'name',title:'区域名称',width:100,align:'right'}
                    // {field:'operate',title:'操作',width:100,align:'right',
                    //     formatter: function(value,row,index){
                    //         value:当前字段的值  row:当前行对象  index:表示索引
                    //         return "<a href='#'>修改</a> <a href='#'>删除</a>";
                    //     }
                    // }
                ]]
            });
        });
    </script>
</head>
<body>
<div id="ToolBar">
    <div style="height: 40px;">
        <a href="javascript:goAdd()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:goUpdate()" class="easyui-linkbutton"
            iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:goDelete()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">批量删除</a>
    </div>
</div>
<table id="data"></table>
<!--添加窗口-->
<div id="addDialog" class="easyui-dialog" buttons="#addDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;position: relative;top:20%" closed="true" modal="true">
    <form id="addDialogForm" method="post">
        <table>
            <tr>
                <td>区域名称:</td>
                <td>
                    <input type="text" class="easyui-validatebox" required name="name"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<!--添加窗口的按钮-->
<div id="addDialogButtons">
    <a href="javascript:saveAddDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<!--修改窗口-->
<div id="upDialog" class="easyui-dialog" buttons="#upDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;position: relative;top:20%" closed="true" modal="true">
    <form id="upDialogForm" method="post">
        <%--传id给后台--%>
        <input type="hidden" name="id"/>
        <table>
            <tr>
                <td>区域名称:</td>
                <td><input type="text" class="easyui-validatebox" required name="name"/></td>
            </tr>
        </table>
    </form>
</div>
<!--修改窗口的按钮-->
<div id="upDialogButtons">
    <a href="javascript:saveUpDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeUpDialog()" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<script>
    function goAdd(){
        $("#addDialog").dialog("open").dialog('setTitle',"添加区域");
    }

    function saveAddDialog(){
        $("#addDialogForm").form("submit",{
            url:"addDistrict",
            success:function(data){
                //返回的data是字符串，先转成json
                var obj = $.parseJSON(data);
                if(obj["result"]>0){
                    closeAddDialog();
                }
            }
        })
    }

    function closeAddDialog(){
        $("#addDialog").dialog("close");
    }

    function goUpdate(){
        //1.获取datagrid的选中行
        var selObjs=$("#data").datagrid("getSelections");
        //2.验证是否选中一行
        if(selObjs.length===1){
            $("#upDialog").dialog("open").dialog('setTitle',"编辑区域");
            var id = selObjs[0]["id"];
            $.post(
                "getDistrict",
                {"id":id},
                function(data){
                    $("#upDialogForm").form('load',data);
                }
            )
        }else{
            $.messager.alert('友情提示','你没有选中行或者选中了多行，请选择一行修改，真他妈笨，选一行都不会','info');
        }
    }

    function saveUpDialog(){
        $("#upDialogForm").form("submit",{
            url:"changeDistrict",
            success:function(data){
                //返回的data是字符串，先转成json
                var obj = $.parseJSON(data);
                if(obj["result"]>0){
                    //刷新表格
                    $("#data").datagrid("reload");
                }
                closeUpDialog();
            }
        })
    }

    function closeUpDialog(){
        $("#upDialog").dialog("close");
    }

    function goDelete(){
        var selObjs=$("#data").datagrid("getSelections");
        if(selObjs.length>0){
            var ids = "";
            for(var i = 0;i<selObjs.length;i++){
                ids += selObjs[i]["id"]+",";
            }
            ids = ids.substring(0,ids.length-1);
            $.post(
                "deleteManyDistrict",
                {"ids":ids},
                function(data){
                    if(data["result"]>0){
                        $.messager.alert('提示','删除成功','info');
                        $("#data").datagrid("reload");
                    }else{
                        $.messager.alert('提示','删除失败','info');
                    }

                }
            )
        }else{
            $.messager.alert('提示','至少选择一行','info');
        }
    }
</script>
</body>
</html>
