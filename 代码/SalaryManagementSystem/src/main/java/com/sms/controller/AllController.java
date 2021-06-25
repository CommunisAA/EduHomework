package com.sms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sms.entity.Employee;
import com.sms.entity.Salary;
import com.sms.entity.SalaryHistory;
import com.sms.entity.User;
import com.sms.model.EmployeeInfo;
import com.sms.service.impl.EmployeeServiceImpl;
import com.sms.service.impl.SalaryHistoryServiceImpl;
import com.sms.service.impl.SalaryServiceImpl;
import com.sms.service.impl.UserServiceImpl;
import com.sms.util.RedisUtil;
import com.sms.util.TaxUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author w
 * @since 2020-12-01
 */
@Controller
@RequestMapping("/sms/all")
public class AllController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private EmployeeServiceImpl employeeService;
    @Autowired
    private SalaryServiceImpl salaryService;
    @Autowired
    private SalaryHistoryServiceImpl salaryHistoryService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private TaxUtil taxUtil;

    @RequestMapping("login")
    public String loginPage(Model model) {
//        System.out.println(taxUtil.getTax(10000));
//        System.out.println(taxUtil.getTax(120000));
//        for (Object salary : salaryService.list()) {
//            for(int i = 0; i < 12; i++) {
//                salaryHistoryService.save(new SalaryHistory((Salary) salary, LocalDate.now().minusMonths(i)));
//            }
//        }
        model.addAttribute("error", "请先登录!");
        return "login";
    }

    @RequestMapping("login.do")
    public String login(User user, HttpSession session, Model model) {
        if (userService.check(user)) {
            Subject currentUser = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(user.getId(),user.getPassword());
            currentUser.login(token);
            session.setAttribute("loginUser", userService.getById(user.getId()));
            session.setAttribute("loginEmployee", employeeService.getById(user.getId()));
            session.setAttribute("loginSalary", salaryService.getById(user.getId()));
            return "redirect:/sms/all/index";
        } else {
            model.addAttribute("error", "账号或密码错误!");
            return "login";
        }
    }

    @RequestMapping("logout.do")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("error", "已退出!");
        return "login";
    }

    @RequestMapping("index")
    public String index(Model model, HttpSession session) {
        User user  = (User)session.getAttribute("loginUser");
        SalaryHistory lastSalary = salaryHistoryService.getOne(new QueryWrapper<SalaryHistory>().eq("id", user.getId()).last("order by date desc limit 1"));
        if(lastSalary == null)
            lastSalary = new SalaryHistory();
        model.addAttribute("lastSalary", lastSalary);
        return "index";
    }

    @RequestMapping("add.do")
    @ResponseBody
    public String add(User user, Employee employee, Salary salary) {
        if (userService.getById(user.getId()) != null)
            return "false";
        EmployeeInfo employeeInfo = new EmployeeInfo(user, employee, salary.calculate(taxUtil.getTax(salary.getTotalsalary())));
        redisUtil.set(employeeInfo);
        System.out.println(redisUtil.get(user.getId()));
//        userService.saveOrUpdate(user);
//        employeeService.saveOrUpdate(employee);
//        salaryService.saveOrUpdate(salary.calculate());
        return "true";
    }

    @RequestMapping("delete.do")
    @ResponseBody
    public String delete(String id) {
        userService.removeById(id);
        employeeService.removeById(id);
        salaryService.removeById(id);
        return "true";
    }
}
