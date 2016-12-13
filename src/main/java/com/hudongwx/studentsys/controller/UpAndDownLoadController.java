package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.model.Student;
import com.hudongwx.studentsys.service.ClassService;
import com.hudongwx.studentsys.service.StudentService;
import com.hudongwx.studentsys.service.UserService;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ExcelUtil;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.studentsys.util.StudentUtil;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.util.List;

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
        if (upExcel != null) {
            boolean classExits = true;
            File file = upExcel.getFile();
            List<Student> students = ExcelUtil.paraExcel(file);
            for (Student student : students) {
                Class aClass = classService.getClassByClassName(student.getClassName());
                if (aClass == null) {
                    classExits = false;
                    break;
                }
            }
            if (classExits) {
                for (Student student : students) {
                    studentService._save(StudentUtil.rebuildUpLoadStudentModel(getCurrentUser(this), student, userService, classService, studentService));
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

    public void upLoadPhoto() throws ServiceException {
        UploadFile upExcel = this.getFile("photo", Common.UP_LOAD_PHOTO_PATH);
        if(upExcel!=null){
           RenderKit.renderSuccess(this,"图片上传成功！");
        }else{
            RenderKit.renderError(this,"图片上传失败！");
        }

    }
}
