package com.sms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sms.entity.Employee;
import com.sms.entity.SalaryHistory;
import com.sms.entity.User;
import com.sms.service.impl.EmployeeServiceImpl;
import com.sms.service.impl.SalaryHistoryServiceImpl;
import com.sms.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author w
 * @since 2020-12-16
 */
@Controller
@RequestMapping("/sms/salaryHistory")
public class SalaryHistoryController {
    @Autowired
    private SalaryHistoryServiceImpl salaryHistoryService;
    @Autowired
    private EmployeeServiceImpl employeeService;

    @RequestMapping("list.do")
    public String list(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page) {
        User user = (User)session.getAttribute("loginUser");
        model.addAttribute("pageInfo", new PageInfo(salaryHistoryService.page(new Page<>(1, 99), new QueryWrapper<SalaryHistory>().eq("id", user.getId()))));
        return "listSalaryHistory";
    }

    @RequestMapping("listE.do")
    public String listE(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        model.addAttribute("pageInfo", new PageInfo(employeeService.page(new Page<>(page, 4))));
        return "listE";
    }

    @RequestMapping("findE.do")
    public String findE(Model model, String find) {
        model.addAttribute("employees", employeeService.list(new QueryWrapper<Employee>().like("id", find).or().like("name", find)));
        return "listE";
    }

    @RequestMapping("findSalary.do")
    public String findSalary(Model model, String id) {
        //model.addAttribute("salaryHistory", salaryHistoryService.list(new QueryWrapper<SalaryHistory>().eq("id", id)));
        model.addAttribute("pageInfo", new PageInfo(salaryHistoryService.page(new Page<>(1, 99), new QueryWrapper<SalaryHistory>().eq("id", id))));
        return "listSalaryHistory";
    }

}
