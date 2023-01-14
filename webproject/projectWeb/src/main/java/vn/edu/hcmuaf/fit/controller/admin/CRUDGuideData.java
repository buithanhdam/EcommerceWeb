package vn.edu.hcmuaf.fit.controller.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.services.UploadFile;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CRUDGuideData", value = "/admin/CRUDGuideData")
public class CRUDGuideData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("form-add-nhan-vien.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Map<String,String> result = new HashMap<String,String>();
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fileItemFactory);

        try {
            List<FileItem> fileItems = upload.parseRequest(request);
             result =  new UploadFile().upload(fileItems,request,request.getServletContext().getRealPath(""),"allImage");

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        String id = result.get("idGuide");
        if (id.equals("")){
            boolean b = UserService.getInstance().createGuide(result);
            if (b) {
                response.sendRedirect("/projectWeb_war/admin/GuideTableData");
            }else {
                String text = "Tạo mới không thành công";
                request.setAttribute("error",text);
                request.getRequestDispatcher("form-add-nhan-vien.jsp").forward(request,response);
            }
        }else{
            boolean b = UserService.getInstance().updateGuide(result);
            if (b) {
                response.sendRedirect("/projectWeb_war/admin/GuideTableData");
            }else {
                String text = "Sửa không thành công";
                request.setAttribute("error",text);
                request.getRequestDispatcher("form-add-nhan-vien.jsp").forward(request,response);
            }
        }
    }
}