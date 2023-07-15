/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.CommentDAO;
import dal.ProductDAO;
import dal.ReplyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Comment;
import model.Product;
import model.Reply;

/**
 *
 * @author admin
 */
@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

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
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
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
        String pid = request.getParameter("pid");
        int pID;
        try {
            pID = Integer.parseInt(pid);
            ProductDAO dao = new ProductDAO();
            Product p = dao.getAllProductByID(pID);
            CategoryDAO cdao = new CategoryDAO();
            List<Category> listC = cdao.getAllCategory();
            CommentDAO cmdao = new CommentDAO();
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            if (acc != null) {
                int aid = acc.getId();
                request.setAttribute("aid", aid);
            }
            int sellID = dao.getSellID(pID);
            request.setAttribute("sellID", sellID);
            List<Comment> commentlist = cmdao.getComment(pID);
            request.setAttribute("listComment", commentlist);
            String commentid = request.getParameter("commentid");
            ReplyDAO repdao = new ReplyDAO();
            if (commentid != null) {
                int commentID = Integer.parseInt(commentid);
                List<Reply> listReply = repdao.getReply(commentID);
                request.setAttribute("listReply", listReply);
            }
            request.setAttribute("quantity", 1);
            Product best = dao.getBestSellerProduct();
            request.setAttribute("bestP", best);
            request.setAttribute("listC", listC);
            request.setAttribute("detail", p);
            request.getRequestDispatcher("Detail.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
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
        String pid = request.getParameter("pid");
        int pID;
        try {
            pID = Integer.parseInt(pid);
            ProductDAO dao = new ProductDAO();
            Product p = dao.getAllProductByID(pID);
            CategoryDAO cdao = new CategoryDAO();
            List<Category> listC = cdao.getAllCategory();
            String add = request.getParameter("add");

            String quantity_s = request.getParameter("quantity");
            int quantity = Integer.parseInt(quantity_s);

            if (add.equals("+")) {
                quantity++;
            } else if (add.equals("-")) {
                quantity--;
            } else {
                quantity = 1;
            }
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            if (acc != null) {
                int aid = acc.getId();
                request.setAttribute("aid", aid);
            }
            int sellID = dao.getSellID(pID);
            request.setAttribute("sellID", sellID);
            CommentDAO cmdao = new CommentDAO();
            List<Comment> commentlist = cmdao.getComment(pID);
            request.setAttribute("listComment", commentlist);
            request.setAttribute("quantity", quantity);
            Product best = dao.getBestSellerProduct();
            request.setAttribute("bestP", best);
            request.setAttribute("listC", listC);
            request.setAttribute("detail", p);
            request.getRequestDispatcher("Detail.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
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
