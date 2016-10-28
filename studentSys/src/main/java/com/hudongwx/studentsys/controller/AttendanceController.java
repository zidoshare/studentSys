package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.hudongwx.studentsys.util.TimeKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.plugin.activerecord.Page;

import java.util.*;

/**
 * Created by wuhongxu on 2016/9/21 0021.
 */
public class AttendanceController extends BaseController {
    public AttendanceService attendanceService;
    public StudentService studentService;
    public ClassService classService;
    public UserService userService;

    /**
     * @return 返回一级菜单的mapping
     */
    @Override
    public Mapping init() {
        return mappingService.getMappingByUrl("/attendanceManager");
    }

    public void attendance() {
        setMapping(mappingService.getMappingByUrl("/attendanceManager/attendance"));
        super.index();
        String studentNames = getPara("student");
        Integer classId = getParaToInt("class");
        Long start_time_list = getParaToLong("start_time_list");
        Long end_time_list = getParaToLong("end_time_list");
        Integer list_p = getParaToInt("list_p");
        if (list_p == null)
            list_p = Common.START_PAGE;
        if (start_time_list == null || end_time_list == null || start_time_list > TimeKit.getTomarrow()) {
            end_time_list = TimeKit.getTomarrow();
            start_time_list = 0L;
        }
        if (classId == null)
            classId = 0;
        if (StrPlusKit.isEmpty(studentNames))
            studentNames = "0";
        String[] split = studentNames.split(",");
        List<Student> students = new ArrayList<>();
        List<Count> counts = new ArrayList<>();
        Map<String, Map<String, Long>> claTypeMap = new HashMap<>();
        for (String str : split) {
            if (str.equals("0")) {
                claTypeMap = new HashMap<>();
                counts = new ArrayList<>();
                List<Student> students1 = new ArrayList<>();
                if (classId == 0) {
                    Page<Student> studentPage = studentService.getAllStudent(list_p);
                    setAttr("page", studentPage);
                    students1 = studentPage.getList();
                } else {
                    Class aClass = classService.getClassById(classId);
                    Page<Student> studentPage = studentService.getStudentByClass(list_p, aClass);
                    setAttr("page", studentPage);
                    students1 = studentPage.getList();
                }
                for (Student stu : students1) {
                    Map<String, Long> countAttendanceByStudentId = attendanceService.getCountAttendanceByStudentId(stu.getId(), start_time_list, end_time_list);
                    Class aClass = classService.getClassByStudent(stu);
                    if (claTypeMap.get(aClass.getId() + "") == null) {
                        claTypeMap.put("" + aClass.getId(), attendanceService.getCountAttendanceByClassId(aClass.getId(), start_time_list, end_time_list));
                    }
                    Count c = new Count();
                    c.setaClass(aClass);
                    c.setStudent(stu);
                    c.setPerTypeMap(countAttendanceByStudentId);
                    counts.add(c);
                }
                //只要有一个不合法则清空
                students.clear();
                break;
            }
            //去重
            List<Student> studentByKey = studentService.findStudentByKey(str);
            studentByKey.stream().filter(students::contains).forEach(studentByKey::remove);
            students.addAll(studentByKey);
        }
        if (students.size() > 0) {
            int size = students.size();
            int totalPage = students.size() % 8 > 0 ? students.size() / 8 + 1 : students.size() / 8;
            students = students.subList((list_p - 1) * Common.MAX_PAGE_SIZE, list_p * Common.MAX_PAGE_SIZE<=size?list_p * Common.MAX_PAGE_SIZE:size);
            Page<Student> page = new Page<>(students, list_p,
                    Common.MAX_PAGE_SIZE,
                    totalPage,
                    size
            );
            setAttr("page",page);
        }
        for (Student student : students) {
            Class aClass = classService.getClassByStudent(student);
            Map<String, Long> countAttendanceByStudentId = attendanceService.getCountAttendanceByStudentId(student.getId(), start_time_list, end_time_list);
            if (claTypeMap.get(aClass.getId() + "") == null) {
                claTypeMap.put("" + aClass.getId(), attendanceService.getCountAttendanceByClassId(aClass.getId(), start_time_list, end_time_list));
            }
            Count c = new Count();
            c.setaClass(aClass);
            c.setStudent(student);
            c.setPerTypeMap(countAttendanceByStudentId);
            counts.add(c);
        }
        List<Class> allClass = classService.getAllClass();
        setAttr("allClass", allClass);
        setAttr("counts", counts);
        setAttr("claTypeMap", claTypeMap);
    }
    @Before(POST.class)
    public void postAttendance(){
        Attendance model = getModel(Attendance.class);
        Integer classId = classService.getClassByStudent(studentService.getStudentById(model.getStudentId())).getId();
        model.setClassId(classId);
        if(model.getId() == null){
            if(attendanceService._saveAttendance(model)){
                RenderKit.renderSuccess(this,"保存成功");
            }else{
                RenderKit.renderError(this,"保存失败");
            }
        }else{
            if(attendanceService._updateAttendance(model)){
                RenderKit.renderSuccess(this,"修改成功");
            }else{
                RenderKit.renderError(this,"修改失败");
            }
        }
    }

