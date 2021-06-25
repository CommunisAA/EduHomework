package com.sms.util;

import com.sms.model.EmployeeInfo;
import com.sms.service.impl.EmployeeServiceImpl;
import com.sms.service.impl.SalaryServiceImpl;
import com.sms.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.ArrayList;
import java.util.List;

public class RedisUtil {
    ArrayList wait = new ArrayList();
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private EmployeeServiceImpl employeeService;
    @Autowired
    private SalaryServiceImpl salaryService;
    @Autowired
    private RedisTemplate redisTemplate;

    public EmployeeInfo get(String id) {
        return (EmployeeInfo) redisTemplate.opsForValue().get(id);
    }

    public void set(EmployeeInfo employeeInfo) {
        wait.add(employeeInfo.getUser().getId());
        redisTemplate.opsForValue().set(employeeInfo.getUser().getId(), employeeInfo);
    }

    public boolean saveToDatabase() {
        if (wait.isEmpty())
            return false;
        for (Object id : wait) {
            EmployeeInfo employeeInfo = get((String) id);
            userService.save(employeeInfo.getUser());
            employeeService.save(employeeInfo.getEmployee());
            salaryService.save(employeeInfo.getSalary());
        }
        wait.clear();
        return true;
    }

//    public List getWait() {
//        return wait;
//    }
}
