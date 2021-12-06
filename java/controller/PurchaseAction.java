package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: Antenna
 * @todoing:购物车支付至订单查询处理
 * @author:Mr.C
 * @@create: 2021-10-09 14:49
 **/

@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class PurchaseAction {
    //连接mapper接口
    @Autowired
    private PurchaseService purchaseService;
    private CarService carService;
    private ContactService contactService;
    private UserService userService;
    private ShopService shopService;


    public PurchaseAction(CarService carService, ContactService contactService, UserService userService, ShopService shopService) {
        this.carService = carService;
        this.contactService = contactService;
        this.userService = userService;
        this.shopService = shopService;
    }

    /**添加订单**/
    @RequestMapping("AddPurchase.html")
    public String AddPurchase(Model model, HttpSession session, @RequestParam(required=false,defaultValue = "1") int[] carid){
        Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
        Integer userid=usermessage.getUserid();

        //设置添加事务操作
        int purchasePass = 0;
        //设定是否送达开关receiving为0
        int receiving = 0;
        //获取当前时间，设定订单创建日期
        Date day = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String creation_time = df.format(day);
        //获取用户信息判断
        double usermoney=userService.SelectUserMoney(userid);

        double shopmoney=0;
        //sellpass为判断库存开关
        int sellpass=0;
        //获得购物车中的总价用于判断用户是否有余额
        for(int j=0;j<carid.length;j++){
            List<Carmessage> selectshopcar = carService.ChooseShopCar(carid[j]);
            for(int i = 0; i < selectshopcar.size(); i++){
                float price = selectshopcar.get(i).getPrice();
                int sell = selectshopcar.get(i).getSell();
                //查找订单中商品库存是否大于购买量
                int sid=selectshopcar.get(i).getSid();
                int shopsell=shopService.SelectStock(sid);
                if(shopsell>sell){
                    sellpass=1;
                }
                //循环增加金额
                shopmoney+=price*sell;
        }


        }
        //判断选中商品不为空
        if(carid[0]!=1) {
            //判断商品有货
            if (sellpass > 0) {
                //判断用户有钱
                if (usermoney >= shopmoney) {
                    //用户详细信息输入
                    Contactmessage contactmessage = contactService.SelectContact(userid);
                    String truename = contactmessage.getTruename();
                    String address = contactmessage.getAddress();
                    String phone = contactmessage.getPhone();
                    //循环添加购物车到订单
                    for(int j=0;j<carid.length;j++) {
                        List<Carmessage> selectshopcar = carService.ChooseShopCar(carid[j]);
                        for (int i = 0; i < selectshopcar.size(); i++) {
                            userid = selectshopcar.get(i).getUserid();
                            String username = selectshopcar.get(i).getUsername();
                            int sid = selectshopcar.get(i).getSell();
                            String shopname = selectshopcar.get(i).getShopname();
                            String shoper=selectshopcar.get(i).getShoper();
                            float price = selectshopcar.get(i).getPrice();
                            int sell = selectshopcar.get(i).getSell();
                            String photo = selectshopcar.get(i).getPhoto();
                            Purchasemessage purchasemessage = new Purchasemessage(sid, shopname,shoper, userid, username,
                                    price, sell, photo, receiving, creation_time, truename, address, phone);
                            purchasePass = purchaseService.AddPurchase(purchasemessage);
                            //订单生成扣除货物数量并且热度增加购买数
                            int shopsell = shopService.SelectStock(sid);
                            int shophot = shopService.SelectHot(sid);
                            shopsell = shopsell - sell;
                            shophot = shophot + sell;
                            Shopmessage shopmessage = new Shopmessage();
                            shopmessage.setSid(sid);
                            shopmessage.setStock(shopsell);
                            shopmessage.setHot(shophot);
                            shopService.UpdateShop(shopmessage);
                        }
                        //清理购物车
                        carService.ChooseDeleteCar(carid[j],userid);
                    }
                    if (purchasePass > 0) {
                        //订单生成后用户扣除金额
                        usermoney = usermoney - shopmoney;
                        Usermessage usermessage1 = new Usermessage();
                        usermessage1.setUserid(userid);
                        usermessage1.setMoney(usermoney);
                        userService.UpdateUserMoney(usermessage1);
                        return "redirect:SelectPurchase.html";
                    }
                } else {
                    List<Carmessage> selectshopcar = carService.SelectShopCar(userid);
                    //用户余额不足处理
                    model.addAttribute("selectshopcar", selectshopcar);
                    Contactmessage contactmessage = contactService.SelectContact(userid);
                    int Pass = 1;
                    model.addAttribute("pass", Pass);
                    model.addAttribute("contactmessage", contactmessage);
                    return "WEB-INF/index-success/ShopCar.jsp";
                }
            } else {
                //商品库存不足处理
                List<Carmessage> selectshopcar = carService.SelectShopCar(userid);
                model.addAttribute("selectshopcar", selectshopcar);
                Contactmessage contactmessage = contactService.SelectContact(userid);
                int Pass = 2;
                model.addAttribute("pass", Pass);
                model.addAttribute("contactmessage", contactmessage);
                return "WEB-INF/index-success/ShopCar.jsp";
            }
        }else{
            //购物车啥都没有处理
            List<Carmessage> selectshopcar = carService.SelectShopCar(userid);
            model.addAttribute("selectshopcar", selectshopcar);
            Contactmessage contactmessage = contactService.SelectContact(userid);
            int Pass = 3;
            model.addAttribute("pass", Pass);
            model.addAttribute("contactmessage", contactmessage);
            return "WEB-INF/index-success/ShopCar.jsp";
        }
        return "error.jsp";
    }

    //订单页面查询
    @RequestMapping("SelectPurchase.html")
    public String SelectPurchase(HttpSession session,Model model, @RequestParam(value="page1",defaultValue = "1") Integer page1,@RequestParam(value="page2",defaultValue = "1") Integer page2,@RequestParam(value="page3",defaultValue = "1") Integer page3){
        Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
        Integer userid=usermessage.getUserid();
        //订单之未配送查询
        PageHelper.startPage(page1,5);
        List<Map<String,Object>> selectnotdelivered = purchaseService.SelectNotDelivered(userid);
        PageInfo pageInfo1=new PageInfo(selectnotdelivered,5);
        model.addAttribute("pageInfo1",pageInfo1);
        //订单之已配送，已送达查询
        PageHelper.startPage(page2,5);
        List<Map<String,Object>> selectdelivering = purchaseService.SelectDelivering(userid);
        PageInfo pageInfo2=new PageInfo(selectdelivering,5);
        model.addAttribute("pageInfo2",pageInfo2);
        PageHelper.startPage(page3,5);
        //订单之已收货，已退款查询
        List<Map<String,Object>> selectdelivered = purchaseService.SelectDelivered(userid);
        PageInfo pageInfo3=new PageInfo(selectdelivered,5);
        model.addAttribute("pageInfo3",pageInfo3);
        return "WEB-INF/index-success/UserPurchase.jsp";
    }
}
