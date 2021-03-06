package com.manong.portal.controller;

import com.manong.portal.service.CategoriesService;
import com.manong.portal.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Res_Categories;
import pojo.Res_Product;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    CategoriesService categoriesService;
    @Autowired
    ProductService productService;

    @RequestMapping("/home.html")
    public String index(ModelMap modelMap){
        Res_Categories categories = categoriesService.getCategories();
        List<Res_Product> products = productService.getProducts();

        modelMap.addAttribute("categories",categories);
        modelMap.addAttribute("products",products);

        return "Product";
    }

    @RequestMapping("/index-back")
    public String indexBack(ModelMap modelMap){
        Res_Categories categories = categoriesService.getCategories();
        List<Res_Product> products = productService.getProducts();

        modelMap.addAttribute("categories",categories);
        modelMap.addAttribute("products",products);

        return "index-back";
    }



}
