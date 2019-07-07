package com.myyl.pojo;

import java.io.Serializable;

/**
 * course
 * @author
 */
public class Course implements Serializable {
    private String cid;

    private String cname;

    private String uid;

    private String startime;

    private String updatetime;

    private String intro;

    private String content;

    private String typeid;

    private String courseimg;

    private String files;

    private String total;

    private Integer accessnum;

    private String remark;

    private Integer status;

    private static final long serialVersionUID = 1L;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getStartime() {
        return startime;
    }

    public void setStartime(String startime) {
        this.startime = startime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTypeid() {
        return typeid;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }

    public String getCourseimg() {
        return courseimg;
    }

    public void setCourseimg(String courseimg) {
        this.courseimg = courseimg;
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public Integer getAccessnum() {
        return accessnum;
    }

    public void setAccessnum(Integer accessnum) {
        this.accessnum = accessnum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Course other = (Course) that;
        return (this.getCid() == null ? other.getCid() == null : this.getCid().equals(other.getCid()))
                && (this.getCname() == null ? other.getCname() == null : this.getCname().equals(other.getCname()))
                && (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
                && (this.getStartime() == null ? other.getStartime() == null : this.getStartime().equals(other.getStartime()))
                && (this.getUpdatetime() == null ? other.getUpdatetime() == null : this.getUpdatetime().equals(other.getUpdatetime()))
                && (this.getIntro() == null ? other.getIntro() == null : this.getIntro().equals(other.getIntro()))
                && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()))
                && (this.getTypeid() == null ? other.getTypeid() == null : this.getTypeid().equals(other.getTypeid()))
                && (this.getCourseimg() == null ? other.getCourseimg() == null : this.getCourseimg().equals(other.getCourseimg()))
                && (this.getFiles() == null ? other.getFiles() == null : this.getFiles().equals(other.getFiles()))
                && (this.getTotal() == null ? other.getTotal() == null : this.getTotal().equals(other.getTotal()))
                && (this.getAccessnum() == null ? other.getAccessnum() == null : this.getAccessnum().equals(other.getAccessnum()))
                && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
                && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCid() == null) ? 0 : getCid().hashCode());
        result = prime * result + ((getCname() == null) ? 0 : getCname().hashCode());
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getStartime() == null) ? 0 : getStartime().hashCode());
        result = prime * result + ((getUpdatetime() == null) ? 0 : getUpdatetime().hashCode());
        result = prime * result + ((getIntro() == null) ? 0 : getIntro().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        result = prime * result + ((getTypeid() == null) ? 0 : getTypeid().hashCode());
        result = prime * result + ((getCourseimg() == null) ? 0 : getCourseimg().hashCode());
        result = prime * result + ((getFiles() == null) ? 0 : getFiles().hashCode());
        result = prime * result + ((getTotal() == null) ? 0 : getTotal().hashCode());
        result = prime * result + ((getAccessnum() == null) ? 0 : getAccessnum().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", cid=").append(cid);
        sb.append(", cname=").append(cname);
        sb.append(", uid=").append(uid);
        sb.append(", startime=").append(startime);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", intro=").append(intro);
        sb.append(", content=").append(content);
        sb.append(", typeid=").append(typeid);
        sb.append(", courseimg=").append(courseimg);
        sb.append(", files=").append(files);
        sb.append(", total=").append(total);
        sb.append(", accessnum=").append(accessnum);
        sb.append(", remark=").append(remark);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}