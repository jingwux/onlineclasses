package com.myyl.pojo;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public class Coursetype {
    private String typeid;

    private String ctname;

    private String partype;

    private String remark;

    public String getTypeid() {
        return typeid;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid == null ? null : typeid.trim();
    }

    public String getCtname() {
        return ctname;
    }

    public void setCtname(String ctname) {
        this.ctname = ctname == null ? null : ctname.trim();
    }

    public String getPartype() {
        return partype;
    }

    public void setPartype(String partype) {
        this.partype = partype == null ? null : partype.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        return "Coursetype{" +
                "typeid='" + typeid + '\'' +
                ", ctname='" + ctname + '\'' +
                ", partype='" + partype + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}