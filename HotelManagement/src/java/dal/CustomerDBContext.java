/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author Admin
 */
public class CustomerDBContext extends DBContext {

    public ArrayList<Customer> getCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "Select CustomerID,[Name],Phone,[Address],Email from customer";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustomerID(rs.getInt("CustomerID"));
                c.setName(rs.getString("Name"));
                c.setPhone(rs.getString("Phone"));
                c.setEmail(rs.getString("Email"));
                customers.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public void insert(Customer customer) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [Customer]\n"
                    + "           ([Name]\n"
                    + "           ,[Phone]\n"
                    + "           ,[Address]\n"
                    + "           ,[Email])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, customer.getName());
            stm.setString(2, customer.getPhone());
            stm.setString(3, customer.getAddress());
            stm.setString(4, customer.getEmail());

            int executeUpdate = stm.executeUpdate();
            ResultSet generatedKeys = stm.getGeneratedKeys();
            int id = 0;
            if (generatedKeys.next()) {
                id = generatedKeys.getInt(1);
                customer.setCustomerID(id);
            }
//            try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
//                if (generatedKeys.next()) {
//                    customer.setCustomerID(generatedKeys.getInt(1));
//                }
//                generatedKeys.close();
//            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    public Customer get(String user, String pass) {
        try {
            String sql = "SELECT [CustomerID]\n"
                    + "      ,[Name]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Address]\n"
                    + "      ,[Email]\n"
                    + "      ,[Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[is_admin]\n"
                    + "  FROM [Customer] WHERE Username = ? AND Password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            if(rs.next()) {
                Customer c = new Customer();
                c.setCustomerID(rs.getInt("CustomerID"));
                c.setName(rs.getString("Name"));
                c.setPhone(rs.getString("Phone"));
                c.setAddress(rs.getString("Address"));
                c.setEmail(rs.getString("Email"));
                c.setUser(rs.getString("Username"));
                c.setPass(rs.getString("Password"));
                c.setIs_admin(rs.getBoolean("is_admin"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
