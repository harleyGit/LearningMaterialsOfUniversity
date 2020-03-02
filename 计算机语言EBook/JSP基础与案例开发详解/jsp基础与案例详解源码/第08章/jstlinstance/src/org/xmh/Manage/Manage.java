package org.xmh.Manage;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import org.xmh.DBcon.*;
import org.xmh.Bean.Bean;

public class Manage {
    public Manage() {
    }

    boolean issuc = false;
    DBcon dbc = new DBcon();
    public boolean insert(String name, String classes, String score) {
        Connection con = dbc.getcon();
        Statement s = null;
        try {
            s = con.createStatement();
            int count = s.executeUpdate(
                    "insert into stuInfo (name,classes,score)values('" + name +
                    "','" + classes + "','" + score + "')");
            if (count > 0) {
                issuc = true;

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            close2(s, con);
        }
        return issuc;
    }

    public Collection select() {
        Collection list = new ArrayList();
        Connection con = dbc.getcon();
        Statement s = null;
        ResultSet rs = null;
        try {
            String sql = "select * from stuInfo";
            s = con.createStatement();
            rs = s.executeQuery(sql);
            while (rs.next()) {
                Bean mybean = new Bean();
                mybean.setId(rs.getString("id"));
                mybean.setName(rs.getString("name"));
                mybean.setClasses(rs.getString("classes"));
                mybean.setScore(rs.getString("score"));
                list.add(mybean);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            close(rs, s, con);
        }

        return list;
    }

    public boolean delete(String id) {
        Connection con = dbc.getcon();
        Statement s = null;
        try {
            s = con.createStatement();
            int count = s.executeUpdate("delete from stuInfo where id='" + id +
                                        "'");
            if (count > 0) {
                issuc = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            close2(s, con);
        }
        return issuc;

    }

    public ArrayList up_select(String id) {
        ArrayList list = new ArrayList();
        Connection con = dbc.getcon();
        Statement s = null;
        ResultSet rs = null;
        try {
            String sql = "select * from stuInfo where id='" + id + "'";
            s = con.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                Bean mybean = new Bean();
                mybean.setId(rs.getString("id"));
                mybean.setName(rs.getString("name"));
                mybean.setClasses(rs.getString("classes"));
                mybean.setScore(rs.getString("score"));
                list.add(mybean);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            close(rs, s, con);
        }
        return list;

    }

    public boolean update(String name, String classes, String score, String id) {
        Connection con = dbc.getcon();
        Statement s = null;
        try {

            s = con.createStatement();
            int count = s.executeUpdate("update stuInfo set name='" + name +
                                        "',classes='" + classes + "',score='" +
                                        score + "' where id='" + id + "'");
            if (count > 0) {
                issuc = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            close2(s, con);
        }
        return issuc;

    }

    public void close(ResultSet rs, Statement s, Connection con) {
        try {
            rs.close();
            s.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void close2(Statement s, Connection con) {
        try {
            s.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
}
