package controller;



import com.sun.org.apache.xpath.internal.operations.Mod;
import entities.Contactmessage;
import entities.Usermessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ContactService;
import service.UserService;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program: Antenna
 * @todoing:对用户登录页面以及注册页面的信息进行后端处理
 * @author:Mr.C
 * @@create: 2021-06-01 18:49
 **/
@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class LoginAndRegisterAction{
    //连接mapper接口
    @Autowired
    private UserService userService;

    @RequestMapping("Gologin.html")
    public String login(Model model){
        //进入登录页弹窗函数不触发为0
        int error=0;
        model.addAttribute("error",error);
        return "login.jsp";
    }
    /*业务处理*/
    @RequestMapping("login.html")
    //login.jsp登录页的登录信息验证
    public String loginuser(Model model, HttpSession session, String username, String password){
        if(username.equals("admin")&password.equals("123456")){
            return "WEB-INF/admin-web/admin-index.jsp";
        }
        else if(userService.Login(username,password)>0){
            if(session.getAttribute("usermessage")!=null) {
                //清除一次历史残留session
                session.removeAttribute("usermessage");
            }
            //登陆成功，通过username查找userid一同带入session中
            int userid=userService.SelectUserid(username);
            Usermessage usermessage=new Usermessage();
            usermessage.setUserid(userid);
            usermessage.setUsername(username);
            session.setAttribute("usermessage",usermessage);
            return "indexsuccess.html";
        }
        else if(userService.Login(username,password)==0){
            //用户名密码错误-返回登录页并弹窗
            int error=1;
            model.addAttribute("error",error);
            return "login.jsp";
        }
        return "error.jsp";
    }



    //register.jsp注册用户
    @RequestMapping("register.html")
    public String registeruser(String username,String password,String email){
        //获取当前时间，设定账号创建日期
        String cometime;
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        cometime=df.format(day);
        //用户账号资金为0
        double money=0;
        Usermessage usermessage=new Usermessage(username,password,email,cometime,money);
        if (userService.Register(usermessage)> 0) {
            return "login.jsp"; }
        return "register.jsp";
    }

    @RequestMapping("registeruser.html")
    @ResponseBody
    //register.jsp注册页的用户名重复验证
    public String useragain(String username) {
        if(userService.AjaxUser(username)> 0){
            return "success";
        }
        else{
            return "error";
        }
    }

    @RequestMapping("registeremail.html")
    @ResponseBody
    //register.jsp注册页的邮箱重复验证
    public String emailagain(String email){
            if(userService.AjaxEmail(email)> 0){
                return "success";
            }else {
                return "error";
            }
    }
}
