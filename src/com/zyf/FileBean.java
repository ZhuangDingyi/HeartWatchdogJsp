package com.zyf;

/**
 * Created by viczyf on 2017/2/10.
 */

public class FileBean {
    private int id;
    private int uid;
    private String fileAddr;
    private String fileDate;
    private String fileInfo;

    public FileBean() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return this.uid;
    }

    public void setUid(int id) {
        this.uid = id;
    }

    public String getFileAddr() {
        return this.fileAddr;
    }

    public void setFileAddr(String fileAddr) {
        this.fileAddr = fileAddr;
    }

    public String getFileInfo() {
        return this.fileInfo;
    }

    public void setFileInfo(String fileInfo) {
        this.fileInfo = fileInfo;
    }

    public String getFileDate() {
        return this.fileDate;
    }

    public void setFileDate(String filedate) {
        this.fileDate = filedate;
    }
}

