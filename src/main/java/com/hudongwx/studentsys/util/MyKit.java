package com.hudongwx.studentsys.util;/**
 * Created by wu on 2016/12/22.
 */

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 开发公司：hudongwx.com<br/>
 * 版权：294786949@qq.com<br/>
 * <p>
 *
 * @author wu
 * @version 1.0, 2016/12/22 0016 <br/>
 * @desc <p>
 * <p>
 * 创建　wu　2016/12/22 0016　<br/>
 * <p>
 * 個人工具
 * <p>
 * @email 294786949@qq.com
 */
public class MyKit {
    public static boolean isNumber(String idNumber) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(idNumber);
        return isNum.matches();
    }
}
