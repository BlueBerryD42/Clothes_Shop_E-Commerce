/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "EditProductController", urlPatterns = {"/EditProductController"})
public class EditProductController extends HttpServlet {
    private static final String ERROR = "editProduct.jsp";
    private static final String SUCCESS = "editProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    String url = ERROR;
    try {
        String productID = request.getParameter("productID");
        String updateName = request.getParameter("name");
        String updatePrice = request.getParameter("price");
        String updateQuantity = request.getParameter("quantity");
        String updateImage = request.getParameter("picture");
        String updateBrand = request.getParameter("brand");

        double upPrice = 0;
        int upQuantity = 0;
        boolean valid = true;

        // Validate and parse price
        try {
            upPrice = Double.parseDouble(updatePrice);
        } catch (NumberFormatException e) {
            request.setAttribute("ERROR_MESSAGE", "Invalid price format");
            valid = false;
        }

        // Validate and parse quantity
        try {
            upQuantity = Integer.parseInt(updateQuantity);
        } catch (NumberFormatException e) {
            request.setAttribute("ERROR_MESSAGE", "Invalid quantity format");
            valid = false;
        }


        if (valid) {
            Product pro = new Product(productID, updateName, upPrice, upQuantity, updateImage, updateBrand,1);
            ProductDAO dao = new ProductDAO();
            boolean checkUpdate = dao.update(pro);
            if (checkUpdate) {
                url = SUCCESS;
            }
        }
    } catch (Exception e) {
        log("Error at EditProductController: " + e.toString());
        e.printStackTrace();
    } finally {
        request.getRequestDispatcher(url).forward(request, response);
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
