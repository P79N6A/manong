<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2019/1/16
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品列表</title>
</head>
<body>
    <table class="easyui-datagrid"
           data-options="url:'/product/list',fitColumns:true,singleSelect:true">
        <thead>
        <tr>
            <th data-options="field:'id',width:100">id</th>
            <th data-options="field:'name',width:100">商品名称</th>
            <th data-options="field:'image',width:100">主图</th>
            <th data-options="field:'maketPrice',width:100">市场价格</th>
            <th data-options="field:'price',width:100">价格</th>
            <th data-options="field:'productNumber',width:100">商品编码</th>

        </tr>
        </thead>
    </table>

    <div id="bar">
        <

    </div>

</body>
</html>
