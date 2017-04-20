package com.zyf.dao;

import com.zyf.Medicalhistory;
import com.zyf.tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * Created by HASS-PC on 2017/4/18.
 */
public class MedicalhistoryDao {
    private DB connection=null;
    public MedicalhistoryDao(){this.connection=new DB();}
    public List queryList(int uid){
        String sql="select * from medicalhistory where uid='"+uid+"'";
        ArrayList list=new ArrayList();
        Medicalhistory mhis=null;
        ResultSet rs=this.connection.executeQuery(sql);
        if (rs != null){
            try{
                while (rs.next()){
                    mhis=new Medicalhistory();
                    mhis.setId(rs.getInt("id"));
                    mhis.setUid(rs.getInt("uid"));
                    mhis.setCity(rs.getString("city"));
                    mhis.setDate(rs.getString("date"));
                    mhis.setHospital(rs.getString("hospital"));
                    mhis.setOffice(rs.getString("office"));
                    mhis.setDoctor(rs.getString("doctor"));
                    mhis.setConclusion(rs.getString("conclusion"));
                    list.add(mhis);
                }

            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return list;
    }
    public boolean hisAdd(Medicalhistory his){
        String sql = "insert into medicalhistory(uid,city,date,hospital,office,doctor,conclusion) values('" + his.getUid() + "','" + his.getCity() + "','" + his.getDate() + "','" + his.getHospital() + "','" + his.getOffice() + "','" + his.getDoctor() + "','" + his.getConclusion() +"')";
        System.out.print(sql);
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }
    public boolean hisDel(int id,int uid){
        String sql="delete from medicalhistory where id="+id+" and uid="+uid;
        boolean flag=this.connection.executeUpdate(sql);
        return flag;
    }
    public Medicalhistory hisSingle(int id,int uid){
        String sql="select * from medicalhistory where id="+id+" and uid="+uid;
        ResultSet rs=this.connection.executeQuery(sql);
        Medicalhistory his=null;
        try{
            if(rs.next()){
                his=new Medicalhistory();
                his.setId(rs.getInt("id"));
                his.setUid(rs.getInt("uid"));
                his.setCity(rs.getString("city"));
                his.setDate(rs.getString("date"));
                his.setHospital(rs.getString("hospital"));
                his.setOffice(rs.getString("office"));
                his.setDoctor(rs.getString("doctor"));
                his.setConclusion(rs.getString("conclusion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return his;
    }
    public boolean hisModify(Medicalhistory his){
        String sql="update medicalhistory set city='"+his.getCity()+"',date='"+his.getDate()+"',hospital='"+his.getHospital()+"',office='"+his.getOffice()+"',doctor='"+his.getDoctor()+"',conclusion='"+his.getConclusion()+"' where id="+his.getId()+" and uid="+his.getUid();
        boolean flag=this.connection.executeUpdate(sql);
        return flag;
    }
}
