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
import model.Room;
import model.RoomType;

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
            String sql = "SELECT BookingID,c.CustomerID,c.Name,rt.TypeName,rt.RoomTypeID,rt.Description,rt.MaxGuest,rt.Price,\n"
                    + "r.RoomID,r.Description,r.RoomStatus,\n"
                    + "b.Reservation_date,b.Check_in,b.Check_out,\n"
                    + "c.Email,c.Phone,c.Address,b.[day],b.amount\n"
                    + "FROM Booking b INNER JOIN Customer c on b.CustomerID = c.CustomerID\n"
                    + "INNER JOIN Room r on r.RoomID = b.RoomID INNER JOIN RoomType rt on rt.RoomTypeID = r.RoomTypeID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("BookingID"));
                b.setReservationDate(rs.getDate("Reservation_date"));
                b.setCheck_in(rs.getDate("Check_in"));
                b.setCheck_out(rs.getDate("Check_out"));
                b.setDay(rs.getInt("day"));
                b.setAmount(rs.getFloat("amount"));
                Customer c = new Customer();
                c.setCustomerID(rs.getInt("CustomerID"));
                c.setName(rs.getString("Name"));
                c.setPhone(rs.getString("Phone"));
                c.setAddress(rs.getString("Address"));
                c.setEmail(rs.getString("Email"));
                b.setCustomer(c);
                Room r = new Room();
                r.setRoomID(rs.getInt("RoomID"));
                r.setDescription(rs.getString("Description"));
                r.setRoomStatus(rs.getBoolean("RoomStatus"));
                RoomType rt = new RoomType();
                rt.setRoomTypeID(rs.getInt("RoomTypeID"));
                rt.setTypeName(rs.getString("TypeName"));
                rt.setDescription(rs.getString("Description"));
                rt.setPrice(rs.getDouble("Price"));
                rt.getRooms().add(r);
                r.setRoomType(rt);
                b.setRoom(r);
                bookings.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookings;
    }

    public void delete(int BookingID) {
        try {
            String sql = "DELETE FROM [Booking]\n"
                    + "      WHERE BookingID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, BookingID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
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
//                    + "      ,[amount]\n"
//                    + "      ,[day]\n"
//                    + "  FROM [Booking] WHERE CustomerID = ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, RoomTypeID);
//            ResultSet rs = stm.executeQuery();
//            if (rs.next()) {
//                Booking b = new Booking();
//                b.setBookingID(rs.getInt("BookingID"));
//                b.setReservationDate(rs.getDate("Reservation_date"));
//                b.setCheck_in(rs.getDate("Check_in"));
//                b.setCheck_out(rs.getDate("Check_out"));
//                b.setAmount(rs.getFloat("amount"));
//                b.setDay(rs.getInt("day"));
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(BookingDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
