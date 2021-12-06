package controller;

import entities.Carmessage;
import entities.Contactmessage;
import entities.Usermessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.CarService;
import service.ContactService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @program: Antenna
 * @todoing:用户详细信息
 * @author:Mr.C
 * @@create: 2021-10-19 09:49
 **/

@Controller
@ContextConfiguration("classpath:applicationContext.xml")
public class ContactAction {
    @Autowired
    private ContactService contactService;


    @RequestMapping("UpDateContact.html")
    public String UpdateContact(Model model, String truename, String phone, String address, HttpSession session){
        Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
        Integer userid=usermessage.getUserid();
        String username=usermessage.getUsername();
            //改信息
            Contactmessage contactmessage=new Contactmessage(userid,username,truename,address,phone);
            if(contactService.UpdateContact(contactmessage)>0) {
                contactmessage = contactService.SelectContact(userid);
                model.addAttribute("contactmessage",contactmessage);
            }
        return "ShopCar.html";

    }

}
