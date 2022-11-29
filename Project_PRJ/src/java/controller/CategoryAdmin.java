/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DaoCategory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryAdmin extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CategoryAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryAdmin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DaoCategory daoCategory = new DaoCategory();
        int id = Integer.parseInt(request.getParameter("id"));

        if (request.getParameter("type") != null) {

            daoCategory.deleteCategory(id);
            response.sendRedirect("Admin/ManageProduct.jsp");
        } else {
            model.Category category = daoCategory.getCategoryByID(id);
            request.setAttribute("category", category);
            request.getRequestDispatcher("Admin/UpdateCategory.jsp").forward(request, response);
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
                Category category = new Category(id, name);
                DaoCategory daoCategory = new DaoCategory();
                System.out.println(category.toString());
                daoCategory.updateCategory(category);
                response.sendRedirect("Admin/ManageProduct.jsp");
            } else if (type.equalsIgnoreCase("add")) {
                String name = request.getParameter("name");
                Category category = new Category(0, name);
                DaoCategory daoCategory = new DaoCategory();
                daoCategory.insert(category);
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
