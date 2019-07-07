package com.myyl.pojo;

import java.io.Serializable;

/**
 * comment
 * @author 
 */
public class Comment implements Serializable {
    private String comid;

    private String qid;

    private String content;

    private Integer likenum;

    private String uid;

    private String reuid;

    private String remark;

    private static final long serialVersionUID = 1L;

    public String getComid() {
        return comid;
    }

    public void setComid(String comid) {
        this.comid = comid;
    }

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getLikenum() {
        return likenum;
    }

    public void setLikenum(Integer likenum) {
        this.likenum = likenum;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getReuid() {
        return reuid;
    }

    public void setReuid(String reuid) {
        this.reuid = reuid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
        Comment other = (Comment) that;
        return (this.getComid() == null ? other.getComid() == null : this.getComid().equals(other.getComid()))
            && (this.getQid() == null ? other.getQid() == null : this.getQid().equals(other.getQid()))
            && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()))
            && (this.getLikenum() == null ? other.getLikenum() == null : this.getLikenum().equals(other.getLikenum()))
            && (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
            && (this.getReuid() == null ? other.getReuid() == null : this.getReuid().equals(other.getReuid()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getComid() == null) ? 0 : getComid().hashCode());
        result = prime * result + ((getQid() == null) ? 0 : getQid().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        result = prime * result + ((getLikenum() == null) ? 0 : getLikenum().hashCode());
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getReuid() == null) ? 0 : getReuid().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", comid=").append(comid);
        sb.append(", qid=").append(qid);
        sb.append(", content=").append(content);
        sb.append(", likenum=").append(likenum);
        sb.append(", uid=").append(uid);
        sb.append(", reuid=").append(reuid);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}