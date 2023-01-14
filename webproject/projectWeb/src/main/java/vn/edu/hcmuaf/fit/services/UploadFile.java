package vn.edu.hcmuaf.fit.services;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemStream;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UploadFile {
    public  UploadFile(){

    }
    public Map<String,String> upload(List<FileItem> fileItems,HttpServletRequest req, String reqPath,String divide) throws UnsupportedEncodingException {
        Map<String,String> result = new HashMap<String,String>();

        for (FileItem fileItem : fileItems) {
            if (!fileItem.isFormField()) {
                // xử lý file
                String nameimg = fileItem.getName();
                if (!nameimg.equals("")) {
                    String dirUrl = reqPath + File.separator + "filesUpload"+ File.separator +divide;
                    File dir = new File(dirUrl);
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    String fileImg = dirUrl +File.separator +nameimg;
                    File file = new File(fileImg);
                    try {
                        fileItem.write(file);
                        System.out.println("UPLOAD THÀNH CÔNG...!");
                        System.out.println("ĐƯỜNG DẪN KIỂM TRA UPLOAD HÌNH ẢNH : \n"+file.getAbsolutePath());
                        String imgValue = "/"+"filesUpload"+ "/" +divide+"/"+file.getName();
                        result.put("ImageUpload",imgValue);
                    } catch (Exception e) {
                        System.out.println("CÓ LỖ TRONG QUÁ TRÌNH UPLOAD!");
                        e.printStackTrace();
                    }
                }
            }else{


                String name = fileItem.getFieldName();

//                String value = fileItem.getString();
                String value = fileItem.getString(req.getCharacterEncoding());
                System.out.println(name+": "+value);
                result.put(name,value);
            }
        }
        return result;
    }


}
