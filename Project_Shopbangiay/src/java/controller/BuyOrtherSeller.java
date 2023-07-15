/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Product;
import sun.java2d.pipe.hw.AccelDeviceEventListener;

/**
 *
 * @author admin
 */
@WebServlet(name = "BuyOrtherSeller", urlPatterns = {"/buyotherseller"})
public class BuyOrtherSeller extends HttpServlet {

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
            out.println("<title>Servlet BuyOrtherSeller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyOrtherSeller at " + request.getContextPath() + "</h1>");
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
        String sellid = request.getParameter("sellid");
        int sid = Integer.parseInt(sellid);
        ProductDAO dao = new ProductDAO();
        AccountDAO adao = new AccountDAO();
        try {
            List<Product> list = dao.getAllProductBySellID(sid);
            Account a = adao.getAccount(sid);
            request.setAttribute("sellid", sid);
            request.setAttribute("listP", list);
            request.setAttribute("acc", a);
        } catch (SQLException ex) {
            Logger.getLogger(BuyOrtherSeller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuyOrtherSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("BuyOtherSeller.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        int sid = Integer.parseInt(id);
        String pid = request.getParameter("pid");
        int pID = Integer.parseInt(pid);
        String num = request.getParameter("num");
        int quantity = Integer.parseInt(num);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        ProductDAO dao = new ProductDAO();
        AccountDAO adao = new AccountDAO();
        CategoryDAO cdao = new CategoryDAO();
        try {
            int sellID = account.getId();
            Product p = dao.getAllProductByID(pID);
            int cid = cdao.getCategoryID(pID);
            dao.addProduct(p.getName(), p.getImage(), p.getPrice(), p.getTitle(), p.getDescription(), cid, sellID, quantity);
            dao.updateQuantity(pID, quantity);
            List<Product> list = dao.getAllProductBySellID(sid);
            Account a = adao.getAccount(sid);
            request.setAttribute("sellid", sid);
            request.setAttribute("listP", list);
            request.setAttribute("acc", a);
        } catch (SQLException ex) {
            Logger.getLogger(BuyOrtherSeller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuyOrtherSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("BuyOtherSeller.jsp").forward(request, response);

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
