/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OverallController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class MainController extends HttpServlet {

    private static final String WELCOME="login.jsp";
    
    private static final String LOGIN="Login";
    private static final String LOGIN_CONTROLLER="LoginController";
    
    private static final String SEARCH="Search";
    private static final String SEARCH_CONTROLLER="SearchController";
    
    private static final String DELETE="Delete";
    private static final String DELETE_CONTROLLER="DeleteController";
    
    private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER="LogoutController";
    
    private static final String UPDATE="Update";
    private static final String UPDATE_CONTROLLER="UpdateController";
    
    private static final String CREATE_PAGE="Create_Page";
    private static final String CREATE_PAGE_VIEW="create.html";
    
    private static final String CREATE="Create";
    private static final String CREATE_CONTROLLER="CreateController";
    
    private static final String SHOPPING_PAGE="Shopping_Page";
    private static final String SHOP_CONTROLLER="ShopController";
    
    private static final String ADD="Add";
    private static final String ADD_CONTROLLER="AddController";
    
    private static final String VIEW="View";
    private static final String VIEW_CART="viewCart.jsp";
    
    private static final String REMOVE="Remove";
    private static final String REMOVE_CONTROLLER="RemoveController";
    
    private static final String EDIT="Edit";
    private static final String EDIT_CONTROLLER="EditController";
    
    private static final String CHECK_OUT="Checkout";
    private static final String CHECK_OUT_CONTROLLER="CheckoutController";
    
     private static final String SEND_MAIL="SendMail";
    private static final String SEND_MAIL_CONTROLLER="SendMailController";
    
    private static final String PAYMENT="Payment";
    private static final String PAYMENT_CONTROLLER="PaymentController";
    
    private static final String ADDPRODUCT = "AddProduct";
    private static final String ADDPRODUCT_CONTROLLER = "AddProductController";
    
    private static final String ADDPRODUCT_PAGE = "AddProduct_Page";
    private static final String ADDPRODUCT_PAGE_VIEW = "addProduct.jsp";
    
    private static final String SEARCH_PRODUCT = "Find";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    
    private static final String EDIT_PRODUCT_PAGE="Edit_Product_Page";
    private static final String EDIT_PRODUCT_VIEW="editProduct.jsp"; 
    
  
    
    private static final String EDIT_PRODUCT = "EditProduct";
    private static final String EDIT_PRODUCT_CONTROLLER = "EditProductController";
    
    private static final String SEARCH_EDIT_PRODUCT = "searchProduct";
    private static final String SEARCH_EDIT_PRODUCT_CONTROLLER = "SearchProductForEditController";
    
    private static final String ADMIN_PAGE="Admin_Page";
    private static final String ADMIN_VIEW="admin.jsp"; 
    
    private static final String TOP = "Top";
    private static final String TOP_CONTROLLER="SelectTopController";
    
        private static final String LAST_USER_PAGE = "LastUser_Page";
    private static final String LAST_USER_VIEW = "LastUserController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = WELCOME;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals((action))) {
                url = DELETE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE_PAGE.equals(action)) {
                url = CREATE_PAGE_VIEW;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (SHOPPING_PAGE.equals(action)) {
                url = SHOP_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW.equals(action)) {
                url = VIEW_CART;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (CHECK_OUT.equals(action)) {
                url = CHECK_OUT_CONTROLLER;
            }else if (SEND_MAIL.equals(action)) {
                url = SEND_MAIL_CONTROLLER;
            } else if (PAYMENT.equals(action)) {
                url = PAYMENT_CONTROLLER;
            } else if (ADDPRODUCT.equals(action)){
                url = ADDPRODUCT_CONTROLLER;
            } else if (ADDPRODUCT_PAGE.equals(action)){
                url = ADDPRODUCT_PAGE_VIEW;
            } else if (SEARCH_PRODUCT.equals(action)){
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (EDIT_PRODUCT.equals(action)){
                url = EDIT_PRODUCT_CONTROLLER;
            } else if (EDIT_PRODUCT_PAGE.equals(action)){
                url = EDIT_PRODUCT_VIEW;
            } else if (SEARCH_EDIT_PRODUCT.equals(action)){
                url = SEARCH_EDIT_PRODUCT_CONTROLLER;
            } else if (ADMIN_PAGE.equals(action)){
                url = ADMIN_VIEW;}
            else if (TOP.equals(action)){
                url = TOP_CONTROLLER;}
            else if (LAST_USER_PAGE.equals(action)){
                url = LAST_USER_VIEW;}
        } catch(Exception e) {
            log("Error at MainControlller: " + e.toString());
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
