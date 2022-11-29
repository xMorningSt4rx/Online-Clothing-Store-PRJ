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
import model.Account;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Admin
 */
public class DaoAccount extends DBContext {

    public List account() {
        List<Account> arr = new ArrayList<>();
        String sql = "  select * from [user]";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account();
                p.setId(rs.getInt("UserID"));
                p.setName(rs.getString("UserName"));
                p.setPass(rs.getString("Password"));
                p.setAddress(rs.getString("Address"));
                p.setContact(rs.getString("ContactTitle"));
                p.setRoll(rs.getInt("Roll"));
                p.setYourname(rs.getString("YourName"));
                arr.add(p);
            }
        } catch (Exception e) {

        }
        return arr;
    }

    public Account getAccount(String username, String password) {
        String sql = "SELECT [UserID]\n"
                + "      ,[UserName]\n"
                + "      ,[Password]\n"
                + "      ,[Address]\n"
                + "      ,[ContactTitle]\n"
                + "      ,[Roll]\n"
                + "       ,[YourName]\n   "
                + "  FROM [dbo].[user]"
                + "  WHERE [UserName]='" + username + "'";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("UserID");
                String user = rs.getString("UserName");
                String pass = rs.getString("Password");
                String addString = rs.getString("Address");
                String contact = rs.getString("ContactTitle");
                int role = rs.getInt("Roll");
                String youName = rs.getString("YourName");
                if (check(password, pass)) {
                    return new Account(id, user, pass, addString, contact, role, youName);
                } else {
                    return null;
                }
            } else {
                return null;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;

    }

    public Account getAccountId(int UserID) {

        try {
            String sql = "select * from [user] where [UserID] =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("UserID"));
                a.setName(rs.getString("UserName"));
                a.setPass(rs.getString("Password"));
                a.setAddress(rs.getString("Address"));
                a.setContact(rs.getString("ContactTitle"));
                a.setRoll(rs.getInt("Roll"));
                a.setYourname(rs.getString("YourName"));
                return a;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;

    }

    public void updateRole(Account account) {
        try {
            String sql = "UPDATE [dbo].[user]\n"
                    + "   SET\n"
                    + "      [Roll] =  ?\n"
                    + "    \n"
                    + " WHERE [UserID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account.getRoll());
            st.setInt(2, account.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateInformation(Account account) {
        try {
            String sql = "UPDATE [dbo].[user]\n"
                    + "   SET [UserName] = ?\n"
                    + "      ,[Address] = ?\n"
                    + "      ,[ContactTitle] = ?\n"
                    + "      ,[YourName] =?\n"
                    + " WHERE [UserID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getName());
            st.setString(2, account.getAddress());
            st.setString(3, account.getContact());
            st.setString(4, account.getYourname());
            st.setInt(5, account.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePass(Account account) {
        try {
            String sql = "UPDATE [dbo].[user]\n"
                    + "   SET \n"
                    + "      [Password] = ?\n"
                    + "      \n"
                    + " WHERE [UserID] =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hashPass(account.getPass()));
            st.setInt(2, account.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean check(String usreName, String pass) {
        return BCrypt.checkpw(usreName, pass);
    }

    public int getTotalUser() {

        String sql = "Select COUNT ([Roll]) AS total FROM [user] where Roll=2";
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

    public String getPass(int UserID) {

        try {
            String sql = "select [Password] from [user] where UserID=? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            String pass = "";
            if (rs.next()) {
                pass = rs.getString("Password");
                return pass;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;

    }

    public String hashPass(String pass) {
        String hash = BCrypt.hashpw(pass, BCrypt.gensalt(10));
        return hash;
    }

    public void insert(Account account) {
        try {
            String sql = "INSERT INTO [dbo].[user]\n"
                    + "           ([UserName]\n"
                    + "           ,[Password]\n"
                    + "           ,[Address]\n"
                    + "           ,[ContactTitle]\n"
                    + "           ,[Roll]\n"
                    + "           ,[YourName])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, account.getName());
            st.setString(2, hashPass(account.getPass()));
            st.setString(3, account.getAddress());
            st.setString(4, account.getContact());
            st.setInt(5, account.getRoll());
            st.setString(6, account.getYourname());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DaoAccount da = new DaoAccount();
        String hs = da.hashPass("thaonguyen");
        System.out.println(da.check("thaonguyen", "$2a$10$hU3GF68jgC0WovTVKzoyfeqbZOhh.A9y9WBKAYCseK9J8H/wf4ml."));
    }
}
