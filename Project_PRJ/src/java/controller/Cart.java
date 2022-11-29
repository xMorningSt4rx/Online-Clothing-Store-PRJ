/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class Cart extends HttpServlet {

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
        String size = request.getParameter("size");
        String quantity = request.getParameter("quantity");
        Cookie cookie[] = request.getCookies();
        String name = "";
        String size1 = "";
    
        for (Cookie cookie1 : cookie) {
            if (cookie1.getName().equals("cook")) {
                name += cookie1.getValue();
                cookie1.setMaxAge(0);
                response.addCookie(cookie1);
            }
            if (cookie1.getName().equals("size")) {
                size1 += cookie1.getValue();
                cookie1.setMaxAge(0);
                response.addCookie(cookie1);
            }
        }
    
        if (quantity != null && Integer.parseInt(quantity) > 0) {
            for (int i = 0; i < Integer.parseInt(quantity); i++) {
                if (name.isEmpty()) {
                    name = id;
                } else {
                    name = name + "/" + id;
                }
                if (size1.isEmpty()) {
                    size1 = size;
                } else {
                    size1 = size1 + "/" + size;
                }
            }
        } else {
            if (name.isEmpty()) {
                name = id;
            } else {
                name = name + "/" + id;
            }
            if (size1.isEmpty()) {
                size1 = size;
            } else {
                size1 = size1 + "/" + size;
            }
        }

        Cookie cook = new Cookie("cook", name);
        cook.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(cook);
        Cookie cook1 = new Cookie("size", size1);
        cook1.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(cook1);
        response.sendRedirect("CartDetail");
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
