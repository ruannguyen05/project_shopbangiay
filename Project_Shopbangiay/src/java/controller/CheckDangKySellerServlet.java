/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author admin
 */
@WebServlet(name = "CheckDangKySellerServlet", urlPatterns = {"/checkdangkyseller"})
public class CheckDangKySellerServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckDangKySellerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckDangKySellerServlet at " + request.getContextPath() + "</h1>");
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
        Cookie[] arrCookie = request.getCookies();
        String txt = "";
        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals("dangkyseller")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        AccountDAO adao = new AccountDAO();
        String[] acc = txt.split("and");
        List<Account> listAcc = new ArrayList<>();
        String id = request.getParameter("id");
        if (id != null) {
            int aid = Integer.parseInt(id);
            String act_s = request.getParameter("act");
            int act = Integer.parseInt(act_s);
            if (act == 1) {
                adao.updateSeller(aid, 1);
            }
            String out = "";
            for (int i = 0; i < acc.length; i++) {
                if (!acc[i].equals(id)) {
                    if (out.isEmpty()) {
                        out = acc[i];
                    } else {
                        out += "and" + acc[i];
                    }
                }
            }
            if (!out.isEmpty()) {
                Cookie c = new Cookie("dangkyseller", out);
                c.setMaxAge(60 * 60 * 24 * 7);
                response.addCookie(c);
                String[] aa = txt.split("and");
                for (String acc1 : aa) {
                    int accID = Integer.parseInt(acc1);
                    Account a = adao.getAccount(accID);
                    listAcc.add(a);
                }
            }

        } else {
            Cookie c = new Cookie("dangkyseller", txt);
            c.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(c);
            for (String acc1 : acc) {
                int accID = Integer.parseInt(acc1);
                Account a = adao.getAccount(accID);
                listAcc.add(a);
            }
        }
        request.setAttribute("listA", listAcc);
        request.getRequestDispatcher("CheckDangKySeller.jsp").forward(request, response);
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
