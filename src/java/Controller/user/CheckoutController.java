/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.user;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Account;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import Model.Cart;
import Model.Order;
import Model.OrderDetail;
import Model.Product;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "checkout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Account loginUser = (Account) session.getAttribute("LOGIN_USER");
            // Check session
            Cart cart = (Cart) session.getAttribute("CART");
            
            // Check cart
            if (cart != null) {
            for (Product product : cart.getCart().values()) {
                ProductDAO dao = new ProductDAO();
                double total = 0;
                Integer status= cart.getStatus(product);
                if(status==1){
                
                String orderID = UUID.randomUUID().toString();
                List<OrderDetail> listOrderDetail = new ArrayList<>();
                    // Check quantity of each product in cart
                    boolean checkQuantity = dao.checkQuantity(product.getProductID(), product.getQuantity());
                    if (checkQuantity) {
                        listOrderDetail.add(new OrderDetail(orderID, product.getProductID(), product.getPrice() * product.getQuantity(), product.getQuantity()));
                        total += (product.getQuantity() * product.getPrice());
                    } else {
                            request.setAttribute("ERROR_MESSAGE", product.getName() + " QUANTITY IS NOT ENOUGH!");
                    }
                    
                
                // Checkout start here
                LocalDate localDate = LocalDate.now();
                Date currentDate = Date.valueOf(localDate);
                Order order = null;
                if (total > 0) {
                    order = new Order(orderID, loginUser.getUserID(), total, currentDate);
                }
                OrderDAO orderDao = new OrderDAO();
                // Save order into database
                boolean checkAddOrder = orderDao.insert(order);
                if (checkAddOrder) {
                    OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                    for (OrderDetail orderDetail : listOrderDetail) {
                        // Save orderDetail into database
                        boolean checkAddOrderDetail = orderDetailDao.insert(orderDetail);
                        if (checkAddOrderDetail) {
                            // Update quantity of each product in database
                            dao.updateQuantity(orderDetail.getProductID(), orderDetail.getQuantity());
                        }
                    }
                    //  Delete cart
                    session.removeAttribute("CART");
                    request.setAttribute("ORDER", order);
                    request.setAttribute("LIST_ORDER_DETAIL", listOrderDetail);
                    url = SUCCESS;
                }
                    }else {
                     request.setAttribute("ERROR_MESSAGE","SOME PRODUCT NOT AVAILABLE!");
                }
            }
            }else {
                request.setAttribute("ERROR_CART_MESSAGE", "YOUR CART IS EMPTY. PLEASE RETURN TO THE SHOPPING PAGE TO PRUCHARE BEFORE PAYMENT.");
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
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