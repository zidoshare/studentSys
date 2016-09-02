package com.hudongwx.studentSys.util;

import com.jfinal.log.Log;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by wuhongxu on 2016/9/1 0001.
 */
public class IpKit {
    private Log LOGGER = Log.getLog(IpKit.class);
    public String getIp(HttpServletRequest request){
        String ret = request.getHeader("X-forwarded-for");

        if (StrPlusKit.isEmpty(ret)) {
            ret = request.getHeader("X-Real-IP");
        }

        if (StrPlusKit.isEmpty(ret)) {
            return request.getRemoteAddr();
        }

        return ret.split(",")[0];
    }
    public static boolean isIPv4(final String ip) {
        if (StrPlusKit.isBlank(ip)) {
            return false;
        }

        final String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
                + "(00?\\d|1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                + "(00?\\d|1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                + "(00?\\d|1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";

        final Pattern pattern = Pattern.compile(regex);
        final Matcher matcher = pattern.matcher(ip);

        return matcher.matches();
    }
}
