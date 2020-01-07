package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ssm.pojo.User;
import ssm.service.SignService;
import ssm.util.MD5Utils;
import ssm.util.SmsUtil;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("page")
public class UserController {

    @Autowired
    private SignService service;

    @RequestMapping("checkExist")
    @ResponseBody
    public boolean checkExist(String name){
        return service.checkExist(name);
    }

    @RequestMapping("signUp")
    public String signUp(User user){
        return service.signUp(user)?"redirect:login.jsp":"redirect:regs.jsp";
    }

    @RequestMapping("signIn")
    public String signIn(String name, String password, HttpSession session, Model model){
        password = MD5Utils.md5Encrypt(password);
        User user = service.signIn(name, password);
        if(user!=null){
            session.setAttribute("user",user);
            session.setMaxInactiveInterval(60*10);//10分钟失效
            return "redirect:getHouseByUser?page=1";
        }
        model.addAttribute("status","0");
        return "login";
    }

    @RequestMapping("getVerifyCode")
    @ResponseBody
    public String getVerifyCode(String phoneNum, HttpSession session){
        //将验证码发到手机，并存入session
        int code = 100000 + (int)(Math.random()*899999);
        String message = "你的验证码是"+ code+ "。用完请删除...";
        //SmsUtil.sendMsg(message, phoneNum);
        session.setAttribute("code", 999999+"");//测试的验证码999999
        return "{\"result\":"+1+"}";
    }

    @RequestMapping("signWithPhone")
    public String signWithPhone(String verifycode,HttpSession session){
        String code = (String)session.getAttribute("code");
        if(verifycode.equals(code)){
            return "login";
        }else{
            return "phoneLogin";
        }
    }
}
