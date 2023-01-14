package vn.edu.hcmuaf.fit.controller.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.DestinationService;
import vn.edu.hcmuaf.fit.services.UploadFile;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CRUDBlogData", value = "/admin/CRUDBlogData")
public class CRUDBlogData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Destination> listDes = DestinationService.getInstance().getDestination();
        request.setAttribute("listDes",listDes);
        request.getRequestDispatcher("form-add-blog.jsp").forward(request,response);
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
        String id = result.get("blogID");
        if (id.equals("")){
            boolean b = BlogService.getInstance().createBlog(result);

            if (b) {
                response.sendRedirect("/projectWeb_war/admin/BlogTableData");
            }else {
                String text = "Tạo mới không thành công";
                request.setAttribute("error",text);
                List<Destination> listDes = DestinationService.getInstance().getDestination();
                request.setAttribute("listDes",listDes);
                request.getRequestDispatcher("form-add-blog.jsp").forward(request,response);
            }
        }else{
            boolean b = BlogService.getInstance().updateBlog(result);
            if (b) {
                response.sendRedirect("/projectWeb_war/admin/BlogTableData");
            }else {
                String text = "Sửa không thành công";
                request.setAttribute("error",text);
                List<Destination> listDes = DestinationService.getInstance().getDestination();
                request.setAttribute("listDes",listDes);
                request.getRequestDispatcher("form-add-blog.jsp").forward(request,response);
            }
        }
    }
}
