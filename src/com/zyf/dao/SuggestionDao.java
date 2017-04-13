package com.zyf.dao;

import com.zyf.Suggestion;
import com.zyf.tools.DB;

/*
 * Created by HASS-PC on 2017/4/13.
 */
public class SuggestionDao{
    private DB connection = null;
    private Suggestion suggestion= null;

    public SuggestionDao(){
        this.connection=new DB();
    }
    public boolean saveSuggestion(Suggestion suggestion){
        String sql = "insert into suggestion(uid,uname,date,suggestion) values('" + suggestion.getUid() + "','" + suggestion.getUname() + "','" + suggestion.getDate() + "','" + suggestion.getSuggsetion() + "')";
        boolean flag = this.connection.executeUpdate(sql);
        return flag;
    }
}
