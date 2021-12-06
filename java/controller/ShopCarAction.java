package controller;

import entities.Carmessage;
import entities.Contactmessage;
import entities.Shopmessage;
import entities.Usermessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CarService;
import service.ContactService;
import service.ShopService;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * @program: Antenna
 * @todoing:购物车以及访问订单的后端处理
 * @author:Mr.C
 * @@create: 2021-08-24 15:10
 **/

@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class ShopCarAction {

    @Autowired
    private CarService carService;
    private ShopService shopService;
    private ContactService contactService;

    public ShopCarAction(ShopService shopService, ContactService contactService) {
        this.shopService = shopService;
        this.contactService = contactService;
    }

    @RequestMapping("AddCar.html")
    public String AddCar(HttpSession session, int sid,@RequestParam(value="sell", defaultValue = "1") int sell){
        Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
        Integer userid=usermessage.getUserid();
        String username=usermessage.getUsername();
        Shopmessage shopmessage=shopService.SelectOneShop(sid);
        Carmessage carmessage=new Carmessage(userid, username, sid,shopmessage.getShopname(),shopmessage.getShoper(),shopmessage.getPrice(),sell,shopmessage.getPhoto());
        if (carService.AddCar(carmessage)> 0) {
            return "redirect:ShopCar.html";
        }
        return "error.jsp";
    }

    @RequestMapping("ShopCar.html")
    public String ShopCar(Model model,HttpSession session){
        Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
        Integer userid=usermessage.getUserid();
        String username=usermessage.getUsername();
        //传商品
        List<Carmessage> selectshopcar=carService.SelectShopCar(userid);


        //用户联系信息
        if(contactService.SelectContact(userid)==null) {
            String truename="none";
            String address="none";
            String phone="none";
            Contactmessage contactmessage=new Contactmessage(userid,username,truename,address,phone);
            contactService.AddContact(contactmessage);
        }
        int Pass=0;
        Contactmessage contactmessage = contactService.SelectContact(userid);
        model.addAttribute("pass",Pass);
        model.addAttribute("selectshopcar",selectshopcar);
        model.addAttribute("contactmessage",contactmessage);
        return "WEB-INF/index-success/ShopCar.jsp";
    }

    @RequestMapping("DelectCar.html")
    public String DelectCar(Model model,int carid,HttpSession session){
        if(carService.DeleteCar(carid)>0){
            Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
            Integer userid=usermessage.getUserid();
            List<Carmessage> selectshopcar=carService.SelectShopCar(userid);
            model.addAttribute("selectshopcar",selectshopcar);

            return "redirect:ShopCar.html";
        }
        return "error.jsp";
    }

    @RequestMapping("DelectAllCar.html")
    public String DelectAllCar(Model model,HttpSession session){
            Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
            Integer userid=usermessage.getUserid();
            if(carService.DeleteAllCar(userid)>0) {
                List<Carmessage> selectshopcar = carService.SelectShopCar(userid);
                model.addAttribute("selectshopcar", selectshopcar);
                if(selectshopcar==null){
                    model.addAttribute("selectshopcar", selectshopcar);
                    Contactmessage contactmessage = contactService.SelectContact(userid);
                    int Pass = 3;
                    model.addAttribute("pass", Pass);
                    model.addAttribute("contactmessage", contactmessage);
                    return "WEB-INF/index-success/ShopCar.jsp";
                }
                return "redirect:ShopCar.html";
            }
            return "error.jsp";
    }
    @RequestMapping("UpdateSellCar.html")
    @ResponseBody
    public String UpdateSellCar(String carid,String sell){
        System.out.println(carid);
        if(carService.AjaxUpdateCar(Integer.parseInt(carid),Integer.parseInt(sell))>0){
            return "success";
        }
        return "error";
    }
}
