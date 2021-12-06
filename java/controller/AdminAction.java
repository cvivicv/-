package controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entities.Carmessage;
import entities.Contactmessage;
import entities.Usermessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.AdminService;
import service.ContactService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: Antenna
 * @todoing:后台管理-用户管理
 * @author:Mr.C
 * @@create: 2021-06-08 08:19
 **/
@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class AdminAction {
    //连接mapper接口
    @Autowired
    private AdminService adminService;

    /*--用户管理--*/
    //查询用户信息
    @RequestMapping("UserDoing.html")
    public String SelectUser(Model model,@RequestParam(value="page",defaultValue = "1") Integer page){
            //获取指定页数据
            PageHelper.startPage(page,10);
            List<Map<String,Object>> selectuser = adminService.SelectUser();
            PageInfo pageInfo=new PageInfo(selectuser,10);
            model.addAttribute("pageInfo",pageInfo);
            model.addAttribute("page",page);
            return "WEB-INF/admin-web/alluser.jsp";
    }
    //添加用户信息
    @RequestMapping("UserAdd.html")
    public String adduser(int userid,String username,String password,String email,@RequestParam(value="page",defaultValue = "1") Integer page){
        //获取当前时间，设定账号创建日期
            Date day=new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String cometime=df.format(day);
        //用户账号资金为0
        int money=0;
        if (adminService.AddUser(userid,username,password,email,cometime,money) > 0) {
            return "UserDoing.html?page"+page;
        }
        return "error.jsp";
    }

    //查询单条信息以及删除
    @RequestMapping("MoreUserDoing.html")
    public String MoreUserDoing(@RequestParam(value = "event")String event, Model model,int userid,@RequestParam(value="page",defaultValue = "1") Integer page){
        if(event.equals("oneuser")) {
            Usermessage oneuser=adminService.SelectOneUser(userid);
            model.addAttribute("oneuser", oneuser);
            model.addAttribute("page",page);
            return "WEB-INF/admin-web/Updateuser.jsp";
        }else if(event.equals("deleteuser")){
            if(adminService.DeleteUser(userid)>0){
                return "UserDoing.html?page="+page;
            }
            return "error.jsp";
        }
        return "error.jsp";
    }
    //修改信息
    @RequestMapping("UpdateDoing.html")
    public String UpdateUserDoing(int userid,String username,String password,String email,int money,@RequestParam(value="page",defaultValue = "1") Integer page){
        if(adminService.UpdateUser(userid,username,password,email,money)>0){return "UserDoing.html?page"+page;}
        return "error.jsp";

    }
}
