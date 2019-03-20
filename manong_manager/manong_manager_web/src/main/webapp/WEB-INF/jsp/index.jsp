<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/css/themes/icon.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/ajaxFileUpload.js"></script>

</head>
<body class="easyui-layout">
    <div data-options="region:'west',title:'Menu',split:true,minWidth:180" style="width:100px;">
        <ul id="tt" class="easyui-tree">
            <li>
                <span>Goods Manange</span>
                <ul>
                    <li data-options="attributes:{'url':'product_list'}">Goods List</li>
                    <li data-options="attributes:{'url':'product_add'}">Goods Add</li>
                </ul>
            </li>
            <li>
                <span>Category Manange</span>
                <ul>
                    <li data-options="attributes:{'url':'product_cat_list'}">Category List</li>
                </ul>
            </li>
        </ul>
    </div>
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
        <div id="tabs" class="easyui-tabs">
            <div title="Home" style="padding:20px;display:none;">
                Home
            </div>
        </div>
    </div>
</body>
<script>
    $('#tt').tree({
        onClick: function(node){
            var tabs = $("#tabs");
            var tab = tabs.tabs("getTab",node.text);
            if(tab){
                tabs.tabs("select",node.text);
            }else{
                tabs.tabs('add',{
                    title: node.text,
                    content:'Tab Body',
                    href:node.attributes.url,
                    closable:true,
                });
            }
        }
    });

</script>
</html>
