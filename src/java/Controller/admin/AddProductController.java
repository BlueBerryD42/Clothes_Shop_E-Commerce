/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.UserError;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {


    private static final String ERROR = "addProduct.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean checkValidation = true;
        ProductDAO dao = new ProductDAO();
        UserError userError = new UserError();

        try {
            String productID = request.getParameter("productID");
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            String images = request.getParameter("picture");


            String brandStr = request.getParameter("brand");


            // Validate productID
            if (productID == null || productID.length() < 2 || productID.length() > 10) {
                userError.setUserIDError("UserID must be in range 2-10 characters");
                checkValidation = false;
            }

            // Validate name
            if (name == null || name.length() < 5 || name.length() > 20) {
                userError.setFullNameError("Name must be in range 5-20 characters");
                checkValidation = false;
            }

            // Validate price
            double price = 0;
            try {
                price = Double.parseDouble(priceStr);
                if (price < 0) {
                    userError.setPriceError("Price must be a positive number");
                    checkValidation = false;
                }
            } catch (NumberFormatException e) {
                userError.setPriceError("Price must be a valid number");
                checkValidation = false;
            }

            // Validate quantity
            int quantity = 0;
            try {
                quantity = Integer.parseInt(quantityStr);
                if (quantity < 0) {
                    userError.setQuantityError("Quantity must be a positive number");
                    checkValidation = false;
                }
            } catch (NumberFormatException e) {
                userError.setQuantityError("Quantity must be a valid number");
                checkValidation = false;
            }

            // Additional validation for brandStr
            if (brandStr == null || brandStr.trim().isEmpty()) {
                userError.setBrandError("Brand must not be empty");
                checkValidation = false;
            }

            // If all validations pass
            if (checkValidation) {
                Integer status =1;
                Product product = new Product(productID, name, price, quantity, images, brandStr,status);
                boolean checkInsert = dao.checkInsert(product);
                if (checkInsert) {
                    url = SUCCESS;
                    
                } else {
                    userError.setError("Unknown error occurred during product insertion");
                    request.setAttribute("USER_ERROR", userError);
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }

        } catch (ClassNotFoundException | SQLException | NamingException e) {
            log("Error at AddProductController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("Product ID already exists");
                request.setAttribute("USER_ERROR", userError);
            }
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
