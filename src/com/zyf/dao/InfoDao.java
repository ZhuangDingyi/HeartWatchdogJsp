package com.zyf.dao;

import com.zyf.Info;
import com.zyf.tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * Created by viczyf on 2017/2/9.
 */
public class InfoDao {
    private DB connection = null;

    public InfoDao() {
        this.connection = new DB();
    }

    public boolean delInfo(Info single,int uid) {
        String sql = "";
        sql = "delete from info where id=" + single.getId()+" and uid="+uid;
        System.out.println(sql);
        boolean mark = this.connection.executeUpdate(sql);
        return mark;
    }

    public List queryInfo(int uid) {
        String sql = "";
        sql = "select * from info where uid='" + uid + "'";
        ArrayList list = null;
        Info info = null;
        ResultSet rs = this.connection.executeQuery(sql);
        if (rs != null) {
            list = new ArrayList();
            try {
                while (rs.next()) {
                    info = new Info();
                    info.setId(rs.getInt(1));
                    info.setUid(rs.getInt(2));
                    info.setDate(rs.getString(3));
                    info.setXinlv(rs.getInt(4));
                    info.setXdgs(rs.getFloat(5));
                    info.setCon1(rs.getString(6));
                    info.setSxxdgs(rs.getFloat(7));
                    info.setCon2(rs.getString(8));
                    info.setXdgh(rs.getFloat(9));
                    info.setCon3(rs.getString(10));
                    info.setFxyb(rs.getFloat(11));
                    info.setCon4(rs.getString(12));
                    info.setSxyb(rs.getFloat(13));
                    info.setCon5(rs.getString(14));
                    info.setXlbq(rs.getFloat(15));
                    info.setCon6(rs.getString(16));
                    info.setSxzb(rs.getFloat(17));
                    info.setCon7(rs.getString(18));
                    info.setFxzb(rs.getFloat(19));
                    info.setCon8(rs.getString(20));
                    info.setJjxzb(rs.getFloat(21));
                    info.setCon9(rs.getString(22));
                    info.setFc(rs.getFloat(23));
                    info.setCon10(rs.getString(24));
                    info.setData(rs.getString(25));
                    list.add(info);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    public List queryTimeInfo(int uid,String startdate,String enddate) {
        String sql = "";
        sql = "select * from info where uid='" + uid +"'"+"and to_days(date)>=to_days('"+startdate+"') and to_days(date)<=to_days('"+enddate+"')";
        ArrayList list = null;
        Info info = null;
        ResultSet rs = this.connection.executeQuery(sql);
        if (rs != null) {
            list = new ArrayList();
            try {
                while (rs.next()) {
                    info = new Info();
                    info.setId(rs.getInt(1));
                    info.setUid(rs.getInt(2));
                    info.setDate(rs.getString(3));
                    info.setXinlv(rs.getInt(4));
                    info.setXdgs(rs.getFloat(5));
                    info.setCon1(rs.getString(6));
                    info.setSxxdgs(rs.getFloat(7));
                    info.setCon2(rs.getString(8));
                    info.setXdgh(rs.getFloat(9));
                    info.setCon3(rs.getString(10));
                    info.setFxyb(rs.getFloat(11));
                    info.setCon4(rs.getString(12));
                    info.setSxyb(rs.getFloat(13));
                    info.setCon5(rs.getString(14));
                    info.setXlbq(rs.getFloat(15));
                    info.setCon6(rs.getString(16));
                    info.setSxzb(rs.getFloat(17));
                    info.setCon7(rs.getString(18));
                    info.setFxzb(rs.getFloat(19));
                    info.setCon8(rs.getString(20));
                    info.setJjxzb(rs.getFloat(21));
                    info.setCon9(rs.getString(22));
                    info.setFc(rs.getFloat(23));
                    info.setCon10(rs.getString(24));
                    info.setData(rs.getString(25));
                    list.add(info);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    public Info queryInfoSingle(int id,int uid) {
        Info info = null;
        String sql = "select * from info where id=" + id+" and uid="+uid;
        ResultSet rs = this.connection.executeQuery(sql);
        try {
            if (rs.next()) {
                info = new Info();
                info.setId(rs.getInt(1));
                info.setUid(rs.getInt(2));
                info.setDate(rs.getString(3));
                info.setXinlv(rs.getInt(4));
                info.setXdgs(rs.getFloat(5));
                info.setCon1(rs.getString(6));
                info.setSxxdgs(rs.getFloat(7));
                info.setCon2(rs.getString(8));
                info.setXdgh(rs.getFloat(9));
                info.setCon3(rs.getString(10));
                info.setFxyb(rs.getFloat(11));
                info.setCon4(rs.getString(12));
                info.setSxyb(rs.getFloat(13));
                info.setCon5(rs.getString(14));
                info.setXlbq(rs.getFloat(15));
                info.setCon6(rs.getString(16));
                info.setSxzb(rs.getFloat(17));
                info.setCon7(rs.getString(18));
                info.setFxzb(rs.getFloat(19));
                info.setCon8(rs.getString(20));
                info.setJjxzb(rs.getFloat(21));
                info.setCon9(rs.getString(22));
                info.setFc(rs.getFloat(23));
                info.setCon10(rs.getString(24));
                info.setData(rs.getString(25));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return info;
    }
}