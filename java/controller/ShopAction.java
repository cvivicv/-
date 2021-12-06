package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entities.Shopmessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.ShopService;
import uploadimg.Uploadimg;


import java.io.File;
import java.io.IOException;
import java.util.List;


/**
 * @program: Antenna
 * @todoing:后台管理-商品管理
 * @author:Mr.C
 * @@create: 2021-06-12 09:42
 **/
@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class ShopAction {
    //连接mapper接口
    @Autowired
    private ShopService shopService;

    /*--商品管理--*/
    //商品查询
    @RequestMapping("ShopDoing.html")
    public String SelectShop(Model model,@RequestParam(value="page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,5);
        List<Shopmessage> selectshop=shopService.SelectShop();
        PageInfo pageInfo=new PageInfo(selectshop,5);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("page", page);
        return "WEB-INF/admin-web/allshop.jsp";
    }

    //添加商品信息
    @RequestMapping("ShopAdd.html")
    public String addShop(@RequestParam("file") MultipartFile file, String shopname, String title, String type1, String type2,
                          String shoper, float price, String text, int stock, int hot,@RequestParam(value="page",defaultValue = "1") Integer page) throws IOException {
        //图片上传
        String photo;
        Uploadimg uploadimg=new Uploadimg();
        photo= (String) uploadimg.uploadimg(file);

        Shopmessage shopmessage=new Shopmessage(shopname,title,type1,type2,shoper,price,text,stock,hot,photo);
        if (shopService.AddShop(shopmessage) > 0) {
            return "ShopDoing.html?page="+page;
        }
        return "error.jsp";
    }

    //查询单条商品信息以及删除
    @RequestMapping("MoreShopDoing.html")
    public String MoreShopDoing(@RequestParam(value = "event", required = false, defaultValue = "默认值") String event, Model model, int sid,@RequestParam(value="page",defaultValue = "1") Integer page){
        Shopmessage oneshop=shopService.SelectOneShop(sid);
        if(event.equals("oneshop")) {
            model.addAttribute("oneshop", oneshop);
            model.addAttribute("page", page);
            return "WEB-INF/admin-web/Updateshop.jsp";
        }else if(event.equals("deleteshop")){
           if(shopService.DeleteShop(sid)>0){
               //删除文件顺带删除图片
               Uploadimg uploadimg=new Uploadimg();
               uploadimg.deleteFile(oneshop.getPhoto());
               return "ShopDoing.html?page="+page;
           }
           return "error.jsp";
        }
        return "error.jsp";
    }

    //修改商品信息
    @RequestMapping("UpdateShopDoing.html")
    public String UpdateShoprDoing(@RequestParam("file") MultipartFile file,int sid,String shopname,String title,String type1,String type2,
                                  String shoper,float price,String text,int stock,int hot,@RequestParam(value="page",defaultValue = "1") Integer page)throws IOException{
        Uploadimg uploadimg = new Uploadimg();
        //如果输入图片文件不为空，更新商品信息顺便删除图片
        if(file!=null) {
            Shopmessage oneshop = shopService.SelectOneShop(sid);
            uploadimg.deleteFile(oneshop.getPhoto());
        }
        //图片再次上传
        String photo;
        photo= (String) uploadimg.uploadimg(file);
        Shopmessage shopmessage=new Shopmessage(sid,shopname,title,type1,type2,shoper,price,text,stock,hot,photo);
        if(shopService.UpdateShop(shopmessage)>0){
            return "ShopDoing.html?page="+page;
        }
        return "error.jsp";
    }

}
