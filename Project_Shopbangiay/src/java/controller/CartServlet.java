/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            ProductDAO pdao = new ProductDAO();
            List<Product> plist = pdao.getAllProduct();
            Cookie[] arrCookie = request.getCookies();
            String txt = "";

            if (arrCookie != null) {
                for (Cookie c : arrCookie) {
                    if (c.getName().equals("cart" + account.getUser())) {
                        txt += c.getValue();
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }

            String num = request.getParameter("num");
            String id = request.getParameter("id");

            if (!num.equals("0")) {
                Cart cart = new Cart(txt, plist);
                int pnum = Integer.parseInt(num);
                int pid = Integer.parseInt(id);
                Product p = pdao.getAllProductByID(pid);
                int maxQuantity = p.getQuantity();
                if ((pnum == -1 && (cart.getQuantityByID(pid) <= 1))) {
                    cart.removeItem(pid);
                } else {
                    if (pnum == 1 && cart.getQuantityByID(pid) >= maxQuantity) {
                        pnum = 0;
                        request.setAttribute("mes", "Số lượng tối da là " + maxQuantity);
                    }
                    Item m = new Item(p, p.getPrice(), pnum);
                    cart.addItem(m);
                }

                List<Item> items = cart.getItems();
                txt = "";
                if (items.size() > 0) {
                    txt = items.get(0).getProduct().getId() + "and" + items.get(0).getQuantity();
                    for (int i = 1; i < items.size(); i++) {
                        txt += "or" + items.get(i).getProduct().getId() + "and" + items.get(i).getQuantity();
                    }
                }
                Cookie c = new Cookie("cart" + account.getUser(), txt);
                c.setMaxAge(60 * 60 * 24 * 7);
                response.addCookie(c);
                request.setAttribute("cart", cart);
                int size = cart.getItems().size();
                session.setAttribute("size", size);
            }
            if (num.equals("0")) {
                String[] item = txt.split("or");
                String out = "";
                for (int i = 0; i < item.length; i++) {
                    String[] s = item[i].split("and");
                    if (!s[0].equals(id)) {
                        if (out.isEmpty()) {
                            out = item[i];
                        } else {
                            out += "or" + item[i];
                        }
                    }
                }
                if (!out.isEmpty()) {
                    Cookie c = new Cookie("cart" + account.getUser(), out);
                    c.setMaxAge(60 * 60 * 24 * 7);
                    response.addCookie(c);
                }
                Cart cart = new Cart(out, plist);
                request.setAttribute("cart", cart);
                int size = cart.getItems().size();
                session.setAttribute("size", size);
            }

            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
