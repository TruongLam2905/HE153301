/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.eachroom;

import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;
import model.RoomType;

/**
 *
 * @author Admin
 */
public class AddEachRoomController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     * //
     * <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
     * /**
     * Handles the HTTP <code>GET</code> method.
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomDBContext rDB = new RoomDBContext();
        ArrayList<RoomType> typeRooms = rDB.getTypeRooms();
        request.setAttribute("typeRooms", typeRooms);
        request.getRequestDispatcher("../view/admin/eachRoom/addeachroom.jsp").forward(request, response);
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
        Room r = new Room();
        String room = request.getParameter("desc");
        r.setRoomID(Integer.parseInt(request.getParameter("roomid")));
        r.setRoomStatus(false);
        r.setDescription(request.getParameter("desc"));
        RoomDBContext rDB = new RoomDBContext();
        String id = request.getParameter("typeID");
        RoomType typeRooms = rDB.getTypeRooms(Integer.parseInt(request.getParameter("typeID")));
        r.setRoomType(typeRooms);
        rDB.insertRoom(r);
        response.sendRedirect("listEachroom");
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
