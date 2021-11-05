/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.room;

import dal.RoomDBContext;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.RoomType;

/**
 *
 * @author Admin
 */
@MultipartConfig(maxFileSize = 16177215)
public class RoomUpdateController extends HttpServlet {

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
        String roomTypeID = request.getParameter("id");
        request.setAttribute("roomTypeID", roomTypeID);
        RoomType typeRoom = rDB.getTypeRooms(Integer.parseInt(roomTypeID));
        request.setAttribute("typeRoom", typeRoom);
        request.getRequestDispatcher("../view/admin/room/roomupdate.jsp").forward(request, response);
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
        RoomDBContext rDB = new RoomDBContext();
        RoomType rt = rDB.getTypeRooms(Integer.parseInt(request.getParameter("id")));
        rt.setTypeName(request.getParameter("RoomTypename"));
        rt.setRoomTypeID(Integer.parseInt(request.getParameter("id")));
        rt.setDescription(request.getParameter("desc"));
        rt.setMaxGuest(Integer.parseInt(request.getParameter("maxGuest")));
        rt.setPrice(Double.parseDouble(request.getParameter("price")));
        InputStream input = null;
        Part filePart = request.getPart("filename");
        if(filePart != null) {
            input = filePart.getInputStream();
        }
        rDB.updateTypeRoom(rt, input);
        response.sendRedirect("allroom");
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
