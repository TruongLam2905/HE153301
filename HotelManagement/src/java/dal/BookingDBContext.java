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
import model.Booking;
import model.Customer;

/**
 *
 * @author Admin
 */
public class BookingDBContext extends DBContext {

    public void insertBooking(Booking b) {
        try {
            String sql = "INSERT INTO [Booking]\n"
                    + "           ([CustomerID]\n"
                    + "           ,[RoomID]\n"
                    + "           ,[Reservation_date]\n"
                    + "           ,[Check_in]\n"
                    + "           ,[Check_out]\n"
                    + "           ,[amount]\n"
                    + "           ,[day])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, b.getCustomer().getCustomerID());
            stm.setInt(2, b.getRoom().getRoomID());
            stm.setDate(3, b.getReservationDate());
            stm.setDate(4, b.getCheck_in());
            stm.setDate(5, b.getCheck_out());
            stm.setFloat(6, b.getAmount());
            stm.setInt(7, b.getDay());
            stm.executeUpdate();
            ResultSet generatedKeys = stm.getGeneratedKeys();
            int id = 0;
            if (generatedKeys.next()) {
                id = generatedKeys.getInt(1);
                b.setBookingID(id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Booking> getBooking() {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "select BookingID,Reservation_date,Check_in,Check_out,\n"
                    + "c.CustomerID,c.Name,Phone,Address,Email,r.RoomID,rt.RoomTypeID,\n"
                    + "RoomStatus,r.Description,TypeName,rt.Description,Price,MaxGuest,Img \n"
                    + "from Booking b inner join Customer c on b.CustomerID = c.CustomerID\n"
                    + "						inner join Room r on r.RoomID = b.RoomID\n"
                    + "						inner join RoomType rt on rt.RoomTypeID = r.RoomTypeID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("BookingID"));
                b.setReservationDate(rs.getDate("Reservation_date"));
                b.setCheck_in(rs.getDate("Check_in"));
                b.setCheck_out(rs.getDate("Check_out"));
                Customer c = new Customer();
                c.setCustomerID(rs.getInt("c.CustomerID"));
                c.setName(rs.getString("c.Name"));
                c.setPhone(rs.getString("Phone"));
                c.setAddress(rs.getString("Address"));
                c.setEmail(rs.getString("Email"));
                b.setCustomer(c);

            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookings;
    }

//    public Booking getBooking(int RoomTypeID) {
//        try {
//            String sql = "SELECT [BookingID]\n"
//                    + "      ,[CustomerID]\n"
//                    + "      ,[RoomID]\n"
//                    + "      ,[Reservation_date]\n"
//                    + "      ,[Check_in]\n"
//                    + "      ,[Check_out]\n"
//                    + "      ,[trans_id]\n"
//                    + "  FROM [Booking] WHERE CustomerID = ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, RoomTypeID);
//            ResultSet rs = stm.executeQuery();
//            if(rs.next()) {
//                Booking b = new Booking();
//                b.setBookingID(rs.getInt("BookingID"));
//                b.setCustomer(customer);
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(BookingDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
