package com.zyf.dao;

/*
 * Created by viczyf on 2017/2/10.
 */


import com.zyf.FileBean;
import com.zyf.tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileDao {
    private DB connection = null;

    public FileDao() {
        this.connection = new DB();
    }
    public boolean operationFile(String operation, FileBean single) {
        String sql = "";
        if (operation.equals("delete")) {
            sql = "delete from file where id=" + single.getId();
        }

        if (operation.equals("upload")) {
            sql = "insert into file(uid,fileaddr,filedate,fileinfo) values ('" + single.getUid() + "','" + single.getFileAddr() + "',\'" + single.getFileDate() + "\',\'" + single.getFileInfo() + "\')";
        }

        boolean mark = this.connection.executeUpdate(sql);
        return mark;
    }

    public FileBean queryFileSingle(int id,int uid) {
        FileBean filebean = null;
        String sql = "select * from file where id=" + id+" and uid="+uid;
        ResultSet rs = this.connection.executeQuery(sql);
        try {
            if (rs.next()) {
                filebean = new FileBean();
                filebean.setId(rs.getInt(1));
                filebean.setUid(rs.getInt(2));
                filebean.setFileAddr(rs.getString(3));
                filebean.setFileDate(rs.getString(4));
                filebean.setFileInfo(rs.getString(5));
            }
        } catch (SQLException var6) {
            var6.printStackTrace();
        }

        return filebean;
    }

    public List queryFile(int uid) {
        String sql = "";
        sql = "select * from file where uid='" + uid + "'";
        ArrayList list = null;
        FileBean filebean = null;
        ResultSet rs = this.connection.executeQuery(sql);
        if (rs != null) {
            list = new ArrayList();
            try {
                while (rs.next()) {
                    filebean = new FileBean();
                    filebean.setId(rs.getInt(1));
                    filebean.setUid(rs.getInt(2));
                    filebean.setFileAddr(rs.getString(3));
                    filebean.setFileDate(rs.getString(4));
                    filebean.setFileInfo(rs.getString(5));
                    list.add(filebean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public int queryMaxId() {
        int maxId = 0;
        String sql = "select max(id) from file";
        ResultSet rs = this.connection.executeQuery(sql);
        if (rs != null) {
            try {
                if (rs.next()) {
                    maxId = rs.getInt(1);
                }
            } catch (SQLException var8) {
                var8.printStackTrace();
            } finally {
                this.connection.closed();
            }
        }

        return maxId;
    }
}

