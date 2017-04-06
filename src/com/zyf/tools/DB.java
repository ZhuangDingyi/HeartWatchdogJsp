package com.zyf.tools;
/*
 * Created by viczyf on 2017/2/9.
 */
import java.sql.*;
public class DB {
    private final String url = "jdbc:mysql://localhost:3306/xingou?useUnicode=true&characterEncoding=UTF-8";
    private final String userName = "root";
    private final String password = "liuchengliang";
    private Connection con = null;
    private Statement stm = null;

    public DB() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception var2) {
            var2.printStackTrace();
            System.out.println("加载数据库驱动失败！");
        }

    }

    public void createCon() {
        try {
            this.con = DriverManager.getConnection(url, userName, password);
        } catch (Exception var2) {
            var2.printStackTrace();
            System.out.println("获取数据库连接失败！");
        }

    }

    public void getStm() {
        this.createCon();

        try {
            this.stm = this.con.createStatement();
        } catch (SQLException var2) {
            var2.printStackTrace();
            System.out.println("创建Statement对象失败！");
        }

    }

    public boolean executeUpdate(String sql) {
        System.out.println(sql);
        boolean mark = false;

        try {
            this.getStm();
            int e = this.stm.executeUpdate(sql);
            if (e > 0) {
                mark = true;
            } else {
                mark = false;
            }
        } catch (Exception var4) {
            var4.printStackTrace();
            mark = false;
        }

        return mark;
    }

    public ResultSet executeQuery(String sql) {
        ResultSet rs = null;
        System.out.println(sql);

        try {
            this.getStm();

            try {
                rs = this.stm.executeQuery(sql);
            } catch (Exception var4) {
                var4.printStackTrace();
                System.out.println("查询数据库失败！");
            }
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return rs;
    }

    public void closed() {
        if (this.stm != null) {
            try {
                this.stm.close();
            } catch (SQLException var3) {
                var3.printStackTrace();
                System.out.println("关闭stm对象失败！");
            }
        }

        if (this.con != null) {
            try {
                this.con.close();
            } catch (SQLException var2) {
                var2.printStackTrace();
                System.out.println("关闭con对象失败！");
            }
        }
    }
}

