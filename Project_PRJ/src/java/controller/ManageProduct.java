/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DaoProduct;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50)

public class ManageProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

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
        int id = Integer.parseInt(request.getParameter("id"));
        if (request.getParameter("type") != null) {
            DaoProduct daoProduct = new DaoProduct();
            daoProduct.deleteProduct(id);
            response.sendRedirect("Admin/ManageProduct.jsp");
        } else {
            DaoProduct daoProduct = new DaoProduct();
            model.Product product = daoProduct.getProductByID(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
        }
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
        try (PrintWriter out = response.getWriter()) {

            String type = request.getParameter("type");
            int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
            if (type.equalsIgnoreCase("edit")) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String img = request.getParameter("img");
                int Price = Integer.parseInt(request.getParameter("Price"));
                int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                int category = Integer.parseInt(request.getParameter("category"));
                int Discount = Integer.parseInt(request.getParameter("Discount"));
                String size = request.getParameter("size");
                Product product = new Product(id, name, description, img, Price, Quantity, category, Discount, size);
                DaoProduct daoProduct = new DaoProduct();
                System.out.println(product.toString());
                daoProduct.Update(product);
                response.sendRedirect("Product?id=" + id);

            } else if (type.equalsIgnoreCase("add")) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String img = request.getParameter("img");
                int Price = Integer.parseInt(request.getParameter("Price"));
                int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                int category = Integer.parseInt(request.getParameter("category"));
                int Discount = Integer.parseInt(request.getParameter("Discount"));
                String size = request.getParameter("size");
                Product product = new Product(0, name, description, img, Price, Quantity, category, Discount, size);
                DaoProduct daoProduct = new DaoProduct();
                System.out.println(product.toString());
                daoProduct.insert(product);
                response.sendRedirect("Admin/ManageProduct.jsp");

            }
        }

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
