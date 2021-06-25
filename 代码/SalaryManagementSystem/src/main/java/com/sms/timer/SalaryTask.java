package com.sms.timer;

import com.sms.entity.Salary;
import com.sms.entity.SalaryHistory;
import com.sms.service.impl.SalaryHistoryServiceImpl;
import com.sms.service.impl.SalaryServiceImpl;
import com.sms.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class SalaryTask {
    int i = 0;

    @Autowired
    private SalaryServiceImpl salaryService;
    @Autowired
    private SalaryHistoryServiceImpl salaryHistoryService;

    @Scheduled(cron = "0 0 10 15 * ?")
    public void test() {
        i++;
        System.out.println("第" + i + "次执行salaryTask");
        for (Object salary : salaryService.list()) {
            salaryHistoryService.save(new SalaryHistory((Salary) salary));
        }
        System.out.println("工资发放成功!");
    }
}
