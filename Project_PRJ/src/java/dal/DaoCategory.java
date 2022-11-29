/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class DaoCategory extends DBContext {

    public List getCategory() {
        List<Category> arr = new ArrayList<>();
        String sql = "select * from Category";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                arr.add(new Category(rs.getInt("CategoryId"), rs.getString("CategoryName")));
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public int getTotalCategory() {

        String sql = "Select COUNT (CategoryID) AS total FROM [Category]";
        int count = 0;
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (Exception e) {

        }
        return count;
    }

    public Category getCategoryByID(int CategoryID) {

        try {
            String sql = "select * from Category where CategoryID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CategoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                return c;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;

    }

    public void updateCategory(Category category) {
        try {
            String sql = "UPDATE [dbo].[Category]\n"
                    + "   SET [CategoryName] = ?\n"
                    + " WHERE CategoryID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category.getName());
            st.setInt(2, category.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCategory(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Category]\n"
                    + "      WHERE CategoryID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    // insert
    public void insert(Category category) {
        try {
            String sql = "INSERT INTO [dbo].[Category]\n"
                    + "           ([CategoryName])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category.getName());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList RelatedCattegory(int categoryID,int productId) {
        ArrayList<Product> arr = new ArrayList<>();
        String sql = "SELECT TOP (3) [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Detail]\n"
                + "      ,[Image]\n"
                + "      ,[Price]\n"
                + "      ,[Quantity]\n"
                + "      ,[CategoryID]\n"
                + "      ,[Discount]\n"
                + "      ,[size]\n"
                + "  FROM [WATCH_SHOP].[dbo].[Product] where CategoryID =" + categoryID + " and ProductID != "+ productId ;

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
                p.setSize(rs.getString("size"));
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public static void main(String[] args) {
        DaoCategory dbc = new DaoCategory();
        Category category = new Category(5, "jean");
        dbc.updateCategory(category);
    }
}
