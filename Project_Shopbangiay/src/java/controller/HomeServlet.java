/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import model.Account;
import model.Cart;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
        try {
            //b1 lay du lieu tu ProductDAO
            String index = request.getParameter("index");
            ProductDAO dao = new ProductDAO();
            CategoryDAO cdao = new CategoryDAO();
            List<Category> listC = cdao.getAllCategory();
            Product best = dao.getBestSellerProduct();
            int numP = dao.getNumOfProduct();
            int maxPage = numP / 9;
            if (maxPage % 9 != 0) {
                maxPage++;
            }
            if (index == null) {
                index = "1";
            }
            int indexPage = Integer.parseInt(index);
            List<Product> list = dao.pagingProduct(indexPage);
            List<Product> listP = dao.getAllProduct();
            request.setAttribute("bestP", best);
            request.setAttribute("listP", list);
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("listC", listC);
            request.setAttribute("maxPage", maxPage);
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            if (account != null) {
                Cookie[] arrCookie = request.getCookies();
                String txt = "";
                if (arrCookie != null) {
                    for (Cookie c : arrCookie) {
                        if (c.getName().equals("cart" + account.getUser())) {
                            txt += c.getValue();
                        }
                    }
                }
                if (!txt.isEmpty()) {
                    Cart cart = new Cart(txt, listP);
                    int size = cart.getItems().size();
                    session.setAttribute("size", size);
                }
            }
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
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
