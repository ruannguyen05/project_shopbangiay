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
import model.Reply;

/**
 *
 * @author admin
 */
public class ReplyDAO extends DBContext {

    public void addReply(int id, String reply) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        String sql = "INSERT INTO [dbo].[Reply] ([commentid], reply, [date])\n"
                + "VALUES (?, ?, ?)";
        
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, reply);
            stm.setString(3, date);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Reply> getReply(int idcomment){
        List<Reply> list = new ArrayList<>();
        String sql ="select [commentid] ,[reply] ,[date] from Reply where [commentid] = ?";
        
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, idcomment);
            ResultSet rs = stm.executeQuery();
                while(rs.next()){
                    Reply rep = new Reply(rs.getInt(1), rs.getString(2), rs.getDate(3));
                    list.add(rep);
                }
        } catch (SQLException ex) {
            Logger.getLogger(ReplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        ReplyDAO dao = new ReplyDAO();
        List<Reply> list = dao.getReply(10);
        for (Reply reply : list) {
            System.out.println(reply);
        }
    }
}
