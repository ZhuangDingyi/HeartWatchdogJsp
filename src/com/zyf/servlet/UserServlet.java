package com.zyf.servlet;

/*
 * Created by viczyf on 2017/2/12.
 */

import com.zyf.User;
import com.zyf.dao.UserDao;
import com.zyf.tools.MyTools;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

/*
@WebServlet(
        name="UserServlet",
        urlPatterns = {"/UserServlet"}
)*/
public class UserServlet extends HttpServlet {
    public UserServlet() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("modifypasswd")) {
            this.changePasswd(request, response);
        }

        if (action.equals("modifyinfo")) {
            this.changeInfo(request, response);
        }
        if (action.equals("reg")) {
            this.reg(request, response);
        }

        if (action.equals("enter")) {
            this.enter(request, response);
        }
        if (action.equals("exit")) {
            this.exit(request, response);
        }
    }

    public void changeInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messages = "";
        String forward = "";
        String href = "";
        UserDao userdao = new UserDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
         String gender=request.getParameter("gender");
         String age=request.getParameter("age");
         String phone=request.getParameter("phone");
         String email=request.getParameter("email");
         String height=request.getParameter("height");
         String weight=request.getParameter("weight");
         String iden=request.getParameter("iden");
         String addr=request.getParameter("addr");
         String nationality=request.getParameter("nationality");
         String company=request.getParameter("company");
         String edu=request.getParameter("edu");
         String job=request.getParameter("job");
         String marry=request.getParameter("marry");
         String bloodtype=request.getParameter("bloodtype");
         String selfevaluate=request.getParameter("selfevaluate");
         String mentality=request.getParameter("mentality");
         String allergy=request.getParameter("allergy");
         String desease1=request.getParameter("desease1");
         String desease2=request.getParameter("desease2");
         String desease3=request.getParameter("desease3");
         String deseasemore=request.getParameter("deseasemore");
         String dtime1=request.getParameter("dtime1");
         String dtime2=request.getParameter("dtime2");
         String dtime3=request.getParameter("dtime3");
         String operation1=request.getParameter("operation1");
         String operation2=request.getParameter("operation2");
         String operation3=request.getParameter("operation3");
         String operationmore= request.getParameter("operationmore");
         String otime1=request.getParameter("otime1");
         String otime2=request.getParameter("otime2");
         String otime3=request.getParameter("otime3");
         String f1desease=request.getParameter("f1desease");
         String f2desease=request.getParameter("f2desease");
         String f3desease=request.getParameter("f3desease");
         String f4desease=request.getParameter("f4desease");
         String inheridesease=request.getParameter("inheridesease");
         String exefre=request.getParameter("exefre");
         String exeway=request.getParameter("exeway");
         String exetime=request.getParameter("exetime");
         String eathabit=request.getParameter("eathabit");
         String smokestatus=request.getParameter("smokestatus");
         String smokeamount=request.getParameter("smokeamount");
         String isdrink=request.getParameter("isdrink");
         String drinkamount=request.getParameter("drinkamount");
         String drinkfre=request.getParameter("drinkfre");
         String sleepstatus=request.getParameter("sleepstatus");
         String sleeptime=request.getParameter("sleeptime");
         String jobmaterial=request.getParameter("jobmaterial");
         String isjobprotect=request.getParameter("isjobprotect");
            boolean rs = userdao.userInfoModify(user,gender,age,phone,email,addr,iden,nationality, company,
                    edu,job, marry, bloodtype, height,weight, selfevaluate, mentality,
                    allergy, desease1,desease2,desease3,deseasemore,dtime1,dtime2,dtime3,operation1,
                    operation2,operation3,operationmore, otime1, otime2, otime3,
                    f1desease,f2desease, f3desease, f4desease, inheridesease, exefre, exeway, exetime, eathabit,
                    smokestatus, smokeamount, isdrink, drinkamount, drinkfre, sleepstatus,sleeptime, jobmaterial, isjobprotect);
            if (rs) {
                //            user1.setUid(user.getUid());
                user.setGender(gender);
                user.setAge(age);
                user.setPhone(phone);
                user.setEmail(email);
                user.setAddr(addr);
                user.setIden(iden);
                user.setNationality(nationality);
                user.setCompany(company);
                user.setEdu(edu);
                user.setJob(job);
                user.setMarry(marry);
                user.setBloodtype(bloodtype);
                user.setHeight(height);
                user.setWeight(weight);
                user.setSelfevaluate(selfevaluate);
                user.setMentality(mentality);
                user.setAllergy(allergy);
                user.setDesease1(desease1);
                user.setDesease2(desease2);
                user.setDesease3(desease3);
                user.setDeseasemore(deseasemore);
                user.setDtime1(dtime1);
                user.setDtime2(dtime2);
                user.setDtime3(dtime3);
                user.setOperation1(operation1);
                user.setOperation2(operation2);
                user.setOperation3(operation3);
                user.setOperationmore(operationmore);
                user.setOtime1(otime1);
                user.setOtime2(otime2);
                user.setOtime3(otime3);
                user.setF1desease(f1desease);
                user.setF2desease(f2desease);
                user.setF3desease(f3desease);
                user.setF4desease(f4desease);
                user.setInheridesease(inheridesease);
                user.setExefre(exefre);
                user.setExeway(exeway);
                user.setExetime(exetime);
                user.setEathabit(eathabit);
                user.setSmokestatus(smokestatus);
                user.setSmokeamount(smokeamount);
                user.setIsdrink(isdrink);
                user.setDrinkamount(drinkamount);
                user.setDrinkfre(drinkfre);
                user.setSleepstatus(sleepstatus);
                user.setSleeptime(sleeptime);
                user.setJobmaterial(jobmaterial);
                user.setIsjobprotect(isjobprotect);
                messages = "修改信息成功";
                forward = "tishi.jsp";
                href = "perinfo.jsp";
            } else {
//                messages = "修改信息失败，请检查输入数据是否满足格式要求";
                messages = "修改信息失败，请检查身份证信息是否正确，输入数据是否满足格式要求";
                forward = "tishi.jsp";
                href = "perinfomodify.jsp";
            }

        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(forward);
        requestDispatcher1.forward(request, response);
    }
    public void changePasswd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messages = "";
        String forward = "";
        String href = "";
        UserDao userdao = new UserDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String passwd = request.getParameter("passwd");
        if (user != null) {
            user.setPasswd(passwd);
            boolean rs = userdao.userPasswdModify(user);
            if (rs) {
                messages = "修改密码成功";
                forward = "tishi.jsp";
                href = "count.jsp";
            } else {
                messages = "修改信息失败，请检查输入数据是否满足格式要求";
                forward = "tishi.jsp";
                href = "count.jsp";
            }
        } else {
            request.setAttribute("info", "您还未登陆");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(forward);
        requestDispatcher1.forward(request, response);
    }

    public void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        // 获取密码
        String password = request.getParameter("passwd");
        // 获取性别
        String phone = request.getParameter("phone");
        // 获取电子邮箱
        String email = request.getParameter("email");
        // 实例化UserDao对象
        UserDao userDao = new UserDao();
        if (username != null && !username.isEmpty()) {
            System.out.println(username);
            if (!userDao.userIsExist(username)) {
                // 实例化一个User对象
                User user = new User();
                // 对用户对象中的属性赋值
                user.setUname(username);
                user.setPasswd(password);
                user.setPhone(phone);
                user.setEmail(email);
                user.setLastLogin("空，这是您第一次登陆心狗健康管理系统");
                // 保存用户注册信息
                userDao.saveUser(user);
                request.setAttribute("info", "恭喜，注册成功！请登录");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("info", "错误：此用户名已存在！");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }

    public void enter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        // 获取密码
        String password = request.getParameter("passwd");
        // 实例化UserDao对象
        HttpSession session = request.getSession();
        String rand = session.getAttribute("code").toString();
        String input = request.getParameter("code");
        UserDao userDao = new UserDao();
        // 根据用户密码查询用户
        User user = userDao.login(username, password);
        // 判断user是否为空
        if (!rand.equals(input)) {
            request.setAttribute("info", "验证码输入错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (user != null) {
            // 将用户对象放入session中
            request.getSession().setAttribute("lastlogin", user.getLastLogin());
            request.getSession().setAttribute("user", user);
            String enterdate = MyTools.changeTime(new Date());
            userDao.userEnterDate(enterdate, user);
            // 转发到result.jsp页面
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        } else {
            // 登录失败
            request.setAttribute("info", "错误：用户名或密码错误！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    public void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        UserDao userdao = new UserDao();
        // 判断用户是否有效
        if (user != null) {
            // 将用户对象逐出session
            session.removeAttribute("user");

            // 设置提示信息
            request.setAttribute("info", user.getUname()+"已成功退出！");
        }
        // 转发到message.jsp页面
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}

