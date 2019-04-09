package com.manong.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Bank;

import java.util.ArrayList;
import java.util.List;

@Controller
public class FreemarkerTest {

    @RequestMapping("/hello")
    public String sayHello(Model model){

        model.addAttribute("name","fangzhi");
        return "hello";
    }

    @RequestMapping("/hi")
    public String sayHi(Model model){

        model.addAttribute("name","xiaoyu");
        return "hi";
    }

    @RequestMapping("/desk")
    public String desk(Model model){

        model.addAttribute("name","xx收银台");
        model.addAttribute("orderNo","20190403543534");
        model.addAttribute("orderAmount","314.50");
        model.addAttribute("orderDesc","雀巢咖啡");

        List<Bank> banks = new ArrayList<Bank>();
        banks.add(new Bank(1,"中国农业银行","ABC"));
        banks.add(new Bank(2,"交通银行","BCOM"));
        banks.add(new Bank(3,"中国银行","BOC"));
        banks.add(new Bank(4,"渤海银行","BOHC"));
        banks.add(new Bank(5,"中国建设银行","CCB"));
        banks.add(new Bank(6,"中国光大银行","CEB"));
        banks.add(new Bank(7,"兴业银行","CIB"));
        banks.add(new Bank(8,"中信银行","CITIC"));
        banks.add(new Bank(9,"招商银行","CMB"));
        banks.add(new Bank(10,"中国民生银行","CMBC"));
        banks.add(new Bank(11,"浙商银行","CZSB"));
        banks.add(new Bank(12,"恒丰银行","EBCL"));
        banks.add(new Bank(13,"广发银行","GDB"));
        banks.add(new Bank(14,"徽商银行","HSCB"));
        banks.add(new Bank(15,"华夏银行","HXB"));
        banks.add(new Bank(16,"中国工商银行","ICBC"));
        banks.add(new Bank(17,"平安银行","PABC"));
        banks.add(new Bank(18,"中国邮政储蓄银行","PSBC"));
        banks.add(new Bank(19,"上海浦东发展银行","SPDB"));

        model.addAttribute("banks", banks);

        return "desk";
    }

}



