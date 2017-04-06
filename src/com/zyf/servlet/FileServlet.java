package com.zyf.servlet;

/*
 * Created by viczyf on 2017/2/10.
 */

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.zyf.FileBean;
import com.zyf.User;
import com.zyf.dao.FileDao;
import com.zyf.tools.MyTools;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(
        urlPatterns = {"/FileServlet"},
        name = "FileServlet"
)
public class FileServlet extends HttpServlet {
    public FileServlet() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("upload")) {
            this.addFile(request, response);
        }

        if (action.equals("delete")) {
            this.deleteFile(request, response);
        }

        if (action.equals("list")) {
            this.selectFile(request, response);
        }

        if (action.equals("download")) {
            this.downloadFile(request, response);
        }
    }

    public void selectFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FileDao filedao = new FileDao();
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int id = user.getUid();
        List fileList = filedao.queryFile(id);
        request.setAttribute("fileList", fileList);
        RequestDispatcher rd = request.getRequestDispatcher("filelist.jsp");
        rd.forward(request, response);
    }
    public void downloadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FileDao filedao = new FileDao();
        String strId = request.getParameter("id");
        int id = MyTools.strToint(strId);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        FileBean fileSingle = filedao.queryFileSingle(id,uid);
        request.setAttribute("filesingle", fileSingle);
        RequestDispatcher rd = request.getRequestDispatcher("filedownload.jsp");
        rd.forward(request, response);
    }

    public void deleteFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messages = "";
        String forward = "";
        String href = "";
        RequestDispatcher rd = null;
        FileDao fileDao = new FileDao();
        int id = MyTools.strToint(request.getParameter("id"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        String fileAddr = fileDao.queryFileSingle(id,uid).getFileAddr();
        String fileDir = request.getSession().getServletContext().getRealPath("\\");
        System.out.println(fileDir);
        String delFile = fileDir + fileAddr;
        System.out.println(delFile);
        File file = new File(delFile);
        FileBean fileBean = new FileBean();
        fileBean.setId(id);
        if (fileDao.operationFile("delete", fileBean)) {
            boolean result = file.delete();
            if (result) {
                messages = "<li>删除文件成功！</li>";
                forward = "tishi.jsp";
                href = "FileServlet?action=list";
            } else {
                messages = "<li>删除文件失败！</li>";
                forward = "tishi.jsp";
                href = "FileServlet?action=list";
            }
        } else {
            messages = "<li>删除文件信息失败！</li>";
            forward = "tishi.jsp";
            href = "FileServlet?action=list";
        }
        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        rd = request.getRequestDispatcher(forward);
        rd.forward(request, response);
    }

    public void addFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = "upload\\\\file\\\\";
        String messages = "";
        String forward = "";
        String href = "";
        FileDao fileDao = new FileDao();
        FileBean fileBean = new FileBean();
        SmartUpload su = new SmartUpload();
        long maxsize = 2097152L;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = user.getUid();
        try {
            su.initialize(this.getServletConfig(), request, response);
            su.setMaxFileSize(maxsize);
            su.setAllowedFilesList("jpg,gif,png,txt,doc,pdf,docx");
            su.upload();
            String fileinfo = su.getRequest().getParameter("info");
            if (fileinfo != null && !fileinfo.equals("")) {
                com.jspsmart.upload.File file = su.getFiles().getFile(0);
                if (!file.isMissing()) {
                    String fileAddr = filePath + id + "_" + fileDao.queryMaxId() + "." + file.getFileExt();
                    System.out.println(fileAddr);
                    String now = MyTools.changeTime(new Date());
                    fileBean.setUid(id);
                    fileBean.setFileAddr(fileAddr);
                    fileBean.setFileDate(now);
                    fileBean.setFileInfo(fileinfo);
                    boolean mark = fileDao.operationFile("upload", fileBean);
                    if (mark) {
                        try {
                            file.saveAs(fileAddr, 1);
                            messages = "上传文件成功！";
                            forward = "tishi.jsp";
                            href = "fileupload.jsp";
                        } catch (SmartUploadException var18) {
                            messages = "上传文件失败！";
                            forward = "tishi.jsp";
                            href = "fileupload.jsp";
                            var18.printStackTrace();
                        }
                    } else {
                        messages = "保存文件信息失败！";
                        forward = "tishi.jsp";
                        href = "fileupload.jsp";
                    }
                } else {
                    messages = "请选择要上传的文件！";
                    forward = "tishi.jsp";
                    href = "fileupload.jsp";
                }
            } else {
                messages = "请输入照片描述信息！";
                forward = "tishi.jsp";
                href = "fileupload.jsp";
            }
        } catch (SecurityException var19) {
            messages = "<li>上传文件失败!上传的文件类型只允许为：jpg,gif,png,txt,doc,docx,pdf;且文件大小不超过2MB</li>";
            forward = "tishi.jsp";
            href = "fileupload.jsp";
        } catch (SmartUploadException var20) {
            messages = "上传文件失败！";
            forward = "tishi.jsp";
            href = "fileupload.jsp";
            var20.printStackTrace();
        }
        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(forward);
        requestDispatcher1.forward(request, response);
    }
}
