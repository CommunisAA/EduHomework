package com.sms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sms.entity.User;
import com.sms.service.impl.UserServiceImpl;
import com.sms.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author w
 * @since 2020-12-01
 */
@Controller
@RequestMapping("/sms/user")
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("list.do")
    public String list(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        model.addAttribute("pageInfo", new PageInfo(userService.page(new Page<>(page, 4))));
        return "listUser";
    }

    @RequestMapping("update.do")
    @ResponseBody
    public String update(User user) {
        userService.updateById(user);
        return "true";
    }

    @RequestMapping("find.do")
    public String find(Model model, String find) {
        model.addAttribute("users", userService.list(new QueryWrapper<User>().like("id", find)));
        return "listUser";
    }

    @RequestMapping("password")
    public String personPasswordPage() {
        return "personPassword";
    }

    @RequestMapping("updatePassword.do")
    public ModelAndView updatePassword(HttpSession session, User user, String newPassword) {
        if (userService.check(user)) {
            user.setPassword(newPassword);
            userService.updateById(user);
            session.invalidate();
            return new ModelAndView("login", "error", "修改成功, 请重新登录!");
        } else {
            return new ModelAndView("personPassword", "error", "密码错误");
        }
    }
}

