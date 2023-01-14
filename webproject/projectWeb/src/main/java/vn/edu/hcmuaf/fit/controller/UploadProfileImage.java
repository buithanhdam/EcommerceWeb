package vn.edu.hcmuaf.fit.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UploadFile;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "UploadProfileImage", value = "/user/views/UploadProfileImage")
public class UploadProfileImage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Map<String,String> result = new HashMap<String,String>();
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
//        upload.setHeaderEncoding("UTF-8");
        try {
            List<FileItem> fileItems = upload.parseRequest(request);
            result =  new UploadFile().upload(fileItems,request,request.getServletContext().getRealPath(""),"allImage");

        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        if (UserService.getInstance().uploadProfileImage(result) == true){
            HttpSession session = request.getSession(true);
            User user = (User) session.getAttribute("auth");
            user.setImageURL(result.get("ImageUpload"));
            session.removeAttribute("auth");
            session.setAttribute("auth",user);
            response.sendRedirect("/projectWeb_war/user/views/profile.jsp");
        }else{

        }
    }
}
