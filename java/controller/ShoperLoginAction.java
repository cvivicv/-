package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entities.Shopermessage;
import entities.Shopmessage;
import entities.Usermessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.PurchaseService;
import service.ShopService;
import service.ShoperService;
import uploadimg.Uploadimg;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @program: Antenna
 * @todoing:对商家登录页面以及注册页面的信息进行后端处理
 * @author:Mr.C
 * @@create: 2021-11-10 14:30
 **/
@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class ShoperLoginAction {
    @Autowired
    private ShoperService shoperService;
    private ShopService shopService;
    private PurchaseService purchaseService;

    public ShoperLoginAction(ShopService shopService, PurchaseService purchaseService) {
        this.shopService = shopService;
        this.purchaseService = purchaseService;
    }


    @RequestMapping("GoShoperlogin.html")
    public String login(Model model,HttpSession session){
        //进入登录页弹窗函数不触发为0
        int error=0;
        model.addAttribute("error",error);
        session.removeAttribute("shopermessage");
        return "shoperlogin.jsp";
    }
    @RequestMapping("loginshoper.html")
    //login.jsp登录页的登录信息验证
    public String loginshoper(Model model,HttpSession session, String shopername, String password){
        if(shopername.equals("admin")&password.equals("123456")){
            return "WEB-INF/admin-web/admin-index.jsp";
        }
        else if(shoperService.LoginShoper(shopername,password)>0){
            //登陆成功，通过username查找userid一同带入session中
            int shoperid=shoperService.SelectShoperid(shopername);
            Shopermessage shopermessage=new Shopermessage();
            shopermessage.setShoperid(shoperid);
            shopermessage.setShopername(shopername);
            session.setAttribute("shopermessage",shopermessage);
            return "WEB-INF/shoper-web/shoper-index.jsp";
        }
        else if(shoperService.LoginShoper(shopername,password)==0){
            //用户名密码错误-返回登录页并弹窗
            int error=1;
            model.addAttribute("error",error);
            return "login.jsp";
        }
        return "error.jsp";
    }

    //register.jsp注册用户
    @RequestMapping("registershoper.html")
    public String registershoper(String shopername,String password){
        //用户账号资金为0
        double money=0;
        Shopermessage shopermessage=new Shopermessage(shopername,password,money);
        if (shoperService.RegisterShoper(shopermessage)> 0) {
            return "shoperlogin.jsp";
        }
        return "shoperregister.jsp";
    }

    @RequestMapping("ajaxshoper.html")
    @ResponseBody
    //register.jsp注册页的用户名重复验证
    public String shoperagain(String shopername) {

        if(shoperService.AjaxShoper(shopername)> 0){
            return "success";
        }
        else{
            return "error";
        }
    }

    @RequestMapping("shoper-first.html")
    public String shopfirst(Model model,HttpSession session){
        Shopermessage shopermessage= (Shopermessage) session.getAttribute("shopermessage");
        int shoperid=shopermessage.getShoperid();
        String shopername=shopermessage.getShopername();
        double money=shoperService.SelectShoperMoney(shoperid);
        model.addAttribute("shopername",shopername);
        model.addAttribute("money",money);
        return "WEB-INF/shoper-web/shoper-first.jsp";
    }
    //商户商品查询
    @RequestMapping("ShoperSelectShop.html")
    public String ShoperSelectShop(Model model,HttpSession session,@RequestParam(value="page",defaultValue = "1") Integer page){
            Shopermessage shopermessage= (Shopermessage) session.getAttribute("shopermessage");
            String shoper=shopermessage.getShopername();
            PageHelper.startPage(page,5);
            List<Shopmessage> selectshop=shoperService.SelectShoperShop(shoper);
            PageInfo pageInfo=new PageInfo(selectshop,5);
            model.addAttribute("pageInfo",pageInfo);
            model.addAttribute("shopername",shoper);
            model.addAttribute("page", page);
        return "WEB-INF/shoper-web/shoper-shopitem.jsp";
    }

    //商户添加商品信息
    @RequestMapping("ShoperAddShop.html")
    public String addShopershop(HttpSession session,@RequestParam("file") MultipartFile file, String shopname, String title, String type1, String type2,
                          float price, String text, int stock, @RequestParam(value="page",defaultValue = "1") Integer page) throws IOException {
        //图片上传
        String photo;
        Uploadimg uploadimg=new Uploadimg();
        photo= (String) uploadimg.uploadimg(file);
        Shopermessage shopermessage= (Shopermessage) session.getAttribute("shopermessage");
        String shoper=shopermessage.getShopername();
        int hot=0;
        if(shoper!=null){
            Shopmessage shopmessage=new Shopmessage(shopname,title,type1,type2,shoper,price,text,stock,hot,photo);
            if (shopService.AddShop(shopmessage) > 0) {
                return "ShoperSelectShop.html?page="+page;
            }
        }
        return "error.jsp";
    }

    //查询单条商品信息以及删除
    @RequestMapping("MoreShoperDoing.html")
    public String MoreShoperDoing(@RequestParam(value = "event", required = false, defaultValue = "默认值") String event, Model model, int sid,@RequestParam(value="page",defaultValue = "1") Integer page){
        Shopmessage oneshop=shopService.SelectOneShop(sid);
        if(event.equals("oneshop")) {
            model.addAttribute("oneshop", oneshop);
            model.addAttribute("page", page);
            return "WEB-INF/shoper-web/shoper-Updateshop.jsp";
        }else if(event.equals("deleteshop")){
            if(shopService.DeleteShop(sid)>0){
                //删除文件顺带删除图片
                Uploadimg uploadimg=new Uploadimg();
                uploadimg.deleteFile(oneshop.getPhoto());
                return "ShoperSelectShop.html?page="+page;
            }
            return "error.jsp";
        }
        return "error.jsp";
    }
    //修改商品信息
    @RequestMapping("UpdateShoperDoing.html")
    public String UpdateShoprDoing(@RequestParam("file") MultipartFile file,int sid,String shopname,String title,String type1,String type2,
                                   float price,String text,int stock,@RequestParam(value="page",defaultValue = "1") Integer page)throws IOException{
        Uploadimg uploadimg = new Uploadimg();
        //如果输入图片文件不为空，更新商品信息顺便删除图片
        if(file!=null) {
            Shopmessage oneshop = shopService.SelectOneShop(sid);
            uploadimg.deleteFile(oneshop.getPhoto());
        }
        //图片再次上传
        String photo;
        photo= (String) uploadimg.uploadimg(file);
        Shopmessage shopmessage=new Shopmessage(sid,shopname,title,type1,type2,price,text,stock,photo);
        if(shopService.UpdateShop(shopmessage)>0){
            return "ShoperSelectShop.html?page="+page;
        }
        return "error.jsp";
    }

    //订单页面查询
    @RequestMapping("ShoperPurchase.html")
    public String SelectPurchase(HttpSession session,Model model, @RequestParam(value="page1",defaultValue = "1") Integer page1,@RequestParam(value="page2",defaultValue = "1") Integer page2,@RequestParam(value="page3",defaultValue = "1") Integer page3){
        Shopermessage shopermessage= (Shopermessage) session.getAttribute("shopermessage");
        String shopername=shopermessage.getShopername();
        //订单之未配送查询
        PageHelper.startPage(page1,5);
        List<Map<String,Object>> selectnotdelivered = purchaseService.ShoperNotDelivered(shopername);
        PageInfo pageInfo1=new PageInfo(selectnotdelivered,5);
        model.addAttribute("pageInfo1",pageInfo1);
        //订单之已配送，已送达查询
        PageHelper.startPage(page2,5);
        List<Map<String,Object>> selectdelivering = purchaseService.ShoperDelivering(shopername);
        PageInfo pageInfo2=new PageInfo(selectdelivering,5);
        model.addAttribute("pageInfo2",pageInfo2);
        PageHelper.startPage(page3,5);
        //订单之已收货，已退款查询
        List<Map<String,Object>> selectdelivered = purchaseService.ShoperDelivered(shopername);
        PageInfo pageInfo3=new PageInfo(selectdelivered,5);
        model.addAttribute("pageInfo3",pageInfo3);
        return "WEB-INF/shoper-web/shoper-Purchase.jsp";
    }
    //订单配送中修改
    @RequestMapping("ShoperDeliveringPurchase.html")
    public String ShoperDeliveringPurchase(int purid){
        purchaseService.ShoperPurchaseDelivering(purid);
        return "ShoperPurchase.html";
    }
}
