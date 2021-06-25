package com.sms.service;

import com.sms.entity.Employee;
import com.sms.entity.Salary;
import com.sms.entity.User;
import com.sms.model.EmployeeInfo;
import com.sms.util.PageInfo;

import java.util.List;

public interface EmployeeInfoService {
    void add(User user, Employee employee, Salary salary);

    void delete(String id);

    void update(EmployeeInfo employeeInfo);

    List find(String find);

    PageInfo list(int page);
}
