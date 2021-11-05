/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.Transaction;

/**
 *
 * @author Admin
 */
public class TransactionDBContext extends DBContext {

    public void insert(Transaction t) {
        try {
            String sql = "INSERT INTO [Transactions]\n"
                    + "           ([cus_id]\n"
                    + "           ,[trans_date]\n"
                    + "           ,[total]\n"
                    + "           ,[payment_type])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, t.getCustomer().getCustomerID());
            stm.setDate(2, t.getTrans_date());
            stm.setFloat(3, t.getTotal());
            stm.setString(4, t.getPaymenttype());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Transaction get(Customer c) {
        try {
            String sql = "SELECT trans_id,CustomerID,trans_date,total,payment_type,Name,Phone,Address,Email \n"
                    + "FROM Transactions t INNER JOIN  Customer c\n"
                    + "on t.cus_id = c.CustomerID WHERE c.CustomerID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, c.getCustomerID());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Transaction t = new Transaction();
                t.setCustomer(c);
                t.setPaymenttype(rs.getString("payment_type"));
                t.setTotal(rs.getFloat("total"));
                t.setTrans_id(rs.getInt("trans_id"));
                t.setTrans_date(rs.getDate("trans_date"));
                return t;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(Customer c, float total) {
        try {
            String sql = "UPDATE [Transactions]\n"
                    + "   SET [total] = ?\n"
                    + " WHERE cus_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setFloat(1, total);
            stm.setInt(2, c.getCustomerID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
