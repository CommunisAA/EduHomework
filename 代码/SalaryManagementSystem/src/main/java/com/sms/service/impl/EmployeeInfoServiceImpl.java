package com.sms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sms.entity.Employee;
import com.sms.entity.Salary;
import com.sms.entity.User;
import com.sms.model.EmployeeInfo;
import com.sms.util.PageInfo;
import com.sms.service.EmployeeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class EmployeeInfoServiceImpl implements EmployeeInfoService {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private EmployeeServiceImpl employeeService;
    @Autowired
    private SalaryServiceImpl salaryService;

    public void add(User user, Employee employee, Salary salary) {
        userService.saveOrUpdate(user);
        employeeService.saveOrUpdate(employee);
        salaryService.saveOrUpdate(salary);
    }

    public void delete(String id) {
        userService.removeById(id);
        employeeService.removeById(id);
        salaryService.removeById(id);
    }

    public void update(EmployeeInfo employeeInfo) {
        User user = userService.getById(employeeInfo.getUser().getId());
        user.setAuthorization(employeeInfo.getUser().getAuthorization());
        Employee employee = employeeService.getById(employeeInfo.getEmployee().getId());
        employee.setName(employeeInfo.getEmployee().getName());
        userService.updateById(user);
        employeeService.updateById(employee);
        salaryService.updateById(employeeInfo.getSalary());
    }

    public List<EmployeeInfo> find(String find) {
        ArrayList<EmployeeInfo> result = new ArrayList<>();
        for (Employee employee : employeeService.list(new QueryWrapper<Employee>().like("id", find).or().like("name", find))) {
            result.add(new EmployeeInfo(userService.getById(employee.getId()), employeeService.getById(employee.getId()), salaryService.getById(employee.getId())));
        }
        return result;
    }

    public PageInfo list(int page) {
        PageInfo pageInfo = new PageInfo(employeeService.page(new Page<Employee>(page, 5)));
        ArrayList<EmployeeInfo> result = new ArrayList<>();
        for (Object object : pageInfo.getRecords()) {
            Employee employee = (Employee) object;
            result.add(new EmployeeInfo(userService.getById(employee.getId()), employeeService.getById(employee.getId()), salaryService.getById(employee.getId())));
        }
        pageInfo.setRecords(result);
        return pageInfo;
    }
}
