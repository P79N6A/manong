<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2019/1/16
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Goods Category</title>
</head>
<body>
    <ul id="productCategory" class="easyui-tree"></ul>
    <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
        <div onclick="rename()" data-options="iconCls:'icon-edit'">Rename</div>
        <div onclick="remove()" data-options="iconCls:'icon-remove'">Remove</div>
        <div onclick="appendRoot()" data-options="iconCls:'icon-add'">appendRoot</div>
    </div>
<script>
    $(function(){

        $('#productCategory').tree({
            url: "/product_category/list", // 获取接口
            onContextMenu: function(e, node){
                e.preventDefault();
                // select the node
                $('#productCategory').tree('select', node.target);
                // display context menu
                $("#mm").menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            },
            onAfterEdit:function (node) {
                var _tree = $("#productCategory");
                if(node.id == 0){
                    // 新增
                    $.post("/product_category/add",{ parentId:node.parentId,name: node.text }, function(data){
                        if(data.status == 200){
                            _tree.tree("update",{
                                target:node.target,
                                id:data.msg
                            })
                        }else{
                            $.messager.alert("添加分类失败！")
                        }
                    })
                }else{
                    // 修改
                    $.post("/product_category/update",{id:node.id,name:node.text},function (data) {
                        if(data.status == 200){
                            _tree.tree("update",{
                                target:node.target,
                                id:data.msg
                            })
                        }else{
                            $.messager.alert("修改分类失败！")
                        }
                    })
                }
            },
        });

    })

    function append() {
        var tree = $("#productCategory");
        var node = tree.tree("getSelected");
        tree.tree('append', {
            parent: (node? node.target:null),
            data: [
                {
                    id: 0,
                    parentId: node.id,
                    text:'New Category',
                }
            ]
        });

        var _node = tree.tree('find',0);
        tree.tree('select',_node.target).tree('beginEdit',_node.target);

    };

    function appendRoot() {
        var tree = $("#productCategory");
        tree.tree('append', {
            parent: null,
            data: [
                {
                    id: 0,
                    parentId: 0,
                    text:'New Category',
                }
            ]
        });

        var _node = tree.tree('find',0);
        tree.tree('select',_node.target).tree('beginEdit',_node.target);
    }

    function rename() {
        var tree = $("#productCategory");
        var node = tree.tree("getSelected");
        tree.tree('beginEdit',node.target);

    };

    function remove() {
        var tree = $("#productCategory");
        var node = tree.tree("getSelected");

        $.post("/product_category/del",{parentId:node.attributes,id:node.id},function (data) {
            if(data.status == 200){
                tree.tree('remove',node.target);
            }else{
                $.messager.alert("删除分类失败！")
            }
        })


    };

</script>
</body>
</html>
