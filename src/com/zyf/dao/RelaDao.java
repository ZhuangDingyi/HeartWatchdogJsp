package com.zyf.dao;

import com.zyf.Info;
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
                    if (uid==rs.getInt("uid")){
                        relabean.setUid(rs.getInt("uid"));
                        relabean.setUname(rs.getString("uname"));
                        relabean.setReid(rs.getInt("reid"));
                        relabean.setRelaname(rs.getString("relaname"));
                    }else{
                        relabean.setUid(rs.getInt("reid"));
                        relabean.setUname(rs.getString("relaname"));
                        relabean.setReid(rs.getInt("uid"));
                        relabean.setRelaname(rs.getString("uname"));
                    }
                    relabean.setId(rs.getInt("id"));
                    relabean.setStatus(rs.getBoolean("status"));
                    list.add(relabean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public List checkRela(int uid) {
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
                    relabean.setUid(rs.getInt("uid"));
                    relabean.setUname(rs.getString("uname"));
                    relabean.setReid(rs.getInt("reid"));
                    relabean.setRelaname(rs.getString("relaname"));
                    relabean.setId(rs.getInt("id"));
                    relabean.setStatus(rs.getBoolean("status"));
                    relabean.setinformation(rs.getString("information"));
                    list.add(relabean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public List requestRela(int uid) {
        String sql = "";
        sql = "select * from userrela where uid='"+uid+"' and status=0";
        ArrayList list = null;
        RelaBean relabean = null;
        ResultSet rs = this.connection.executeQuery(sql);
        if (rs != null) {
            list = new ArrayList();
            try {
                while (rs.next()) {
                    relabean = new RelaBean();
                    relabean.setUid(rs.getInt("uid"));
                    relabean.setUname(rs.getString("uname"));
                    relabean.setReid(rs.getInt("reid"));
                    relabean.setRelaname(rs.getString("relaname"));
                    relabean.setId(rs.getInt("id"));
                    relabean.setStatus(rs.getBoolean("status"));
                    relabean.setinformation(rs.getString("information"));
                    list.add(relabean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    public boolean relaAgree(int id, int reid) {
        String sql = "update userrela set status=" + 1 + " where id=" +id +" and reid="+reid;
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }
    public boolean relaReject(int id, int reid) {
        String sql = "delete from userrela where id=" +id +" and reid="+reid;
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }
    public boolean relaDelete(int id, int uid) {
        String sql = "delete from userrela where id=" +id +" and (reid="+uid+" or uid="+uid+")";
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }
    public boolean relaCancel(int id, int uid) {
        String sql = "delete from userrela where id=" +id +" and uid="+uid;
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }
    public boolean relaIsExist(String relaname,int uid){
        String sql = "select * from userrela where relaname='"+relaname+"' and uid="+uid;
        ResultSet rs = this.connection.executeQuery(sql);
        boolean mark = false;
        try {
            if (rs != null && rs.next()) {
                mark = true;
            } else {
                mark = false;
            }
        } catch (SQLException e) {
            mark = false;
            e.printStackTrace();
        }
        return mark;
    }
    public boolean relaIsExist1(String relaname,int uid){
        String sql = "select * from userrela where uname='"+relaname+"' and reid="+uid;
        ResultSet rs = this.connection.executeQuery(sql);
        boolean mark = false;
        try {
            if (rs != null && rs.next()) {
                mark = true;
            } else {
                mark = false;
            }
        } catch (SQLException e) {
            mark = false;
            e.printStackTrace();
        }
        return mark;
    }
    public boolean sendRequest(int uid,String uname,int reid,String relaname,String information){
        String sql="insert into userrela(uid,uname,reid,relaname,status,information) values('"+uid+"','"+uname+"','"+ reid+"','"+relaname+"','"+0+"','"+information+"');";
        boolean mark = this.connection.executeUpdate(sql);
        return mark;
    }
}
