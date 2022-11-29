/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

import model.OderList;
import model.Product;

/**
 *
 * @author Admin
 */
public class DaoProduct extends DBContext {

    public ArrayList searchPro(String search) {
        ArrayList<Product> arr = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM [dbo].[Product]\n"
                + "WHERE [ProductName] LIKE '%" + search + "%'\n"
                + "Order by ProductID ASC ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setDetail(rs.getString("Detail"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantily(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscount(rs.getInt("Discount"));
                p.setSize(rs.getString("size").trim());
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public ArrayList search(String search, int sortBy) {
        ArrayList<Product> arr = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM [Product]\n"
                + "WHERE [ProductName] LIKE '%" + search + "%'\n";

        switch (sortBy) {
            case 1:
                sql += "ORDER BY [ProductName] ASC";
                break;
            case 2:
                sql += "ORDER BY [ProductName] DESC";
                break;
            case 3:
                sql += "ORDER BY [Price] ASC";
                break;
            case 4:
                sql += "ORDER BY [Price] DESC";
                break;

        }
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setDetail(rs.getString("Detail"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantily(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscount(rs.getInt("Discount"));
                p.setSize(rs.getString("size").trim());
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public ArrayList searchByCattegory(String categoryID) {
        ArrayList<Product> arr = new ArrayList<>();
        String sql = "select * from Product where CategoryID =" + categoryID;

        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setDetail(rs.getString("Detail"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantily(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscount(rs.getInt("Discount"));
                p.setSize(rs.getString("size").trim());
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public List getDiscountProduct() {
        List<Product> arr = new ArrayList<>();
        String sql = "select TOP (6) * from Product\n"
                + "WHERE Product.Discount > 0;";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setDetail(rs.getString("Detail"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantily(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscount(rs.getInt("Discount"));
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public List getDiscountBest() {
        List<Product> arr = new ArrayList<>();
        String sql = "  select * from [Product] where [Discount] =50";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setDetail(rs.getString("Detail"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantily(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscount(rs.getInt("Discount"));
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public List getProduct() {
        List<Product> arr = new ArrayList<>();
        String sql = "select * from Product Order by ProductID ASC";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setDetail(rs.getString("Detail"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantily(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscount(rs.getInt("Discount"));
                p.setSize(rs.getString("size").trim());
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public List getTop() {
        List<Product> arr = new ArrayList<>();
        String sql = "Select TOP (8)  pd.ProductID,pd.ProductName,pd.Price,pd.Image,pd.size,pd.Discount FROM Product pd, OrderDetails od\n"
                + "            Where pd.ProductID = od.ProductID\n"
                + "               Group by pd.ProductID,pd.ProductName,pd.ProductName,pd.Price,pd.Image,pd.size,pd.Discount ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setDiscount(rs.getInt("Discount"));
                p.setSize(rs.getString("size").trim());

                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public int getTotalProduct() {

        String sql = "Select COUNT ([ProductID]) AS totalProduct FROM [Product]";
        int count = 0;
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("totalProduct");
            }
        } catch (Exception e) {

        }
        return count;
    }

    public int getTotalProductBySell() {

        String sql = "Select SUM(Quantity) AS K FROM [OrderDetails]";
        int count = 0;
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("K");
            }
        } catch (Exception e) {

        }
        return count;
    }

    public List getAllListOder() {

        List<OderList> arr = new ArrayList<>();
        String sql = "  select b.DetailID ,a.OrderID,a.UserID,a.OrderDate,c.ProductName,d.CategoryName,b.Quantity,b.status, SUM(b.Quantity*(c.Price*(100 -c.Discount)/100)) as total\n"
                + "                             from [Order] as a  INNER JOIN [OrderDetails] as b on  a.[OrderID] = b.[OrderID] inner join Product as c\n"
                + "                          on b.ProductID=c.ProductID  inner join Category as d on c.CategoryID = d.CategoryID\n"
                + "                       group by a.OrderID,a.UserID,a.OrderDate,c.ProductName,d.CategoryName,b.Quantity, b.status,c.Price, b.DetailID";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OderList list = new OderList();
                list.setOderID(rs.getInt("OrderID"));
                list.setUserID(rs.getString("UserID"));
                list.setOrderDate(rs.getString("OrderDate"));
                list.setProductName(rs.getString("ProductName"));
                list.setCategoryName(rs.getString("CategoryName"));
                list.setQuantity(rs.getInt("quantity"));
                list.setTotal(rs.getInt("total"));
                list.setStatus(rs.getString("status"));
                list.setId(rs.getInt("DetailID"));
                arr.add(list);
            }
        } catch (Exception e) {

        }
        return arr;

    }

    public Product getProductByID(int ProductID) {

        try {
            String sql = "select * from Product where ProductID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ProductID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("ProductID"));
                p.setProductname(rs.getString("ProductName"));
                p.setDetail(rs.getString("Detail"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setQuantily(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscount(rs.getInt("Discount"));
                p.setSize(rs.getString("size").trim());
                return p;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;

    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE ProductID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void Update(Product product) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [ProductName] = ?\n"
                    + "      ,[Detail] = ?\n"
                    + "      ,[Image] = ?\n"
                    + "      ,[Price] =?\n"
                    + "      ,[Quantity] = ?\n"
                    + "      ,[CategoryID] =?\n"
                    + "      ,[Discount] = ?\n"
                    + "      ,[size] = ?\n"
                    + " WHERE ProductID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getProductname());
            st.setString(2, product.getDetail());
            st.setString(3, product.getImage());
            st.setInt(4, product.getPrice());
            st.setInt(5, product.getQuantily());
            st.setInt(6, product.getCategoryID());
            st.setInt(7, product.getDiscount());
            st.setString(8, product.getSize().trim());
            st.setInt(9, product.getProductid());
            st.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void UpdateS(String id, String status) {
        try {
            String sql = "UPDATE [dbo].[OrderDetails]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + " WHERE DetailID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, id);
            st.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void UpdateQuantity(int id, int quantity) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET \n"
                    + "      [Quantity] = ?\n"
                    + " WHERE ProductID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, id);
            st.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void insert(Product product) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([ProductName]\n"
                    + "           ,[Detail]\n"
                    + "           ,[Image]\n"
                    + "           ,[Price]\n"
                    + "           ,[Quantity]\n"
                    + "           ,[CategoryID]\n"
                    + "           ,[Discount]\n"
                    + "           ,[size])\n"
                    + "     VALUES  (?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getProductname());
            st.setString(2, product.getDetail());
            st.setString(3, product.getImage());
            st.setInt(4, product.getPrice());
            st.setInt(5, product.getQuantily());
            st.setInt(6, product.getCategoryID());
            st.setInt(7, product.getDiscount());
            st.setString(8, product.getSize().trim());
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void insertOder(OderList oderList) {
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([UserID]\n"
                    + "           ,[OrderDate]\n"
                    + "           ,[total]\n"
                    + "           ,[Payment]\n"
                    + "           ,[note])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oderList.getUserID());
            st.setString(2, oderList.getOrderDate());
            st.setInt(3, oderList.getTotal());
            st.setString(4, oderList.getPayment());
            st.setString(5, oderList.getNote());
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public int getOderID() {
        try {
            String sql = "select * from [Order] Order by [OrderID] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("OrderID");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public void insertOderDetail(OderList oderList) {
        try {
            String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                    + "           ([ProductID]\n"
                    + "           ,[OrderID]\n"
                    + "           ,[Quantity]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oderList.getProductID());
            st.setInt(2, oderList.getOderID());
            st.setInt(3, oderList.getQuantity());
            st.setString(4, oderList.getStatus());
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DaoProduct dbp = new DaoProduct();
//        List<OderList> l = dbp.getAllListOder();
        OderList list = new OderList("1", "2022/03/12", 1, "Paypay", "@gmail");
        dbp.insertOder(list);

    }
}
