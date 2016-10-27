package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.Attendance;
import com.hudongwx.studentsys.model.Class;
import com.hudongwx.studentsys.model.Mapping;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.TimeKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/9/21 0021.
 */
public class AttendanceController extends BaseController {
    public AttendanceService attendanceService;
    public StudentService studentService;
    public ClassService classService;

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
        if (start_time_list == null || end_time_list == null || start_time_list > TimeKit.getNowTime() || end_time_list > TimeKit.getNowTime()) {
            end_time_list = TimeKit.getNowTime();
            start_time_list = 0L;
        }
        if (studentId == null) {
            studentId = studentService.getStudentByUser(getCurrentUser(this)).getId();
        }
        Page<Attendance> list_attendance = attendanceService.getPersonalAttendance(list_p, studentId, typeName, start_time_list, end_time_list);
        setAttr("personalAttendancePage", list_attendance);
    }

    public void personalAttendanceChart() {
        Integer classId = getParaToInt("class");
        Long start_time_chart = getParaToLong("start_time_chart");
        Long end_time_chart = getParaToLong("end_time_chart");
        Integer p_chart = getParaToInt("p_chart");
        Integer studentId = getParaToInt("student");
        if (studentId == null) {
            studentId = studentService.getStudentByUser(getCurrentUser(this)).getId();
        }
        if (p_chart == null || p_chart < 1)
            p_chart = 1;
        if (start_time_chart == null || end_time_chart == null || start_time_chart > TimeKit.getNowTime() || end_time_chart > TimeKit.getNowTime()) {
            end_time_chart = TimeKit.getNowTime();
            start_time_chart = 0L;
        }
        if (classId == null) {
            List<Class> allClass = classService.getAllClass();
            if (!allClass.isEmpty()) {
                classId = allClass.get(0).getId();
            } else
                classId = 0;
        }
        Map<String, Integer> countAttendance =
                attendanceService.getCountAttendanceByClassId(classId, start_time_chart, end_time_chart);
        Map<String, Integer> studentCountAttendance =
                attendanceService.getCountAttendanceByStudentId(studentId, start_time_chart, end_time_chart);
        setAttr("countAttendanceMap", countAttendance);

        setAttr("studentCountAttendanceMap",studentCountAttendance);
    }
}
