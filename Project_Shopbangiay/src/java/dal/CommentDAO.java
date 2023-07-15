/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Comment;
import model.Product;

/**
 *
 * @author admin
 */
public class CommentDAO extends DBContext {

    public void addComment(int pid, int aid, String comment) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        String sql = "INSERT INTO [dbo].[Comment] (ProductID, aid, comment, date)\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.setInt(2, aid);
            stm.setString(3, comment);
            stm.setString(4, date);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Comment> getComment(int pid) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT id, ProductID, aid, comment, [date]\n"
                + "FROM [dbo].[Comment] where ProductID = ?";
        ProductDAO dao = new ProductDAO();
        AccountDAO adao = new AccountDAO();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product a = dao.getAllProductByID(pid);
                Account acc = adao.getAccount(rs.getInt(3));
                Comment c = new Comment(rs.getInt(1), a, acc, rs.getString(4), rs.getDate(5));
                list.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Comment> getCommentNotReply(int pid) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT [id], [ProductID], [aid], [comment], [date]\n"
                + "FROM [dbo].[Comment]\n"
                + "WHERE id NOT IN (\n"
                + "    SELECT commentid\n"
                + "    FROM [dbo].[Reply]\n"
                + ") and ProductID = ?";
        ProductDAO dao = new ProductDAO();
        AccountDAO adao = new AccountDAO();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product a = dao.getAllProductByID(pid);
                Account acc = adao.getAccount(rs.getInt(3));
                Comment c = new Comment(rs.getInt(1), a, acc, rs.getString(4), rs.getDate(5));
                list.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
