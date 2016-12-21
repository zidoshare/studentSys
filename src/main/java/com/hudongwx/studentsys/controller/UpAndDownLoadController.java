package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.model.User;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.*;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.upload.UploadFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by wu on 2016/12/13.
 */
public class UpAndDownLoadController extends BaseController {
    public StudentService studentService;
    public ClassService classService;
    public UserService userService;

    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/upAndDownLoadManager");
    }

    public void upLoadExcel() throws ServiceException {
        UploadFile upExcel = getFile("excel", Common.UP_LOAD_EXCEL_PATH);
        User operater = getCurrentUser(this);
        if (upExcel != null) {
            boolean classExits = true;
            File file = upExcel.getFile();
            List<Student> students = ExcelUtil.paraExcel(file);
            System.out.println("students.size()---------->" + students.size());
            for (Student student : students) {
                Class aClass = classService.getClassByClassName(student.getClassName());
                if (aClass == null) {
                    classExits = false;
                    break;
                }
            }
            if (classExits) {
                for (Student student : students) {
                    Student studentByIdNumber = studentService.getStudentByIdNumber(student.getIdNumber());
                    User user = userService.getUserByStuPhone(student);
                    if (studentByIdNumber == null)
                        studentService._save(StudentUtil.rebuildUpLoadStudentModel(operater, student, userService, classService, studentService));
                    if (user == null)
                        StudentUtil.createAndSaveUserAccount(operater, student, userService, roleService);
                }
                List<Class> allClass = classService.getAllClass();
                if (!allClass.isEmpty()) {
                    for (Class cls : allClass) {
                        cls.setStudentCnt(studentService.getStuCntByClsId(cls.getId()));
                        classService._updateClass(cls);
                    }
                }
                file.delete();
                RenderKit.renderSuccess(this, "文件上传成功！");
            } else {
                file.delete();
                RenderKit.renderError(this, "表格数据存在异常！");
            }
        } else {
            RenderKit.renderError(this, "上传失败！");
        }
    }

    @Before(POST.class)
    public void upLoadPhoto() throws ServiceException {
        String idNumber = getPara("IN");
        HttpServletRequest request = getRequest();
        Enumeration<String> paraNames = request.getParameterNames();
        while (paraNames.hasMoreElements()) {
            log.info("para=" + paraNames.nextElement() + "--" + request.getParameter(paraNames.nextElement()));
        }
        UploadFile upPhoto = this.getFile("photo", Common.UP_LOAD_PHOTO_PATH);
        ImageUtil.deleteExtraImageFile(idNumber);
        System.out.println("idNumber------------------------>" + idNumber);
        if (upPhoto != null) {
            boolean complete = true;
            if (idNumber != null) {
                Student student = studentService.getStudentByIdNumber(idNumber);
                if (student != null) {
                    student.setPhotoUrl(Common.LOAD_PHOTO_PATH + "\\" + upPhoto.getFileName());
                    studentService._updateStudentById(student);
                    User user = userService.getUserByStuPhone(student);
                    user.setUserPurikura(student.getPhotoUrl());
                    userService._updateUser(user);
                } else {
                    complete = false;
                }
            } else {
                String fileName = upPhoto.getFileName();
                String[] filePart = fileName.split("\\.");
                System.out.println("filePart[0]--------------->" + filePart[0]);
                Student student = studentService.getStudentByIdNumber(filePart[0]);
                if (student != null) {
                    student.setPhotoUrl(Common.LOAD_PHOTO_PATH + "\\" + fileName);
                    studentService._updateStudentById(student);
                } else {
                    complete = false;
                }
            }
            if (complete) {
                RenderKit.renderSuccess(this, "图片上传成功！");
            } else {
                upPhoto.getFile().delete();
                RenderKit.renderError(this, "图片命名不规范已删除！");
            }
        } else {
            RenderKit.renderError(this, "图片上传失败！");
        }
    }

    private boolean isNumber(String idNumber) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(idNumber);
        return isNum.matches();
    }
}
