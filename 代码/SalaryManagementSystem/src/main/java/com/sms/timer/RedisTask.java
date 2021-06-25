package com.sms.timer;

import com.sms.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class RedisTask {
    int i = 0;

    @Autowired
    private RedisUtil redisUtil;

    @Scheduled(cron = "0/15 * * * * ?")
    public void test() {
        i++;
        System.out.println("第" + i + "次执行redisTask");
        if (redisUtil.saveToDatabase()) {
            //System.out.println(redisUtil.getWait());
            System.out.println("保存成功!");
        } else {
            System.out.println("没有数据!");
        }
    }
}
