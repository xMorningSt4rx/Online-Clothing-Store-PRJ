/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DaoProduct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Admin
 */
public class CartDetail extends HttpServlet {

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
        Cookie cookie[] = request.getCookies();
        List<Product> list = new ArrayList<>();
        List<String> listSize = new ArrayList<>();
        DaoProduct daoProduct = new DaoProduct();
        for (Cookie cookie1 : cookie) {
            if (cookie1.getName().equals("cook")) {
                String name[] = cookie1.getValue().split("/");
                for (String string : name) {
                    Product p = daoProduct.getProductByID(Integer.parseInt(string));
                    p.setQuantily(1);
                    list.add(p);
                }
            }
            if (cookie1.getName().equals("size")) {
                String name[] = cookie1.getValue().split("/");
                for (int i = 0; i < name.length; i++) {
                    list.get(i).setSize(name[i]);
                }
            }
        }
        for (int i = 0; i < list.size(); i++) {
            int count = 1;
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getProductid() == list.get(j).getProductid() && list.get(i).getSize().trim().equalsIgnoreCase(list.get(j).getSize().trim())) {
                    count++;
                    list.remove(j);
                    j--;
                    list.get(i).setQuantily(count);
                }

            }
        }
        int subtotal = 0;
        double total = 0;
        for (int i = 0; i < list.size(); i++) {
            subtotal += list.get(i).getQuantily() * (list.get(i).getPrice() * (100 - list.get(i).getDiscount()) / 100);

        }
        total = ((subtotal * 8) / 100) + subtotal;

        request.setAttribute("list", list);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("total", total);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
