<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>审核出租房</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script>
        $(function(){
            //1.使用datagrid组件绑定数据
            $("#data").datagrid({
                url:"getHouseData",
                pagination:true,  //开启分页
                pageSize:3,  //初始化页大小
                pageList:[3,9,27,81],  //页大小选项
                toolbar:'#ToolBar',
                columns:[[
                    {checkbox:true,width:100,align:'right'},
                    {field:'id',title:'房屋编号',width:100,align:'right'},
                    {field:'title',title:'标题',width:100,align:'right'},
                    {field:'tname',title:'房屋类型',width:100,align:'right'},
                    {field:'dname',title:'区域',width:100,align:'right'},
                    {field:'sname',title:'街道',width:100,align:'right'},
                    {field:'floorage',title:'面积',width:100,align:'right'},
                    {field:'price',title:'价格',width:100,align:'right'},
                    {field:'contact',title:'联系人',width:100,align:'right'},
                    {field:'ispass',title:'审核状态',width:100,align:'right',
                        formatter: function(value,row,index) {
                            if (value === 0) {
                                return "待审核";
                            } else if (value === 1) {
                                return "已审核";
                            } else if (value === 2) {
                                return "审核未通过";
                            }
                        }
                    },
                    {field:'operate',title:'审核操作',width:100,align:'right',
                        formatter: function(value,row,index){
                            return "<a href='javascript:goPass(" +row["id"]+ ")'>确认审核</a>"
                        }
                    }
                ]]
            });
        });
    </script>
</head>
<body>
<table id="data"></table>
<script>
    function goPass(id){
        $.post("passHouse",{"id":id,"state":1},function(data){
            if(data.result>0){
                $("#data").datagrid("reload");
            }else {
                $.messager.alert("审核失败");
            }
        })
    }
</script>
</body>
</html>
