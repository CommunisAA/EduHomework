package com.sms.realm;

import com.sms.entity.User;
import com.sms.service.impl.UserServiceImpl;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

public class UserRealm extends AuthorizingRealm {
    @Resource
    private UserServiceImpl userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //从token中获取登录的用户名， 查询数据库返回用户信息
        System.out.println("---登录认证---");
        String username = (String) token.getPrincipal();
        System.out.println("token:"+token);
        System.out.println("username:"+username);
        System.out.println("userService:"+userService);
        User user = userService.getById(username);
        if (user == null)
            return null;
        return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(user.getId()), getName());
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user = (User) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        List<String> permissions = new ArrayList<>();
        permissions.add(user.getAuthorization() +":"+ user.getPermission());
        info.addStringPermissions(permissions);

        List<String> roles = new ArrayList<>();
        roles.add(String.valueOf(user.getAuthorization()));
        info.addRoles(roles);

        return info;
    }

}
