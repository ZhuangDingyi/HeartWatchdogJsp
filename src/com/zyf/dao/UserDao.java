package com.zyf.dao;

import com.zyf.User;
import com.zyf.tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * 用户数据库操作类
 * @author viczyf
 */
public class UserDao {
    /*
     * 添加用户
     * @param user 用户对象
     */
    private DB connection = null;
    private User user = null;

    public UserDao() {
        this.connection = new DB();
    }

    public boolean saveUser(User user) {
        /*
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "insert into users(uname,passwd,email,phone) values(?,?,?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, user.getUname());
            ps.setString(2, user.getPasswd());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            // 执行更新操作
            ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
            */
        String sql = "insert into users(uname,passwd,email,phone,lastlogin) values('" + user.getUname() + "','" + user.getPasswd() + "','" + user.getEmail() + "','" + user.getPhone() + "','" + user.getLastLogin() + "')";
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }

    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return 用户对象
     */
    public User login(String username, String password) {
        String sql = "select * from users where uname='" + username + "' and passwd='" + password + "'";
        ResultSet rs = this.connection.executeQuery(sql);
        try {
            if (rs != null && rs.next()) {
                user = new User();
                user.setUid(rs.getInt("uid"));
                user.setUname(rs.getString("uname"));
                user.setPasswd(rs.getString("passwd"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setLastLogin(rs.getString("lastlogin"));
                user.setGender(rs.getString("gender"));
                user.setAge(rs.getString("age"));
                user.setAddr(rs.getString("addr"));
                user.setWeight(rs.getString("weight"));
                user.setHeight(rs.getString("height"));
                user.setIden(rs.getString("iden"));
                user.setNationality(rs.getString("nationality"));
                user.setCompany(rs.getString("company"));
                user.setEdu(rs.getString("edu"));
                user.setJob(rs.getString("job"));
                user.setMarry(rs.getString("marry"));
                user.setBloodtype(rs.getString("bloodtype"));
                user.setDesease1(rs.getString("desease1"));
                user.setDesease2(rs.getString("desease2"));
                user.setDesease3(rs.getString("desease3"));
                user.setDtime1(rs.getString("dtime1"));
                user.setDtime2(rs.getString("dtime2"));
                user.setDtime3(rs.getString("dtime3"));
                user.setOperation1(rs.getString("operation1"));
                user.setOperation2(rs.getString("operation2"));
                user.setOperation3(rs.getString("operation3"));
                user.setOtime1(rs.getString("otime1"));
                user.setOtime2(rs.getString("otime2"));
                user.setOtime3(rs.getString("otime3"));
                user.setF1desease(rs.getString("f1desease"));
                user.setF2desease(rs.getString("f2desease"));
                user.setF3desease(rs.getString("f3desease"));
                user.setF4desease(rs.getString("f4desease"));
                user.setInheridesease(rs.getString("inheridesease"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

//        /*
//        User user = null;
//        // 获取数据库连接Connection对象
//        Connection conn = ConnectDB.getConnection();
//        // 根据用户名及密码查询用户信息
//        String sql = "select * from users where uname = ? and passwd = ?";
//        try {
//            // 获取PreparedStatement对象
//            PreparedStatement ps = conn.prepareStatement(sql);
//            // 对SQL语句的占位符参数进行动态赋值
//            ps.setString(1, username);
//            ps.setString(2, password);
//            // 执行查询获取结果集
//            ResultSet rs = ps.executeQuery();
//            // 判断结果集是否有效
//            if(rs.next()){
//                // 实例化一个用户对象
//                user = new User();
//                // 对用户对象属性赋值
//                user.setUid(rs.getInt("uid"));
//                user.setUname(rs.getString("uname"));
//                user.setPasswd(rs.getString("passwd"));
//                user.setEmail(rs.getString("email"));
//                user.setPhone(rs.getString("phone"));
//                user.setLastLogin(rs.getString("lastlogin"));
//            }
//            // 释放此 ResultSet 对象的数据库和 JDBC 资源
//            rs.close();
//            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }finally{
//            // 关闭数据库连接
//            ConnectDB.closeConnection(conn);
//        }
//        return user;
//        }
//        */
//
//
//    /*
//     * 判断用户名在数据库中是否存在
//     *
//     * @param username 用户名
//     * @return 布尔值
//     */
    /**public boolean userIsExist1(String username) {
        String sql = "select * from users where uname = ?";
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
    }*/
    public boolean userIsExist(String username){
        String sql = "select * from users where uname='"+username+"'";
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
    /*
    // 获取数据库连接Connection对象
    Connection conn = ConnectDB.getConnection();
    // 根据指定用户名查询用户信息
    String sql ="select * from users where uname = ?";
    try {
        // 获取PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 对用户对象属性赋值
        ps.setString(1, username);
        // 执行查询获取结果集
        ResultSet rs = ps.executeQuery();
        // 判断结果集是否有效
        if(!rs.next()){
            // 如果无效则证明此用户名可用
            return true;
        }
        // 释放此 ResultSet 对象的数据库和 JDBC 资源
        rs.close();
        // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
        ps.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }finally{
        // 关闭数据库连接
        ConnectDB.closeConnection(conn);
    }
    return false;
}
*/
    public boolean userInfoModify(User user,String gender,String age,String phone,String email,String addr,String iden,String height,String weight
//             String nationality,
//             String company,
//             String edu,
//             String job,
//             String marry,
//             String bloodtype,
//             String desease1,
//             String desease2,
//             String desease3,
//             String dtime1,
//             String dtime2,
//             String dtime3,
//             String operation1,
//             String operation2,
//             String operation3,
//             String otime1,
//             String otime2,
//             String otime3,
//             String f1desease,
//             String f2desease,
//             String f3desease,
//             String f4desease,
//             String inheridesease
    ) {
        String sql = "update users set gender='" +gender + "',age='" + age + "',phone='" +phone+ "',email='" + email + "',addr='" + addr+ "',iden='" + iden+ "',height='" +height+ "',weight='" + weight +
                "'where uid='" + user.getUid() + "'";
//        String sql = "update users set gender='" +gender + "',age='" + age + "',phone='" +phone+ "',email='" + email + "',addr='" + addr+ "',iden='" + iden+ "',height='" +height+ "',weight='" + weight + "',nationality='"+nationality+
//                "'where uid='" + user.getUid() + "'";
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }

    public boolean userPasswdModify(User user) {
        String sql = "update users set passwd='" + user.getPasswd() + "'where uid='" + user.getUid() + "'";
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }

    public void userEnterDate(String time, User user) {
        String sql = "update users set lastlogin='" + time + "'where uid='" + user.getUid() + "'";
        this.connection.executeUpdate(sql);
    }
}


