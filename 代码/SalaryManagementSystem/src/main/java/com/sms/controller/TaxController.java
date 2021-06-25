package com.sms.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sms.entity.Employee;
import com.sms.entity.Salary;
import com.sms.entity.Tax;
import com.sms.entity.User;
import com.sms.model.EmployeeInfo;
import com.sms.service.impl.TaxServiceImpl;
import com.sms.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author w
 * @since 2020-12-17
 */
@Controller
@RequestMapping("/sms/tax")
public class TaxController {
    @Autowired
    private TaxServiceImpl taxService;

    @RequestMapping("list.do")
    public String list(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        model.addAttribute("pageInfo", new PageInfo(taxService.page(new Page<>(page, 99))));
        return "listTax";
    }

    @RequestMapping("add.do")
    @ResponseBody
    public String add(Tax tax) {
        taxService.saveOrUpdate(tax);
        return "true";
    }

    @RequestMapping("update.do")
    @ResponseBody
    public String update(Tax tax) {
        if(tax.getEnd() == null)
            tax.setEnd(-1f);
        taxService.updateById(tax);
        return "true";
    }

    @RequestMapping("delete.do")
    @ResponseBody
    public String delete(String id) {
        taxService.removeById(id);
        return "true";
    }

}

