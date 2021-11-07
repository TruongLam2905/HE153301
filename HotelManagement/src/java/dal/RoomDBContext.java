/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;
import model.RoomType;

/**
 *
 * @author Admin
 */
public class RoomDBContext extends DBContext {

    public ArrayList<Room> getAllRooms() {
        ArrayList<Room> Rooms = new ArrayList<>();
        try {

            String sql = "SELECT RoomID,rt.RoomTypeID,RoomStatus, r.Description,rt.TypeName,rt.Description,Price,MaxGuest \n"
                    + "FROM Room r INNER JOIN RoomType rt on r.RoomTypeID = rt.RoomTypeID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomType rt = new RoomType();
                rt.setRoomTypeID(rs.getInt("RoomTypeID"));
                rt.setTypeName(rs.getString("TypeName"));
                rt.setDescription(rs.getString("Description"));
                rt.setPrice(rs.getDouble("Price"));
                rt.setMaxGuest(rs.getInt("MaxGuest"));
                Room r = new Room();
                r.setRoomID(rs.getInt("RoomID"));
                r.setDescription(rs.getString("Description"));
                r.setRoomStatus(rs.getBoolean("RoomStatus"));
                r.setRoomType(rt);
                Rooms.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Rooms;
    }

    public ArrayList<RoomType> getTypeRooms() {
        ArrayList<RoomType> typeRooms = new ArrayList<>();
        try {

            String sql = "SELECT [RoomTypeID]\n"
                    + "      ,[TypeName]\n"
                    + "      ,[Description]\n"
                    + "      ,[Price]\n"
                    + "      ,[Img]\n"
                    + "      ,[MaxGuest]\n"
                    + "  FROM [RoomType]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomType rt = new RoomType();
                rt.setRoomTypeID(rs.getInt("RoomTypeID"));
                rt.setTypeName(rs.getString("TypeName"));
                rt.setDescription(rs.getString("Description"));
                rt.setPrice(rs.getDouble("Price"));
                Blob blob = rs.getBlob("Img");
                rt.setMaxGuest(rs.getInt("MaxGuest"));
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                inputStream.close();
                outputStream.close();
                rt.setBase64Image(base64Image);
                typeRooms.add(rt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return typeRooms;
    }

    public RoomType getTypeRooms(int id) {
        ArrayList<RoomType> typeRooms = new ArrayList<>();
        try {

            String sql = "SELECT [RoomTypeID]\n"
                    + "      ,[TypeName]\n"
                    + "      ,[Description]\n"
                    + "      ,[Price]\n"
                    + "      ,[Img]\n"
                    + "      ,[MaxGuest]\n"
                    + "  FROM [RoomType] WHERE [RoomTypeID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            RoomType rt = new RoomType();
            if (rs.next()) {
                rt.setRoomTypeID(rs.getInt("RoomTypeID"));
                rt.setTypeName(rs.getString("TypeName"));
                rt.setDescription(rs.getString("Description"));
                rt.setPrice(rs.getDouble("Price"));
                rt.setMaxGuest(rs.getInt("MaxGuest"));
                rt.setRooms(getTypeRoom(id));
                Blob blob = rs.getBlob("Img");

                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                inputStream.close();
                outputStream.close();
                rt.setBase64Image(base64Image);
            }
            return rt;

        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateTypeRoom(RoomType rt, InputStream input) {
        try {
            String sql = "UPDATE [RoomType]\n"
                    + "   SET [TypeName] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[Price] = ?\n"
                    + "      ,[Img] = ?\n"
                    + "      ,[MaxGuest] = ?\n"
                    + " WHERE RoomTypeID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, rt.getTypeName());
            stm.setString(2, rt.getDescription());
            stm.setDouble(3, rt.getPrice());
//            if (input != null) {
            stm.setBlob(4, input);
//            } else {
//            
//            }
            stm.setInt(5, rt.getMaxGuest());
            stm.setInt(6, rt.getRoomTypeID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertRoom(Room r) {
        try {
            String sql = "INSERT INTO [Room]\n"
                    + "           ([RoomID]\n"
                    + "           ,[RoomTypeID]\n"
                    + "           ,[RoomStatus]\n"
                    + "           ,[Description])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getRoomID());
            stm.setInt(2, r.getRoomType().getRoomTypeID());
            stm.setBoolean(3, r.isRoomStatus());
            stm.setString(4, r.getDescription());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Room> getTypeRoom(int rTypeID) throws IOException {
        ArrayList<Room> rooms = new ArrayList<>();
        try {
            String sql = "SELECT RoomID,rt.RoomTypeID,RoomStatus,r.Description,TypeName,rt.Description,Price,Img,MaxGuest \n"
                    + "FROM Room r INNER JOIN RoomType rt on r.RoomTypeID = rt.RoomTypeID\n"
                    + "WHERE rt.RoomTypeID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rTypeID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setRoomID(rs.getInt("RoomID"));
                r.setRoomStatus(rs.getBoolean("RoomStatus"));
                r.setDescription(rs.getString("Description"));
                RoomType rt = new RoomType();
                rt.setRoomTypeID(rs.getInt("RoomTypeID"));
                rt.setTypeName(rs.getString("TypeName"));
                rt.setPrice(rs.getDouble("Price"));
                rt.setDescription(rs.getString("Description"));
                rt.setMaxGuest(rs.getInt("MaxGuest"));
                Blob blob = rs.getBlob("Img");

                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                inputStream.close();
                outputStream.close();
                rt.setBase64Image(base64Image);
                r.setRoomType(rt);
                rooms.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rooms;
    }

    public void changeStatusRoom(Room r) {
        try {
            String sql = "UPDATE [Room]\n"
                    + "   SET [RoomStatus] = 1\n"
                    + " WHERE RoomID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getRoomID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Room getRoom(int roomID) throws IOException {
        try {
            String sql = "SELECT RoomID,rt.RoomTypeID,RoomStatus,r.Description,TypeName,rt.Description,Price,Img,MaxGuest \n"
                    + "FROM Room r INNER JOIN RoomType rt on r.RoomTypeID = rt.RoomTypeID\n"
                    + "WHERE r.RoomID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roomID);
            ResultSet rs = stm.executeQuery();
            Room r = new Room();
            if (rs.next()) {
                r.setRoomID(rs.getInt("RoomID"));
                r.setRoomStatus(rs.getBoolean("RoomStatus"));
                r.setDescription(rs.getString("Description"));
                RoomType rt = new RoomType();
                rt.setRoomTypeID(rs.getInt("RoomTypeID"));
                rt.setTypeName(rs.getString("TypeName"));
                rt.setPrice(rs.getDouble("Price"));
                rt.setDescription(rs.getString("Description"));
                rt.setMaxGuest(rs.getInt("MaxGuest"));
                Blob blob = rs.getBlob("Img");

                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                inputStream.close();
                outputStream.close();
                rt.setBase64Image(base64Image);
                r.setRoomType(rt);
                return r;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(RoomType rt, InputStream input) {
        try {
            String sql = "INSERT INTO [RoomType]\n"
                    + "           ([TypeName]\n"
                    + "           ,[Description]\n"
                    + "           ,[Price]\n"
                    + "           ,[Img]\n"
                    + "           ,[MaxGuest])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, rt.getTypeName());
            stm.setString(2, rt.getDescription());
            stm.setDouble(3, rt.getPrice());
            stm.setBlob(4, input);
            stm.setInt(5, rt.getMaxGuest());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int roomid) {
        try {
            String sql = "DELETE FROM [Room]\n"
                    + "      WHERE RoomID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roomid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(Room r) {
        try {
            String sql = "UPDATE [Room]\n"
                    + "   SET [RoomID] = ?\n"
                    + "      ,[RoomTypeID] = ?\n"
                    + "      ,[RoomStatus] = ?\n"
                    + "      ,[Description] = ?\n"
                    + " WHERE RoomID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getRoomID());
            stm.setInt(2, r.getRoomType().getRoomTypeID());
            stm.setBoolean(3, r.isRoomStatus());
            stm.setString(4, r.getDescription());
            stm.setInt(5, r.getRoomID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
