package com.zyf.dao;

import com.zyf.RelaBean;
import com.zyf.User;
import com.zyf.tools.DB;

import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * Created by Administrator on 2017/3/27.
 */
public class RelaDao {
    private DB connection = null;

    public RelaDao() {
        this.connection = new DB();
    }
    public List queryRela(int uid) {
        String sql = "";
        sql = "select * from userrela where (uid='" + uid + "' or reid='"+uid+"') and status=1";
        ArrayList list = null;
        RelaBean relabean = null;
        ResultSet rs = this.connection.executeQuery(sql);
        if (rs != null) {
            list = new ArrayList();
            try {
                while (rs.next()) {
                    relabean = new RelaBean();
                    if (uid==rs.getInt(2)){
                        relabean.setUid(rs.getInt(2));
                        relabean.setUname(rs.getString(3));
                        relabean.setReid(rs.getInt(4));
                        relabean.setRelaname(rs.getString(5));
                    }else{
                        relabean.setUid(rs.getInt(4));
                        relabean.setUname(rs.getString(5));
                        relabean.setReid(rs.getInt(2));
                        relabean.setRelaname(rs.getString(3));
                    }
                    relabean.setId(rs.getInt(1));
                    relabean.setStatus(rs.getBoolean(6));
                    list.add(relabean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public List CheckRela(int uid) {
        String sql = "";
        sql = "select * from userrela where reid='"+uid+"' and status=0";
        ArrayList list = null;
        RelaBean relabean = null;
        ResultSet rs = this.connection.executeQuery(sql);
        if (rs != null) {
            list = new ArrayList();
            try {
                while (rs.next()) {
                    relabean = new RelaBean();
                    relabean.setUid(rs.getInt(2));
                    relabean.setUname(rs.getString(3));
                    relabean.setReid(rs.getInt(4));
                    relabean.setRelaname(rs.getString(5));
                    relabean.setId(rs.getInt(1));
                    relabean.setStatus(rs.getBoolean(6));
                    list.add(relabean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
