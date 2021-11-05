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

/**
 *
 * @author Admin
 */
public class AccountDBContext extends DBContext {

//    public Account getAccount(String username, String password) {
//        try {
//            String sql = "SELECT a.username,a.password,a.displayname,\n"
//                    + "f.fid,f.url\n"
//                    + "FROM Account a LEFT JOIN GroupAccount ga \n"
//                    + "ON a.username = ga.username\n"
//                    + "LEFT JOIN [Group] g ON g.gid = ga.gid\n"
//                    + "LEFT JOIN [GroupFeature] gf ON gf.gid = g.gid\n"
//                    + "LEFT JOIN [Feature] f ON f.fid = gf.fid\n"
//                    + "WHERE a.username = ? AND a.password = ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, username);
//            stm.setString(2, password);
//            ResultSet rs = stm.executeQuery();
//            Account account = null;
//            while (rs.next()) {
//                if (account == null) {
//                    account = new Account();
//                    account.setUser(username);
//                    account.setPass(password);
//                    account.setDisplayName(rs.getString("displayname"));
//                }
//            }
//            return account;
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
}
