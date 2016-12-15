package com.hudongwx.studentsys.util;

import com.hudongwx.studentsys.model.Student;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
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
            for (int i = 1; i < sheet.getRows(); i++) { // 循环打印Excel表中的内容
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
                            Date bd = sdf.parse(cell.getContents());
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
                            Date gt = sdf.parse(cell.getContents());
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
                            s.setTuition(new BigDecimal(cell.getContents()));
                            break;
                        case 19:
                            Date frt = sdf.parse(cell.getContents());
                            s.setFirstRepaymentTime(frt.getTime());
                            break;
                        case 20:
                            Date srt = sdf.parse(cell.getContents());
                            s.setStudentRepaymentTime(srt.getTime());
                            break;
                        case 21:
                            s.setSubsidy(new BigDecimal(cell.getContents()));
                            break;
                        case 22:
                            s.setResidualFrequency(Integer.valueOf(cell.getContents()));
                            break;
                        case 23:
                            s.setBankCard(cell.getContents());
                            break;
                        case 24:
                            s.setBankName(cell.getContents());
                            break;
                        case 25:
                            s.setRemark(cell.getContents());
                            break;
                    }
                }
                slist.add(s);
            }
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return slist;
    }

}
