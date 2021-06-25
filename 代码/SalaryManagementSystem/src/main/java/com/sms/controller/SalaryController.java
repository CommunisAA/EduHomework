package com.sms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sms.entity.Salary;
import com.sms.service.impl.SalaryServiceImpl;
import com.sms.util.PageInfo;
import com.sms.util.TaxUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author w
 * @since 2020-12-01
 */
@Controller
@RequestMapping("/sms/salary")
public class SalaryController {
    @Autowired
    private SalaryServiceImpl salaryService;
    @Autowired
    private TaxUtil taxUtil;

    @RequestMapping("list.do")
    public String list(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        model.addAttribute("pageInfo", new PageInfo(salaryService.page(new Page<>(page, 4))));
        return "listSalary";
    }

    @RequestMapping("update.do")
    @ResponseBody
    public String update(Salary salary) {
        salaryService.updateById(salary.calculate(taxUtil.getTax(salary.getTotalsalary())));
        return "true";
    }

    @RequestMapping("find.do")
    public String find(Model model, String find) {
        model.addAttribute("salaries", salaryService.list(new QueryWrapper<Salary>().like("id", find)));
        return "listSalary";
    }

}

