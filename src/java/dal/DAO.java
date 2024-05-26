/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import java.util.*;
import Models.*;

/**
 *
 * @author Admin
 */
public class DAO {
    public Connection con;
    private List<Notes> notesList;
    private List<Users> usersList;
    private String status = "ok";
    public static DAO INS = new DAO();
    
    private DAO(){
        if(INS==null)
        try{
            con = new DBContext().connection;
        } catch(Exception e) {
            status = "Error at connection "+e.getMessage();
        }
        else INS = this;
    }
    
    public Users saveUser(String username, String password, int role){
        String sql = "insert into Users values(?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, role);
            ps.execute();
        } catch(SQLException e) {
            System.out.println("Error while saving user: "+e.getMessage());
        }
        return null;
    }
    
    public Users checkLogin(String username, String password){
        String sql = "select * from Users where username=? and password=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Users(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getInt(4));
            }
        } catch(SQLException e) {
            System.out.println("Error while logging in: "+e.getMessage());
        }
        return null;
    }
    
    public Users checkAccExist(String username){
        String sql = "select * from Users where username=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Users(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getInt(4));
            }
        } catch(SQLException e) {
            System.out.println("");
        }
        return null;
    }
    
    public Notes loadNotes(String username){
        String sql = "select * from Notes where username=?";
        notesList = new Vector<Notes>();
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String details = rs.getString("details");
                java.sql.Date dateAdded = rs.getDate("dateAdded");
                java.sql.Date dueDate = rs.getDate("dueDate");
                notesList.add(new Notes(id, title, details, dateAdded, dueDate, username));
            }
        } catch(SQLException e) {
            System.out.println("");
        }
        return null;
    }
    
    public Users loadUsers(){
        String sql = "select userId,username,role from Users";
        usersList = new Vector<Users>();
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int userId = rs.getInt(1);
                String username = rs.getString(2);
                int role = rs.getInt(3);
                usersList.add(new Users(userId, username, "", role));
            }
        } catch(SQLException e) {
            System.out.println("");
        }
        return null;
    }
    
    public Notes addNote(String title, String details, String dateAdded, String dueDate, String username){
        String sql = "insert into Notes(title,details,dateAdded,dueDate,username) values(?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, details);
            ps.setString(3, dateAdded);
            ps.setString(4, dueDate);
            ps.setString(5, username);
            ps.execute();
        } catch(SQLException e) {
            System.out.println("Error while adding note: "+e.getMessage());
        }
        return null;
    }
    
    public Notes updateNote(int id, String title, String details, String dateAdded, String dueDate){
        String sql = "update Notes set title=?, details=?, dateAdded=?, dueDate=? where id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, details);
            ps.setString(3, dateAdded);
            ps.setString(4, dueDate);
            ps.setInt(5, id);
            ps.execute();
        } catch(SQLException e) {
            System.out.println("Error while updating note: "+e.getMessage());
        }
        return null;
    }
    
    public Notes deleteNote(int id){
        String sql = "delete from Notes where id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch(SQLException e) {
            System.out.println("Error while deleting: "+e.getMessage());
        }
        return null;
    }
    
    public Notes getNote(int id){
        String sql = "select * from Notes where id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Notes(rs.getInt(1), rs.getString(2), 
                        rs.getString(3), rs.getDate(4), 
                        rs.getDate(5), rs.getString(6));
            }
        } catch(SQLException e) {
            System.out.println("Error while getting note: "+e.getMessage());
        }
        return null;
    }

    public List<Notes> getNotesList() {
        return notesList;
    }

    public void setNotesList(List<Notes> notesList) {
        this.notesList = notesList;
    }

    public List<Users> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<Users> usersList) {
        this.usersList = usersList;
    }
    
}
