package com.sms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sms.entity.Employee;
import com.sms.util.PageInfo;
import com.sms.service.impl.EmployeeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author w
 * @since 2020-12-01
 */
@Controller
@RequestMapping("/sms/employee")
public class EmployeeController {
    @Autowired
    private EmployeeServiceImpl employeeService;

    @RequestMapping("list.do")
    public String list(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
//        System.out.println("page: "+page);
//        System.out.println("employeeService.page(new Page<>(page,5)).getTotal(): " + employeeService.page(new Page<>(page, 5)).getTotal());
//        System.out.println("employeeService.page(new Page<>(page,5)).getPages(): " + employeeService.page(new Page<>(page, 5)).getPages());
//        System.out.println("employeeService.page(new Page<>(page,5)).getCurrent(): " + employeeService.page(new Page<>(page, 5)).getCurrent());
        model.addAttribute("pageInfo", new PageInfo(employeeService.page(new Page<>(page, 4))));
        return "listEmployee";
    }

    @RequestMapping("listt.do")
    @ResponseBody
    public List listt() {
        return employeeService.list();
    }

//    @RequestMapping("add.do")
//    public String add(Employee employee) {
//        employeeService.saveOrUpdate(employee);
//        return "redirect:list.do";
//    }
//
//    @RequestMapping("delete.do")
//    @ResponseBody
//    public String delete(String id) {
//        employeeService.removeById(id);
//        return "true";
//    }

    @RequestMapping("update.do")
    @ResponseBody
    public String update(Employee employee) {
        employeeService.updateById(employee);
        return "true";
    }

    @RequestMapping("find.do")
    public String find(Model model, String find) {
        model.addAttribute("employees", employeeService.list(new QueryWrapper<Employee>().like("id", find).or().like("name", find)));
        return "listEmployee";
    }

    @RequestMapping("person")
    public String personInfoPage() {
        return "personInfo";
    }

    @RequestMapping("updateInfo.do")
    public String updateInfo(HttpSession session, Model model, Employee employee) {
        employeeService.updateById(employee);
        session.setAttribute("loginEmployee", employeeService.getById(employee.getId()));
        model.addAttribute("tips", "修改成功!");
        return "personInfo";
    }

}
