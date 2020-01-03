package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.mapper.UserMapper;
import ssm.pojo.User;
import ssm.service.SignService;
import ssm.util.MD5Utils;

@Service
public class SignServiceImpl implements SignService {

    @Autowired
    private UserMapper userMapper;

    public boolean checkExist(String name) {
        return userMapper.checkExist(name)>0;
    }

    public boolean signUp(User user){
        //加密密码
        user.setPassword(MD5Utils.md5Encrypt(user.getPassword()));
        return userMapper.signUp(user)>0;
    }

    public User signIn(String name, String password){
        return userMapper.signIn(name, password);
    }
}
