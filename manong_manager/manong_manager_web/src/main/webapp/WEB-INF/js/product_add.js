var MN = MANONG = {

    initProductCategory:function(){
       function loadSubCategory(value){
           var $box = $("#productAddForm").find("#cbox");

           if(value==0){
               $box.html('').hide();
               return
           };

           $.getJSON("/product_category/list",{id:value},function (data) {
               var s = '';
               s += '<select id="cc2" class="easyui-combobox" name="cid2" style="width:200px;">'
               s += '<option value="0">请选择二级分类</option>';

               $.each(data,function (idx,item) {
                   s += '<option value="'+item.id+'">' + item.text + '</option>';
               })

               s += '</select>';
               $box.html(s).show();
               $("#productAddForm").find("select[name='cid2']").combobox({
                   onChange:function () {
                       var value = $("#cc2").val();
                       if(value==0){
                           $("#productAddForm").find("input[name='categoryId']").val($("#productAddForm").find("input[name='cid1']").val());
                       }else{
                           $("#productAddForm").find("input[name='categoryId']").val(value);
                       }
                   }
               });
           })



       }

      $("#productAddForm").find("select[name='cid']").combobox({
          onChange:function () {
              var value = $("#cc").val();
              loadSubCategory(value);
          }
      })

    },

    initPicUpload:function() {
        $("#fileName").filebox({
            prompt: "选择图片",
            width: 200,
            buttonText: "浏览图片"
        })

        $("#uploadPic").click(function () {
            $.ajaxFileUpload({
                url:'/uploadfile',
                fileElementId:'filebox_file_id_1',
                type:"post",
                success:function (data) {
                    var document = $(data).context;
                    var txt = document.getElementsByTagName("body")[0].innerText;
                    $("#img").attr("src","http://fangzhi.ml:8888/"+ JSON.parse(txt).msg );
                    $("#productAddForm").find("input[name='image']").val(JSON.parse(txt).msg);
                }
            })
        })
    },
    init:function (data) {
        // 初始化商品分类
        this.initProductCategory();

        // 初始化上传图片
        this.initPicUpload();
    }
}