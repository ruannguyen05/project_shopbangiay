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
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    public void insertOrder(Account a, Item i) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        String sql = "INSERT INTO [dbo].[Order] ([AccountID], [ProductID], [quantity], [totalMoney],[date] )\n"
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            
            stm.setInt(1, a.getId());
            stm.setInt(2, i.getProduct().getId());
            stm.setInt(3, i.getQuantity());
            stm.setDouble(4, i.getPrice() * i.getQuantity());
            stm.setString(5, date);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertOrderWithBuy(Account a, Product p, int quantity) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        String sql = "INSERT INTO [dbo].[Order] ([AccountID], [ProductID], [quantity], [totalMoney],[date] )\n"
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, a.getId());
            stm.setInt(2, p.getId());
            stm.setInt(3, quantity);
            stm.setDouble(4, p.getPrice() * quantity);
            stm.setString(5, date);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Order> getOrderByAccID(int aid) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where AccountID = ?";
        
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductDAO pdao = new ProductDAO();
                Product p = pdao.getAllProductByID(rs.getInt(3));
                Order o = new Order(rs.getInt(2), p , rs.getInt(4), rs.getDouble(5),rs.getDate(6));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch(ClassNotFoundException e){
            
        }
        return list;
    }

    public List<Product> getProductOfAccID(int aid) {
        List<Product> list = new ArrayList<>();

        String sql = "select p.* from [Order] o \n"
                + "  inner join [product] p on o.ProductID = p.id\n"
                + "  where AccountID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
}
