package com.manong.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manong.mapper.ProductMapper;
import com.manong.pojo.Product;
import com.manong.pojo.ProductExample;
import com.manong.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.EasyGrid;
import pojo.ResponseJsonResult;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public ResponseJsonResult saveProduct(Product product) {

        Integer productid = productMapper.insert(product);
        ResponseJsonResult responseJsonResult = new ResponseJsonResult();
        if(productid == null){
            responseJsonResult.setStatus(500);
            responseJsonResult.setMsg("保存失败");
            return null;
        }else{
            responseJsonResult.setStatus(200);
            responseJsonResult.setMsg("保存成功");
            return responseJsonResult;
        }

    }

    @Override
    public EasyGrid listProduct(int pages, int rows) {

        ProductExample productExample = new ProductExample();
        PageHelper.startPage(pages,rows);
        List<Product> productList = productMapper.selectByExample(productExample);

        PageInfo<Product> pageInfo = new PageInfo<>(productList);

        EasyGrid easyGrid = new EasyGrid();
        easyGrid.setTotal((int) pageInfo.getTotal());
        easyGrid.setRows(productList);

        return easyGrid;
    }


}
