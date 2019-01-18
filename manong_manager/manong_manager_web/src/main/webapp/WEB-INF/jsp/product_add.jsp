<%@ page import="java.util.List" %>
<%@ page import="pojo.EasyUITree" %><%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2019/1/18
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <title>Goods Add</title>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/product_add.js"></script>

<%
    List<EasyUITree> list = (List<EasyUITree>) session.getAttribute("categories");
%>
    <div style="padding: 10px">
        <form id="productAddForm" method="post">
            <table cellpadding="10px">
                <tr>
                    <td>商品名称</td>
                    <td> <input class="easyui-textbox" data-options="required:true" style="width:800px"></td>
                </tr>
                <tr>
                    <td>商品分类</td>
                    <td>
                        <select id="cc" class="easyui-combobox" name="cid" style="width:200px;">
                            <option value="0">请选择</option>
                            <%
                                for(int i=0;i<list.size();i++){
                                    EasyUITree item = list.get(i);
                            %>
                                <option value="<%=item.getId()%>"><%=item.getText()%></option>
                            <%
                                }
                            %>
                        </select>

                        <p id="cbox" style="display: none"></p>

                    </td>
                </tr>
                <tr>
                    <td>市场价格</td>
                    <td><input class="easyui-numberbox" data-options="required:true,min:0,max:99999999,precision:2" style="width:800px"></td>
                </tr>
                <tr>
                    <td>商品价格</td>
                    <td><input class="easyui-numberbox" data-options="required:true,min:0,max:99999999,precision:2" style="width:800px"></td>
                </tr>
                <tr>
                    <td>商品编号</td>
                    <td> <input class="easyui-numberbox" data-options="required:true" style="width:800px"></td>
                </tr>
                <tr>
                    <td>商品主图</td>
                    <td>
                        <a id="btn" href="#" class="easyui-linkbutton" >上传图片</a>
                    </td>
                </tr>
                <tr>
                    <td>商品描述</td>
                    <td>
                        <script id="editor" type="text/plain" style="width:800px;height:500px;"></script>
                    </td>
                </tr>
            </table>
        </form>

        <div align="center">
            <a id="submit" href="#" class="easyui-linkbutton" >提交</a>
            <a id="reset" href="#" class="easyui-linkbutton" >重置</a>
        </div>


    </div>

<script>

    $(function () {
        var ue = UE.getEditor('editor'); //实例化富文本编辑器

        MANONG.init();
    })
</script>

