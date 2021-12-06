package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entities.Shopmessage;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.IndexService;
import service.ShopService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


/**
 * @program: Antenna
 * @todoing:对前端首页进行操作
 * @author:Mr.C
 * @@create: 2021-06-10 19:16
 **/
@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class IndexAction {
    //连接mapper接口
    @Autowired
    private IndexService indexService;
    private ShopService shopService;

    public IndexAction(ShopService shopService) {
        this.shopService = shopService;
    }

    /*查询游客主页*/
    @RequestMapping("index.html")
    public String SelectUser(Model model){
        /*最热门商品*/
        List<Shopmessage> selecthotshop=indexService.SelectHotShop();
        List<Shopmessage> selectnewshop=indexService.SelectNewShop();
        List<Shopmessage> selectrandshop=indexService.SelectRandShop();
        model.addAttribute("selecthotshop", selecthotshop);
        model.addAttribute("selectnewshop", selectnewshop);
        model.addAttribute("selectrandshop", selectrandshop);
        return "index.jsp";
    }
    /*登录后主页*/
    @RequestMapping("indexsuccess.html")
    public String SelectUsersuccess(Model model){
        /*最热门商品*/
        List<Shopmessage> selecthotshop=indexService.SelectHotShop();
        List<Shopmessage> selectnewshop=indexService.SelectNewShop();
        List<Shopmessage> selectrandshop=indexService.SelectRandShop();
        model.addAttribute("selecthotshop", selecthotshop);
        model.addAttribute("selectnewshop", selectnewshop);
        model.addAttribute("selectrandshop", selectrandshop);
        return "WEB-INF/index-success/indexsuccess.jsp";
    }
    /*用户登出清除session*/
    @RequestMapping("user-exit.html")
    public String ExitUser(HttpSession session,Model model){
        SelectUser(model);
        session.removeAttribute("usermessage");
        return "index.jsp";
    }
    //跳转至商品-详细购物页面
    @RequestMapping("oneshop.html")
    public String MoreShopDoing(Model model, int sid){
            Shopmessage oneshop=shopService.SelectOneShop(sid);
            List<Shopmessage> oneshopDown=shopService.SelectOneShopDown(oneshop);
            model.addAttribute("oneshop", oneshop);
            model.addAttribute("oneshopDown",oneshopDown);
            return "WEB-INF/index-success/oneshop.jsp";
    }
    //搜索框以及主页主题市场---热门查询降序
    @RequestMapping("Search.html")
    public String Search(Model model,@RequestParam(value = "event") String event,@RequestParam(value="page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,20);
        List<Shopmessage> searchshop=indexService.SelectSearch(event);
        PageInfo pageInfo=new PageInfo(searchshop,20);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("event",event);
        int btnActive=1;
        model.addAttribute("btnActive",btnActive);
        return "WEB-INF/index-success/shopitem.jsp";
    }
    //搜索框以及主页主题市场---最新查询降序
    @RequestMapping("NewSearch.html")
    public String NewSearch(Model model,@RequestParam(value = "event") String event,@RequestParam(value="page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,20);
        List<Shopmessage> searchshop=indexService.SelectNewSearch(event);
        PageInfo pageInfo=new PageInfo(searchshop,20);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("event",event);
        int btnActive=2;
        model.addAttribute("btnActive",btnActive);
        return "WEB-INF/index-success/shopitem.jsp";
    }
    //搜索框以及主页主题市场---金额查询升序
    @RequestMapping("MoneyUpSearch.html")
    public String MoneyUpSearch(Model model,@RequestParam(value = "event") String event,@RequestParam(value="page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,20);
        List<Shopmessage> searchshop=indexService.MoneyUpSearch(event);
        PageInfo pageInfo=new PageInfo(searchshop,20);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("event",event);
        int btnActive=3;
        model.addAttribute("btnActive",btnActive);
        return "WEB-INF/index-success/shopitem.jsp";
    }
    //搜索框以及主页主题市场---金额查询降序
    @RequestMapping("MoneyDownSearch.html")
    public String MoneyDownSearch(Model model,@RequestParam(value = "event") String event,@RequestParam(value="page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,20);
        List<Shopmessage> searchshop=indexService.MoneyDownSearch(event);
        PageInfo pageInfo=new PageInfo(searchshop,20);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("event",event);
        int btnActive=4;
        model.addAttribute("btnActive",btnActive);
        return "WEB-INF/index-success/shopitem.jsp";
    }

}
