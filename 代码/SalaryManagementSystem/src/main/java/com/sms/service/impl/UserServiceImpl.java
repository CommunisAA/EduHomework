package com.sms.service.impl;

import com.sms.entity.User;
import com.sms.mapper.UserMapper;
import com.sms.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author w
 * @since 2020-12-01
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    public boolean check(User user) {
        User userTrue = getById(user.getId());
        if(userTrue != null)
            return user.getPassword().equals(userTrue.getPassword());
        else
            return false;
    }
}
