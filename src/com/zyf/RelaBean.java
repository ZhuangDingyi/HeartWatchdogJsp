package com.zyf;

/*
 * Created by Administrator on 2017/3/27.
 */
public class RelaBean {
    private int id;
    private int uid;
    private String uname;
    private int reid;
    private String relaname;
    private boolean status;
    private String information;
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

    public int getReid() {
        return reid;
    }

    public void setReid(int reid) {
        this.reid = reid;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getRelaname() {
        return relaname;
    }

    public void setRelaname(String relaname) {
        this.relaname = relaname;
    }

    public String getinformation() {
        return information;
    }

    public void setinformation(String information) {
        this.information = information;
    }
}
