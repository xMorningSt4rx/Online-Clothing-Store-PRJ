/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DaoProduct;
import java.io.IOException;
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
public class search extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet requeste
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("searchString");
        String searchby = request.getParameter("sortby");
        DaoProduct dp = new DaoProduct();
        ArrayList<Product> arr = new ArrayList<>();
        if (search != null && !"".equals(search)) {
            if (searchby != null && !"".equals(searchby)) {
                int by = Integer.parseInt(searchby);
                arr = dp.search(search, by);
                if (by == 3) {
                    ArrayList<Product> newarr = new ArrayList<>();
                    for (int i = 0;; i++) {
                        int max = 0;
                        int count = Integer.MAX_VALUE;
                        for (int j = 0; j < arr.size(); j++) {
                            int discount = 0;
                            if (arr.get(j).getDiscount() > 0) {
                                discount = arr.get(j).getDiscount();
                            }
                            if (arr.get(j).getPrice() * (100 - discount) / 100 < count) {
                                max = j;
                                count = arr.get(j).getPrice() * (100 - discount) / 100;
                            }
                        }
                        newarr.add(arr.get(max));
                        arr.remove(max);
                        if (arr.size() <= 0) {
                            break;
                        }
                    }
                    arr = newarr;
                } else if (by == 4) {
                    ArrayList<Product> newarr = new ArrayList<>();
                    for (int i = 0;; i++) {
                        int max = 0;
                        int count = 0;
                        for (int j = 0; j < arr.size(); j++) {
                            int discount = 0;
                            if (arr.get(j).getDiscount() > 0) {
                                discount = arr.get(j).getDiscount();
                            }
                            if (arr.get(j).getPrice() * (100 - discount) / 100 > count) {
                                max = j;
                                count = arr.get(j).getPrice() * (100 - discount) / 100;
                            }
                        }
                        System.out.println(arr.get(max).toString());
                        newarr.add(arr.get(max));
                        arr.remove(max);

                        if (arr.size() <= 0) {
                            break;
                        }
                    }
                    arr = newarr;
                }
            } else {
                arr = dp.searchPro(search);
            }

        } else {
            if (searchby != null && searchby != "") {
                int by = Integer.parseInt(searchby);
                arr = dp.search("", Integer.parseInt(searchby));
                if (by == 3) {
                    ArrayList<Product> newarr = new ArrayList<>();
                    for (int i = 0;; i++) {
                        int max = 0;
                        int count = Integer.MAX_VALUE;
                        for (int j = 0; j < arr.size(); j++) {
                            int discount = 0;
                            if (arr.get(j).getDiscount() > 0) {
                                discount = arr.get(j).getDiscount();
                            }
                            if (arr.get(j).getPrice() * (100 - discount) / 100 < count) {
                                max = j;
                                count = arr.get(j).getPrice() * (100 - discount) / 100;
                            }
                        }
                        System.out.println(arr.get(max).toString());
                        newarr.add(arr.get(max));
                        arr.remove(max);

                        if (arr.size() <= 0) {
                            break;
                        }
                    }
                    arr = newarr;
                } else if (by == 4) {
                    ArrayList<Product> newarr = new ArrayList<>();
                    for (int i = 0;; i++) {
                        int max = 0;
                        int count = 0;
                        for (int j = 0; j < arr.size(); j++) {
                            int discount = 0;
                            if (arr.get(j).getDiscount() > 0) {
                                discount = arr.get(j).getDiscount();
                            }
                            if (arr.get(j).getPrice() * (100 - discount) / 100 > count) {
                                max = j;
                                count = arr.get(j).getPrice() * (100 - discount) / 100;
                            }
                        }
                        System.out.println(arr.get(max).toString());
                        newarr.add(arr.get(max));
                        arr.remove(max);

                        if (arr.size() <= 0) {
                            break;
                        }
                    }
                    arr = newarr;
                }
            } else {
                arr = (ArrayList<Product>) dp.getProduct();
            }
        }
        int maxPage = arr.size() / 8;
        if (arr.size() - (maxPage * 8) > 0) {
            maxPage += 1;
        }
        int pageNum = 1;
        if (request.getParameter("page") != null) {
            pageNum = Integer.parseInt(request.getParameter("page"));
        }
        if (arr.isEmpty()) {
            request.setAttribute("error", "Cannot find");
            request.getRequestDispatcher("./shop.jsp").forward(request, response);
        } else {
            ArrayList<Product> arr2 = new ArrayList<>();
            for (int i = 8 * (pageNum - 1); i < pageNum * 8; i++) {
                arr2.add(arr.get(i));
                if (i == arr.size() - 1) {
                    break;
                }
            }
            request.setAttribute("listSearch", arr2);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("search", search);
            request.setAttribute("crrPage", pageNum);
            if (searchby != null) {
                request.setAttribute("sortby", searchby);
            }
            request.getRequestDispatcher("./shop.jsp").forward(request, response);
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
