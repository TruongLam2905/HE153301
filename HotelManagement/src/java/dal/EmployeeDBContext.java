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
import model.Employee;

/**
 *
 * @author Admin
 */
public class EmployeeDBContext extends DBContext {

    public void insert(Employee emp) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [Employees]\n"
                    + "           ([EmployeeID]\n"
                    + "           ,[Name]\n"
                    + "           ,[address]\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, emp.getEmpID());
            stm.setString(2, emp.getName());
            stm.setString(3, emp.getAddress());
            stm.executeUpdate();
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
}
