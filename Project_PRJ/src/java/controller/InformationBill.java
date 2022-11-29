/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DaoProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.OderList;
import model.Product;

/**
 *
 * @author Admin
 */
public class InformationBill extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String note)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InformationBill</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InformationBill at " + note + "</h1>");
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
        Cookie cookie[] = request.getCookies();
        List<Product> list = new ArrayList<>();
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
                if (list.get(i).getProductid() == list.get(j).getProductid() && list.get(i).getSize().equalsIgnoreCase(list.get(j).getSize())) {
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
        double tax = ((subtotal * 8) / 100);
        total = ((subtotal * 8) / 100) + subtotal;

        request.setAttribute("list", list);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("total", total);
        request.setAttribute("tax", tax);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        String[] note = request.getParameterValues("note");
        String method = request.getParameter("payment-method");
        HttpSession session = request.getSession();
        if (method == null || ((note[0] == null || "".equals(note[0])) && (note[1] == null || "".equals(note[1]))) && !method.equals("cash")) {
            request.setAttribute("err", "error please check ");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else if (session.getAttribute("account") == null) {
            request.setAttribute("error", "Please login or create new acc");
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
        } else {
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
                    if (list.get(i).getProductid() == list.get(j).getProductid() && list.get(i).getSize().equalsIgnoreCase(list.get(j).getSize())) {
                        count++;
                        list.remove(j);
                        j--;
                        list.get(i).setQuantily(count);

                    }

                }
            }
            Account ac = (Account) session.getAttribute("account");
            LocalDateTime myDateObj = LocalDateTime.now();
            DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            int total = 0;
            int subtotal = 0;
            for (int i = 0; i < list.size(); i++) {
                subtotal += list.get(i).getQuantily() * (list.get(i).getPrice() * (100 - list.get(i).getDiscount()) / 100);

            }
            total = ((subtotal * 8) / 100) + subtotal;

            DaoProduct dp = new DaoProduct();

            OderList o = new OderList();
            o.setId(0);
            o.setUserID(ac.getId() + "");
            o.setOrderDate(format.format(myDateObj));
            o.setTotal(total);
            o.setPayment(method);
            o.setNote("cash");
            dp.insertOder(o);
            int oid = dp.getOderID();
            for (int i = 0; i < list.size(); i++) {

                OderList list1 = new OderList(oid, list.get(i).getProductid() + "", list.get(i).getQuantily(), "wating");
                dp.insertOderDetail(list1);
                Product p = dp.getProductByID(list.get(i).getProductid());
                dp.UpdateQuantity(list.get(i).getProductid(), p.getQuantily() - list.get(i).getQuantily());

            }
            for (Cookie cookie1 : cookie) {
                if (cookie1.getName().equals("cook")) {
                    cookie1.setMaxAge(0);
                    response.addCookie(cookie1);
                }
                if (cookie1.getName().equals("size")) {
                    cookie1.setMaxAge(0);
                    response.addCookie(cookie1);
                }
            }
            response.sendRedirect("index.jsp");
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
