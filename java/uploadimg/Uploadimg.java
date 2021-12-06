package uploadimg;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

/**
 * @program: Antenna
 * @author:Mr.C
 * @@create: 2021-06-15 15:13
 **/
@Controller
public class Uploadimg {
    //上传图片
    public Object uploadimg(MultipartFile file) throws IOException {
        //图片路径
        String filePath = "D:\\idea\\Antenna\\src\\main\\webapp\\Front-resources\\shopimg";
        /*String newFileName = null;*/
        String originalFilename=null;
        if (!file.isEmpty()) {
            //originalFilename上传时的文件名
            originalFilename = file.getOriginalFilename();
            /*newFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFilename;加密图片名*/
            /*System.out.println("newFileName:" + newFileName);*/
            file.transferTo(new File(filePath, originalFilename));
        } else {
                System.out.print("imgError图片处理错误");
        }
        return originalFilename;
    }
    //删除图片
    public boolean deleteFile(String fileName){
        //图片路径
        File file = new File("D:\\idea\\Antenna\\src\\main\\webapp\\Front-resources\\shopimg\\"+fileName);
        //判断文件存不存在
        if(!file.exists()){
            System.out.println("删除文件失败："+fileName+"不存在！");
            return false;
        }else{
            //判断这是不是一个文件，ps：有可能是文件夹
            if(file.isFile()){
                return file.delete();
            }
        }
        return false;
    }
    //下载图片
    @RequestMapping("download")
    public void downloadFile(String fileName,HttpServletRequest request,HttpServletResponse response)throws IOException{
        byte[] nameBytes=fileName.getBytes(StandardCharsets.UTF_8);
        String downloadName=new String(nameBytes,StandardCharsets.ISO_8859_1);
        response.setHeader("content-disposition","attachment;fileName="+downloadName);
        //图片路径
        InputStream is=new FileInputStream("D:\\idea\\Antenna\\src\\main\\webapp\\Front-resources\\shopimg\\"+fileName);
        ServletOutputStream os=response.getOutputStream();
        int len=-1;
        byte[] bytes=new byte[1024];
        while ((len=is.read(bytes))!=-1){
            os.write(bytes,0,len);
        }
        is.close();
    }
}
