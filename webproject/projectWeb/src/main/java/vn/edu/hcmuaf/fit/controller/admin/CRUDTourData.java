package vn.edu.hcmuaf.fit.controller.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.bean.TourPackage;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.bean.Voucher;
import vn.edu.hcmuaf.fit.services.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CRUDTourData", value = "/admin/CRUDTourData")
public class CRUDTourData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> guides = UserService.getInstance().getListGuide();
        List<Voucher> vouchers = VoucherService.getInstance().getVoucherList();
        List<Destination> dess = DestinationService.getInstance().getDestination();
        List<User> guideBusys = UserService.getInstance().getListGuideOnBusy();

        request.setAttribute("guides",guides);
        request.setAttribute("vouchers",vouchers);
        request.setAttribute("dess",dess);
        request.setAttribute("guideBusys",guideBusys);
request.setAttribute("tour",null);
        request.getRequestDispatcher("form-add-san-pham.jsp").forward(request, response);
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
        String id = result.get("tourDetailId");
        if (id.equals("")){
            boolean b = TourDetailService.getInstance().adminCreateTour(result);
            if (b){
                response.sendRedirect("/projectWeb_war/admin/TourTableData");
            }else{
                String text = "Tạo mới không thành công";
                request.setAttribute("error",text);
                List<User> guides = UserService.getInstance().getListGuide();
                List<Voucher> vouchers = VoucherService.getInstance().getVoucherList();
                List<Destination> dess = DestinationService.getInstance().getDestination();
                List<User> guideBusys = UserService.getInstance().getListGuideOnBusy();

                request.setAttribute("guides",guides);
                request.setAttribute("vouchers",vouchers);
                request.setAttribute("dess",dess);
                request.setAttribute("guideBusys",guideBusys);


                request.getRequestDispatcher("form-add-san-pham.jsp").forward(request, response);

            }
        }else{
            boolean b = TourDetailService.getInstance().adminUpdateTour(result);
            if (b){
                response.sendRedirect("/projectWeb_war/admin/TourTableData");
            }else{
                String text = "Cập nhật không thành công";
                request.setAttribute("error",text);
                TourPackage tour = TourDetailService.getInstance().getTourPackageDetail(id);
                request.setAttribute("tour",tour);
                List<User> guides = UserService.getInstance().getListGuide();
                List<Voucher> vouchers = VoucherService.getInstance().getVoucherList();
                List<Destination> dess = DestinationService.getInstance().getDestination();
                List<User> guideBusys = UserService.getInstance().getListGuideOnBusy();

                request.setAttribute("guides",guides);
                request.setAttribute("vouchers",vouchers);
                request.setAttribute("dess",dess);
                request.setAttribute("guideBusys",guideBusys);


                request.getRequestDispatcher("form-add-san-pham.jsp").forward(request, response);

            }
        }

    }
}
