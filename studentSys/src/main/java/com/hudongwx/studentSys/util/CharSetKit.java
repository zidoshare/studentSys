package com.hudongwx.studentSys.util;

/**
 * Created by wuhongxu on 2016/9/2 0002.
 */
public class CharSetKit {
    public static CharSet evaluateSet(String[] set) {
        return set == null?null:new CharSet(set);
    }

    public static String squeeze(String str, String set) {
        if(!StrPlusKit.isEmpty(str) && !StrPlusKit.isEmpty(set)) {
            String[] strs = new String[]{set};
            return squeeze(str, strs);
        } else {
            return str;
        }
    }

    public static String squeeze(String str, String[] set) {
        if(!StrPlusKit.isEmpty(str) && !ArrayKit.isEmpty(set)) {
            CharSet chars = CharSet.getInstance(set);
            StringBuffer buffer = new StringBuffer(str.length());
            char[] chrs = str.toCharArray();
            int sz = chrs.length;
            char lastChar = 32;
            boolean ch = true;

            for(int i = 0; i < sz; ++i) {
                char var9 = chrs[i];
                if(!chars.contains(var9) || var9 != lastChar || i == 0) {
                    buffer.append(var9);
                    lastChar = var9;
                }
            }

            return buffer.toString();
        } else {
            return str;
        }
    }

    public static int count(String str, String set) {
        if(!StrPlusKit.isEmpty(str) && !StrPlusKit.isEmpty(set)) {
            String[] strs = new String[]{set};
            return count(str, strs);
        } else {
            return 0;
        }
    }

    public static int count(String str, String[] set) {
        if(!StrPlusKit.isEmpty(str) && !ArrayKit.isEmpty(set)) {
            CharSet chars = CharSet.getInstance(set);
            int count = 0;
            char[] chrs = str.toCharArray();
            int sz = chrs.length;

            for(int i = 0; i < sz; ++i) {
                if(chars.contains(chrs[i])) {
                    ++count;
                }
            }

            return count;
        } else {
            return 0;
        }
    }

    public static String keep(String str, String set) {
        if(str == null) {
            return null;
        } else if(str.length() != 0 && !StrPlusKit.isEmpty(set)) {
            String[] strs = new String[]{set};
            return keep(str, strs);
        } else {
            return "";
        }
    }

    public static String keep(String str, String[] set) {
        return str == null?null:(str.length() != 0 && !ArrayKit.isEmpty(set)?modify(str, set, true):"");
    }
    public static String delete(String str, String set) {
        if(!StrPlusKit.isEmpty(str) && !StrPlusKit.isEmpty(set)) {
            String[] strs = new String[]{set};
            return delete(str, strs);
        } else {
            return str;
        }
    }
    public static String delete(String str, String[] set) {
        return !StrPlusKit.isEmpty(str) && !ArrayKit.isEmpty(set)?modify(str, set, false):str;
    }
    private static String modify(String str, String[] set, boolean expect) {
        CharSet chars = CharSet.getInstance(set);
        StringBuffer buffer = new StringBuffer(str.length());
        char[] chrs = str.toCharArray();
        int sz = chrs.length;

        for(int i = 0; i < sz; ++i) {
            if(chars.contains(chrs[i]) == expect) {
                buffer.append(chrs[i]);
            }
        }

        return buffer.toString();
    }
    public static String translate(String str, String searchChars, String replaceChars) {
        if(StrPlusKit.isEmpty(str)) {
            return str;
        } else {
            StringBuffer buffer = new StringBuffer(str.length());
            char[] chrs = str.toCharArray();
            char[] withChrs = replaceChars.toCharArray();
            int sz = chrs.length;
            int withMax = replaceChars.length() - 1;

            for(int i = 0; i < sz; ++i) {
                int idx = searchChars.indexOf(chrs[i]);
                if(idx != -1) {
                    if(idx > withMax) {
                        idx = withMax;
                    }

                    buffer.append(withChrs[idx]);
                } else {
                    buffer.append(chrs[i]);
                }
            }

            return buffer.toString();
        }
    }
}
