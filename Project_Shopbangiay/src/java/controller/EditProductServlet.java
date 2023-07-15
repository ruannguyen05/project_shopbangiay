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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.SQLException;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
@MultipartConfig
@WebServlet(name = "EditProductServlet", urlPatterns = {"/edit"})
public class EditProductServlet extends HttpServlet {

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
            request.setAttribute("listC", listC);
            request.setAttribute("detail", p);
            request.getRequestDispatcher("Edit.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        int pid = Integer.parseInt(id);
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        double pprice = Double.parseDouble(price);
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        int cid = Integer.parseInt(category);
        String quantity = request.getParameter("quantity");
        int pquantity = Integer.parseInt(quantity);
        ProductDAO dao = new ProductDAO();
        Part part = request.getPart("image");
//        if (part.getName()==null) {
//            String img = request.getParameter("oldimage");
//            String realPath = request.getServletContext().getRealPath("/image");
//            String filename = part.getSubmittedFileName();
//            part.write(realPath + "/" + filename);
//            dao.editProduct(name, "image/" + img, pprice, title, description, cid, pquantity, pid);
//            response.sendRedirect("managerProduct");
//        }       
//        if (part.getName()!=null) {
            String realPath = request.getServletContext().getRealPath("/image");
            String filename = part.getSubmittedFileName();
            part.write(realPath + "/" + filename);
            dao.editProduct(name, "image/" + filename, pprice, title, description, cid, pquantity, pid);
//        } 
        response.sendRedirect("managerProduct");
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
