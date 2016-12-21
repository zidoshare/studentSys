package com.hudongwx.studentsys.util;

import com.hudongwx.studentsys.model.Student;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wu on 2016/10/10.
 */
public class ExcelUtil {
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

    public static List<Student> ReadStudentInfoFromExcel(String filePath) {
        File file = new File(filePath); // 创建文件对象
        List<Student> slist = paraExcel(file);
        return slist;
    }

    public static List<Student> paraExcel(File file) {
        List<Student> slist = new ArrayList<>();
        try {
            Workbook wb = Workbook.getWorkbook(file); // 从文件流中获取Excel工作区对象（WorkBook）
            Sheet sheet = wb.getSheet(0); // 从工作区中取得页（Sheet）
            for (int i = 2; i < sheet.getRows(); i++) { // 循环打印Excel表中的内容
                Student s = new Student();
                for (int j = 0; j < sheet.getColumns(); j++) {
                    Cell cell = sheet.getCell(j, i);
                    switch (j) {
                        case 0:
                            s.setClassName(cell.getContents());
                            break;
                        case 1:
                            s.setName(cell.getContents());
                            break;
                        case 2:
                            s.setSex(cell.getContents());
                            break;
                        case 3:
                            Date bd;
                            try {
                                bd = sdf.parse(cell.getContents());
                            } catch (Exception e) {
                                s.setRemark("生日日期格式错误！");
                                break;
                            }
                            s.setBirthday(bd.getTime());
                            break;
                        case 4:
                            s.setIdNumber(cell.getContents());
                            break;
                        case 5:
                            s.setContactInformation(cell.getContents());
                            break;
                        case 6:
                            s.setQq(cell.getContents());
                            break;
                        case 7:
                            s.setEmail(cell.getContents());
                            break;
                        case 8:
                            s.setEmergencyContact(cell.getContents());
                            break;
                        case 9:
                            s.setPermanentAddress(cell.getContents());
                            break;
                        case 10:
                            s.setPresentAddress(cell.getContents());
                            break;
                        case 11:
                            s.setEducationBackground(cell.getContents());
                            break;
                        case 12:
                            s.setMajor(cell.getContents());
                            break;
                        case 13:
                            s.setCollege(cell.getContents());
                            break;
                        case 14:
                            Date gt;
                            try {
                                gt = sdf.parse(cell.getContents());
                            } catch (Exception e) {
                                s.setRemark("毕业日期格式错误！");
                                break;
                            }
                            s.setGraduationTime(gt.getTime());
                            break;
                        case 15:
                            s.setCounselorName(cell.getContents());
                            break;
                        case 16:
                            s.setSubject(cell.getContents());
                            break;
                        case 17:
                            s.setPaymentMethod(cell.getContents());
                            break;
                        case 18:
                            String t = cell.getContents();
                            if (t == null || t.equals(""))
                                t = "0";
                            s.setTuition(new BigDecimal(t));
                            break;
                        case 19:
                            Date frt;
                            try {
                                frt = sdf.parse(cell.getContents());
                            } catch (Exception e) {
                                s.setRemark("首还款日日期格式错误！");
                                break;
                            }
                            if (s.getPaymentMethod().equals("现金"))
                                s.setStudentRepaymentTime(null);
                            s.setFirstRepaymentTime(frt.getTime());
                            break;
                        case 20:
                            Date srt;
                            try {
                                srt = sdf.parse(cell.getContents());
                            } catch (Exception e) {
                                s.setRemark("学生还款日期格式错误！");
                                break;
                            }
                            if (s.getPaymentMethod().equals("现金"))
                                s.setStudentRepaymentTime(null);
                            s.setStudentRepaymentTime(srt.getTime());
                            break;
                        case 21:
                            String rsa = cell.getContents();
                            if (rsa == null || rsa.equals("") || s.getPaymentMethod().equals("现金"))
                                rsa = "0";
                            s.setResidualSubsidyAmount(new BigDecimal(rsa));
                            break;
                        case 22:
                            String rf = cell.getContents();
                            if (rf == null || rf.equals("") || s.getPaymentMethod().equals("现金"))
                                rf = "0";
                            s.setResidualFrequency(Integer.valueOf(rf));
                            break;
                        case 23:
                            s.setBankCard(cell.getContents());
                            break;
                        case 24:
                            s.setBankName(cell.getContents());
                            break;
                        case 25:
                            String rm = cell.getContents();
                            if (rm == null || rm.equals("")) {
                                s.setRemark(s.getRemark());
                            }
                            s.setRemark(rm);
                            break;
                    }
                }
                if (s.getClassName() == null || s.getClassName().equals(""))
                    continue;
                slist.add(s);
            }
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return slist;
    }

}
