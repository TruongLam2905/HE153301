/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.booking;

import dal.BookingDBContext;
import dal.CustomerDBContext;
import dal.RoomDBContext;
import dal.TransactionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Booking;
import model.Customer;
import model.Room;
import model.RoomType;
import model.Transaction;

/**
 *
 * @author Admin
 */
public class BookingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomDBContext rDB = new RoomDBContext();
        ArrayList<RoomType> typeRooms = rDB.getTypeRooms();
        request.setAttribute("typeRooms", typeRooms);
        String roomID = request.getParameter("roomID");
//        request.setAttribute("roomTypeID", roomTypeID);
        Room room = rDB.getRoom(Integer.parseInt(roomID));
        RoomType typeRoom = rDB.getTypeRooms(room.getRoomType().getRoomTypeID());
        request.setAttribute("room", room);
        request.setAttribute("typeRoom", typeRoom);
        ArrayList<Room> rooms = rDB.getTypeRoom(room.getRoomType().getRoomTypeID());
        request.setAttribute("rooms", rooms);
        String checkIn = (String) request.getSession().getAttribute("check-in");
        String checkOut = (String) request.getSession().getAttribute("check-out");
        String maxG = (String) request.getSession().getAttribute("maxG");
        request.setAttribute("maxG", maxG);
        request.setAttribute("checkIn", checkIn);
        request.setAttribute("checkOut", checkOut);
        request.getRequestDispatcher("../view/booking/booking.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer c = new Customer();
        c.setCustomerID(Integer.parseInt(request.getParameter("id")));
        c.setName(request.getParameter("name"));
        c.setAddress(request.getParameter("address"));
        c.setEmail(request.getParameter("email"));
        c.setPhone(request.getParameter("phone"));
        CustomerDBContext cDB = new CustomerDBContext();
        RoomDBContext rDB = new RoomDBContext();
        Customer user = (Customer) request.getSession().getAttribute("user");
        Room room = rDB.getRoom(Integer.parseInt(request.getParameter("NoRoom")));
        room.setRoomStatus(true);
        rDB.changeStatusRoom(room);
        Booking b = new Booking();
        b.setCustomer(user);
        b.setRoom(room);
        b.setCheck_in(Date.valueOf(request.getParameter("In")));
        b.setCheck_out(Date.valueOf(request.getParameter("Out")));
        b.setReservationDate(Date.valueOf(request.getParameter("reserDate")));
        RoomType typeRoom = rDB.getTypeRooms(b.getRoom().getRoomType().getRoomTypeID());
        int time = (int) ((b.getCheck_out().getTime() - b.getCheck_in().getTime()) / 86400000);
        float amount = (float) (time * typeRoom.getPrice());
        b.setAmount((time * (float) typeRoom.getPrice()));
        b.setDay(time);
        BookingDBContext bDB = new BookingDBContext();
        user.getBookings().add(b);
        String payment = request.getParameter("payment");
//        request.getSession(false).setAttribute("customer", c);
        TransactionDBContext tDB = new TransactionDBContext();
        Transaction t = tDB.get(user);
        if (t == null) {
            t = new Transaction();
            t.setCustomer(user);
            java.util.Date date = new java.util.Date();
            Date sqlDate = new Date(date.getTime());
            t.setTrans_date(sqlDate);
            t.setPaymenttype(payment);
            tDB.insert(t);
//            float total = 0;
//            for (Booking booking : user.getBookings()) {
//                total += booking.getAmount();
//            }
//            t.setTotal(total);
        }
        bDB.insertBooking(b);
        float total = 0;
        for (Booking booking : user.getBookings()) {
            total += booking.getAmount();
        }
        t.setTotal(total);
        b.setTrans(t);
        tDB.update(user, total);
        request.getSession(false).setAttribute("trans", t);

        response.sendRedirect("isLogged");
//        response.sendRedirect("payment");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
