/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DaoProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Admin
 */
public class Categorys extends HttpServlet {

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
        String id = request.getParameter("id");
        DaoProduct dp = new DaoProduct();
        ArrayList<Product> arr = new ArrayList<>();
        if (id != null && id != "") {
            arr = dp.searchByCattegory(id);
            int maxPage = arr.size() / 8;
            if (arr.size() - (maxPage * 8) > 0) {
                maxPage += 1;
            }
            int pageNum = 1;
            if (request.getParameter("page") != null) {
                pageNum = Integer.parseInt(request.getParameter("page"));
            }
            if (arr.isEmpty()) {
                request.setAttribute("error", "can not product with category");
                request.getRequestDispatcher("./shop.jsp").forward(request, response);
            } else {
                ArrayList<Product> arr2 = new ArrayList<>();
                for (int i = 8 * (pageNum - 1); i < pageNum * 8; i++) {
                    arr2.add(arr.get(i));
                    if (i == arr.size() - 1) {
                        break;
                    }
                }
                request.setAttribute("listsp", arr2);
                request.setAttribute("maxPage", maxPage);
                request.setAttribute("category", id);
                request.setAttribute("crrPage", pageNum);
                request.getRequestDispatcher("./Category.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("./search");
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
