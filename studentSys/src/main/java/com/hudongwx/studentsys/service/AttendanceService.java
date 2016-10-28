package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Attendance;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wuhongxu on 2016/10/27 0027.
 */
public class AttendanceService extends Service {

    public boolean _saveAttendance(Attendance attendance){
        return attendance.save();
    }

    public boolean _updateAttendance(Attendance attendance){
        return attendance.update();
    }

    public Page<Attendance> getPersonalAttendance(int currentPage, Integer studentId, String type, long startTime, long endTime) {
        if (StrPlusKit.isEmpty(type)) {
            return Attendance.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Attendance.SQL_FROM + "where time > ? and time < ? and studentId = ?" + Common.ORDER_BY_ID_DESC, startTime, endTime, studentId);
        }
        return Attendance.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, Common.COMMON_SELECT, Attendance.SQL_FROM + "where time > ? and time < ? and studentId = ? and type = ?" + Common.ORDER_BY_ID_DESC, startTime, endTime, studentId, type);
    }

    public Map<String, Long> getCountAttendanceByClassId(Integer classId, long startTime, long endTime) {
        List<Record> records = new ArrayList<>();
        if (classId > 0)
            records = Db.find("select type,count(*) as count " + Attendance.SQL_FROM + Common.SQL_WHERE + "time > ? and time < ? and classId = ? group by type", startTime, endTime, classId);
        else
            records = Db.find("select type,count(*) as count " + Attendance.SQL_FROM + Common.SQL_WHERE + "time > ? and time < ? group by type", startTime, endTime);
        Map<String, Long> map = new HashMap<>();
        for (Record record : records) {
            map.put(record.getStr("type"), record.getLong("count"));
        }
        return map;
    }

    public Map<String, Long> getCountAttendanceByStudentId(Integer studentId, long startTime, long endTime) {
        List<Record> records = Db.find("select type,count(*) as count " + Attendance.SQL_FROM + Common.SQL_WHERE + "time > ? and time < ? and studentId = ? group by type", startTime, endTime, studentId);
        Map<String, Long> map = new HashMap<>();
        for (Record record : records) {
            map.put(record.getStr("type"), record.getLong("count"));
        }
        return map;
    }
}
