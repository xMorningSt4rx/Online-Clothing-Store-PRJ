/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DaoAccount;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Admin
 */
public class Userdetail extends HttpServlet {

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
            out.println("<title>Servlet Userdetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Userdetail at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        DaoAccount daoAccount = new DaoAccount();
        Account account = daoAccount.getAccountId(id);
        request.setAttribute("account", account);
        request.getRequestDispatcher("userdetail.jsp").forward(request, response);
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
        if (request.getSession().getAttribute("account") == null) {
            response.sendRedirect("index.jsp");
        }
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("ChangeInfor")) {
            int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
            String UserName = request.getParameter("UserName");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String yourName = request.getParameter("yourName");
            Account account = new Account(id, UserName, address, phoneNumber, yourName);
            DaoAccount daoAccount = new DaoAccount();
            daoAccount.updateInformation(account);
            request.setAttribute("mess", "change successfully");
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            request.getRequestDispatcher("userdetail.jsp").forward(request, response);
        } else if (type.equalsIgnoreCase("ChangePass")) {
            int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
            String CurrentPassword = request.getParameter("currPass");
            String NewPassword = request.getParameter("newPass");
            String ReenterNewPassword = request.getParameter("rePass");
            DaoAccount da = new DaoAccount();

            if (BCrypt.checkpw(CurrentPassword, da.getPass(id))) {
                if (NewPassword.equals(ReenterNewPassword)) {
                    DaoAccount daoAccount = new DaoAccount();
                    Account account = daoAccount.getAccountId(id);
                    account.setPass(NewPassword);
                    daoAccount.updatePass(account);
                    HttpSession session = request.getSession();
                    session.setAttribute("account", account);
                    response.sendRedirect("index.jsp");
                } else {
                    request.setAttribute("error", "Re-Enter New Password not equals New Password");
                    request.getRequestDispatcher("userdetail.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Current password is incorrect");
                request.getRequestDispatcher("userdetail.jsp").forward(request, response);
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