    public void prevewAttendanceList(){
        fillHeaderAndFooter();
        personalAttendanceList();
        render("/attendanceManager/personCore.ftl");
    }

    public void personalAttendance() {
        setMapping(mappingService.getMappingByUrl("/attendanceManager/personalAttendance"));
        super.index();
        List<Mapping> views = getAttr(Common.LABEL_VIEWS);
        //分发view,因为个人的会重复使用
        for (Mapping view : views) {
            if (view.getIcon().equals("personalAttendanceList")) {
                personalAttendanceList();
            } else {
                personalAttendanceChart();
            }
        }
    }

    public void personalAttendanceList() {
        String typeName = getPara("list_type");
        Long start_time_list = getParaToLong("start_time_list");
        Long end_time_list = getParaToLong("end_time_list");
        Integer list_p = getParaToInt("list_p");
        Integer studentId = getParaToInt("student");
        if (list_p == null || list_p < 1)
            list_p = 1;
        setAttr("start_time_list",start_time_list);
        if (start_time_list == null || end_time_list == null || start_time_list > TimeKit.getTomarrow()) {
            end_time_list = TimeKit.getTomarrow();
            start_time_list = 0L;
            setAttr("start_time_list",null);
        }
        setAttr("end_time_list",end_time_list);


        if (studentId == null) {
            studentId = studentService.getStudentByUser(getCurrentUser(this)).getId();
        }
        Page<Attendance> list_attendance = attendanceService.getPersonalAttendance(list_p, studentId, typeName, start_time_list, end_time_list);
        setAttr("personalAttendancePage", list_attendance);
        Map<String, User> userMap = new HashMap<>();
        for (Attendance attendance : list_attendance.getList()) {
            userMap.put(attendance.getOperaterId() + "", userService.getUserById(attendance.getOperaterId()));
        }
        if(StrPlusKit.isEmpty(typeName))
            typeName = "不限";
        setAttr("typeName",typeName);
        setAttr("userMap", userMap);
        setAttr("studentId",studentId);
    }

    public void personalAttendanceChart() {
        Integer classId = getParaToInt("class");
        Long start_time_chart = getParaToLong("start_time_chart");
        Long end_time_chart = getParaToLong("end_time_chart");
        Integer p_chart = getParaToInt("chart_p");
        Integer studentId = getParaToInt("student");
        if (studentId == null) {
            studentId = studentService.getStudentByUser(getCurrentUser(this)).getId();
        }
        if (p_chart == null || p_chart < 1)
            p_chart = 1;
        if (start_time_chart == null || end_time_chart == null || start_time_chart > TimeKit.getTomarrow() || end_time_chart > TimeKit.getTomarrow()) {
            end_time_chart = TimeKit.getTomarrow();
            start_time_chart = 0L;
        }
        setAttr("end_time_chart",end_time_chart);
        setAttr("start_time_chart",start_time_chart);
        if (classId == null) {
            /*List<Class> allClass = classService.getAllClass();
            if (!allClass.isEmpty()) {
                classId = allClass.get(0).getId();
            } else*/
            classId = classService.getClassByStudent(studentService.getStudentById(studentId)).getId();
        }
        Map<String, Long> countAttendance =
                attendanceService.getCountAttendanceByClassId(classId, start_time_chart, end_time_chart);
        Map<String, Long> studentCountAttendance =
                attendanceService.getCountAttendanceByStudentId(studentId, start_time_chart, end_time_chart);
        setAttr("countAttendanceMap", countAttendance);

        setAttr("studentCountAttendanceMap", studentCountAttendance);
        Map<String, Float> percentMap = new HashMap<>();
        for (String key : studentCountAttendance.keySet()) {
            Long parent = countAttendance.get(key);
            Long child = studentCountAttendance.get(key);
            if (parent != null && child != null && parent != 0L) {
                percentMap.put(key, child.floatValue() / parent.floatValue());
            } else {
                percentMap.put(key, 0F);
            }
        }
        setAttr("percentMap", percentMap);
    }
}
