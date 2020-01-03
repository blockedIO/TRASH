package ssm.service;

import ssm.pojo.User;

public interface SignService {

    //注册时，验证用户名是否已存在
    boolean checkExist(String name);

    //注册用户
    boolean signUp(User user);

    //验证登录
    User signIn(String name, String password);
}
