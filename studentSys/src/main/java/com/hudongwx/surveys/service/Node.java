package com.hudongwx.surveys.service;

/**
 * Created by wuhongxu on 2016/9/9 0009.
 */
public class Node {
    public String name;
    public String code;
    public String ip;
    public String className;
    public Node() {
    }
    public Node(String name,String ip,String className){
        this.name = name;
        this.ip = ip;
        this.className = className;
    }

    public String getName() {
        return name;
    }

    public String getCode() {
        return code;
    }

    public String getIp() {
        return ip;
    }

    public String getClassName() {
        return className;
    }

    @Override
    public boolean equals(Object obj) {
        Node nd = (Node) obj;
        if (nd.name.equals(name) && nd.ip.equals(ip) && nd.className.equals(className))
            return true;
        return false;
    }
}
