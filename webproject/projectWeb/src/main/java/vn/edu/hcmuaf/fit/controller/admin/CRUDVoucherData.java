package vn.edu.hcmuaf.fit.controller.admin;

import com.google.protobuf.Internal;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.services.UploadFile;
import vn.edu.hcmuaf.fit.services.UserService;
import vn.edu.hcmuaf.fit.services.VoucherService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CRUDVoucherData", value = "/admin/CRUDVoucherData")
public class CRUDVoucherData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("form-add-voucher.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voucherId = request.getParameter("voucherId");
        String voucherStart = request.getParameter("voucherStart");
        String voucherEnd = request.getParameter("voucherEnd");
        String voucherValue = request.getParameter("voucherValue");
        String voucherTrangThai = request.getParameter("voucherTrangThai");

        if (voucherId.equals("")){
            boolean b = VoucherService.getInstance().createVoucher(voucherStart,voucherEnd,voucherValue,voucherTrangThai);
            if (b) {
                response.sendRedirect("/projectWeb_war/admin/VoucherTableData");
            }else {
                String text = "Tạo mới không thành công";
                request.setAttribute("error",text);
                request.getRequestDispatcher("form-add-voucher.jsp").forward(request,response);
            }
        }else{
            boolean b = VoucherService.getInstance().updateVoucher(voucherId,voucherStart,voucherEnd,voucherValue);
            if (b) {
                response.sendRedirect("/projectWeb_war/admin/VoucherTableData");
            }else {
                String text = "Sửa không thành công";
                request.setAttribute("error",text);
                request.getRequestDispatcher("form-add-voucher.jsp").forward(request,response);
            }
        }
    }
}
