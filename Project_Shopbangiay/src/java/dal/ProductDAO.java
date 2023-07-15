/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Item;
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    // lay tất cả san phẩm từ bảng product
    public List<Product> getAllProduct()
            throws SQLException, ClassNotFoundException {

        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //lấy các sản phẩm từ product theo category
    public List<Product> getAllProductByCID(int cid)
            throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where cateID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductBySellID(int sid)
            throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where sell_ID = ?";
        try {

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //lấy sản phẩm từ prodcut theo productID
    public Product getAllProductByID(int id)
            throws SQLException, ClassNotFoundException {
        String sql = "select * from product where id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getLastProduct()
            throws SQLException, ClassNotFoundException {

        String sql = "select top 1 * from product  order by [id] desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getBestSellerProduct()
            throws SQLException, ClassNotFoundException {

        String sql = "Select top 1 p.*  from [Order] o \n"
                + "inner join [Product] p on o.ProductID = p.id\n"
                + "order by o.quantity desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> searchByName(String searchValue)
            throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where name like ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteProductbyID(int id) {
        try {

            String sql = "Delete from product where id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addProduct(String name, String image, double price, String title, String description, int cid, int sid, int quantity) {
        try {

            String sql = "INSERT INTO [dbo].[product] ([name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity])"
                    + "VALUES (?,?,?,?,?,?,?,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, image);
            stm.setDouble(3, price);
            stm.setString(4, title);
            stm.setString(5, description);
            stm.setInt(6, cid);
            stm.setInt(7, sid);
            stm.setInt(8, quantity);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editProduct(String name, String image, double price, String title, String description, int cid, int quantity, int pid) {
        try {

            String sql = "UPDATE [dbo].[product]\n"
                    + "SET [name] = ?,\n"
                    + "    [image] = ?,\n"
                    + "    [price] = ?,\n"
                    + "    [title] = ?,\n"
                    + "    [description] = ?,\n"
                    + "    [cateID] = ?,\n"
                    + "    [quantity] = ? \n"
                    + "WHERE [id] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, image);
            stm.setDouble(3, price);
            stm.setString(4, title);
            stm.setString(5, description);
            stm.setInt(6, cid);
            stm.setInt(7, quantity);
            stm.setInt(8, pid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantity(Item i) {
        String sql = "UPDATE [dbo].[product]\n"
                + "SET [quantity] = quantity-?\n"
                + "WHERE [id] = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, i.getQuantity());
            stm.setInt(2, i.getProduct().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateQuantity(int pid , int quantity) {
        String sql = "UPDATE [dbo].[product]\n"
                + "SET [quantity] = quantity-?\n"
                + "WHERE [id] = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, pid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNumOfProduct() {
        String sql = "select count(*) from [Product]";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> pagingProduct(int page)
            throws SQLException, ClassNotFoundException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product\n"
                + "ORDER BY [id]\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT 9 ROWS ONLY;";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (page - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int getSellID(int pid){
        String sql ="select sell_id from Product where id =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        try {
            List<Product> list = dao.pagingProduct(3);
            for (Product product : list) {
                System.out.println(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
