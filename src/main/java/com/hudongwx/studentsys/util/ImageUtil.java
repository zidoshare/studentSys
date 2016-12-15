package com.hudongwx.studentsys.util;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by wu on 2016/12/14.
 */
public class ImageUtil {
    public static void deleteExtraImageFile(String idNumber) {
        if (idNumber == null)
            return;
        List<File> files = getExtraImageFileByIdNumber(idNumber);
        for (File file : files) {
            file.delete();
        }
    }

    public static List<File> getExtraImageFileByIdNumber(String idNumber) {
        List<File> fileList = new ArrayList<>();
        if (idNumber == null)
            return fileList;
        final String fileName = idNumber + ".*";
        File path = new File(Common.PHOTO_URL_PATH);
        String[] list;
        list = path.list(new FilenameFilter() {
            private Pattern pattern = Pattern.compile(fileName);

            @Override
            public boolean accept(File dir, String name) {
                return pattern.matcher(name).matches();
            }
        });
        Arrays.sort(list, String.CASE_INSENSITIVE_ORDER);
        for (String dirItem : list) {
            if (!dirItem.matches(idNumber + "\\..*")) {
                File file = new File(Common.PHOTO_URL_PATH + dirItem);
                fileList.add(file);
            }
        }
        return fileList;
    }

    public static File getImageFileByIdNumber(String idNumber) {
        File file;
        if (idNumber == null)
            return null;
        final String fileName = idNumber + "\\..*";
        File path = new File(Common.PHOTO_URL_PATH);
        String[] list;
        list = path.list(new FilenameFilter() {
            private Pattern pattern = Pattern.compile(fileName);

            @Override
            public boolean accept(File dir, String name) {
                return pattern.matcher(name).matches();
            }
        });
        Arrays.sort(list, String.CASE_INSENSITIVE_ORDER);
        if(list.length==0)
            return null;
        file =new File(Common.PHOTO_URL_PATH+list[0]);
        return file;
    }
}
