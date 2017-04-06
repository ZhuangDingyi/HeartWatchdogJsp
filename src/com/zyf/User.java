package com.zyf;

/**
 * 用户实体类
 */

public class User {
    private int uid;            // 标识
    private String uname;// 用户名
    private String passwd;// 密码

    private String phone;        // 电话

    private String email;    // 电子邮箱
    private String lastLogin;
    private String gender;
    private String age;
    private String height;
    private String weight;
    private String iden;
    private String addr;
    private String nationality;
    private String company;
    private String edu;
    private String job;
    private String marry;
    private String bloodtype;
    private String desease1;
    private String desease2;
    private String desease3;
    private String dtime1;
    private String dtime2;
    private String dtime3;
    private String operation1;
    private String operation2;
    private String operation3;
    private String otime1;
    private String otime2;
    private String otime3;
    private String f1desease;
    private String f2desease;
    private String f3desease;
    private String f4desease;
    private String inheridesease;


    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String username) {
        this.uname = username;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String password) {
        this.passwd = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        /*DateFormat format= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date=null;
        try {
            date = format.parse(lastLogin);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        */
        this.lastLogin = lastLogin;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String sex) {
        this.gender = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getHeight() {
        return this.height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getIden() {
        return this.iden;
    }

    public void setIden(String iden) {
        this.iden = iden;
    }

    public String getAddr() {
        return this.addr;
    }

    public void setAddr(String a) {
        this.addr = a;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getMarry() {
        return marry;
    }

    public void setMarry(String marry) {
        this.marry = marry;
    }

    public String getBloodtype() {
        return bloodtype;
    }

    public void setBloodtype(String bloodtype) {
        this.bloodtype = bloodtype;
    }

    public String getDesease1() {
        return desease1;
    }

    public void setDesease1(String desease1) {
        this.desease1 = desease1;
    }

    public String getDesease2() {
        return desease2;
    }

    public void setDesease2(String desease2) {
        this.desease2 = desease2;
    }

    public String getDesease3() {
        return desease3;
    }

    public void setDesease3(String desease3) {
        this.desease3 = desease3;
    }

    public String getDtime1() {
        return dtime1;
    }

    public void setDtime1(String dtime1) {
        this.dtime1 = dtime1;
    }

    public String getDtime2() {
        return dtime2;
    }

    public void setDtime2(String dtime2) {
        this.dtime2 = dtime2;
    }

    public String getDtime3() {
        return dtime3;
    }

    public void setDtime3(String dtime3) {
        this.dtime3 = dtime3;
    }

    public String getOperation1() {
        return operation1;
    }

    public void setOperation1(String operation1) {
        this.operation1 = operation1;
    }

    public String getOperation2() {
        return operation2;
    }

    public void setOperation2(String operation2) {
        this.operation2 = operation2;
    }

    public String getOperation3() {
        return operation3;
    }

    public void setOperation3(String operation3) {
        this.operation3 = operation3;
    }

    public String getOtime1() {
        return otime1;
    }

    public void setOtime1(String otime1) {
        this.otime1 = otime1;
    }

    public String getOtime2() {
        return otime2;
    }

    public void setOtime2(String otime2) {
        this.otime2 = otime2;
    }

    public String getOtime3() {
        return otime3;
    }

    public void setOtime3(String otime3) {
        this.otime3 = otime3;
    }

    public String getF1desease() {
        return f1desease;
    }

    public void setF1desease(String f1desease) {
        this.f1desease = f1desease;
    }

    public String getF2desease() {
        return f2desease;
    }

    public void setF2desease(String f2desease) {
        this.f2desease = f2desease;
    }

    public String getF3desease() {
        return f3desease;
    }

    public void setF3desease(String f3desease) {
        this.f3desease = f3desease;
    }

    public String getInheridesease() {
        return inheridesease;
    }

    public void setInheridesease(String inheridesease) {
        this.inheridesease = inheridesease;
    }

    public String getF4desease() {
        return f4desease;
    }

    public void setF4desease(String f4desease) {
        this.f4desease = f4desease;
    }
}

