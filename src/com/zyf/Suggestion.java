package com.zyf;

/*
 * Created by HASS-PC on 2017/4/13.
 */
public class Suggestion {
    private int id;
    private int uid;
    private String uname;
    private String date;
    private String suggsetion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSuggsetion() {
        return suggsetion;
    }

    public void setSuggsetion(String suggsetion) {
        this.suggsetion = suggsetion;
    }
}
