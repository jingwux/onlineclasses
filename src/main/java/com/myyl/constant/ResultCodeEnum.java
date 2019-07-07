package com.myyl.constant;


public enum ResultCodeEnum {

    FAILED(999, "失败"),
    ERROR_CAPTCHA(900, "验证码错误"),
    COURSE_ERROR(20,"课程信息不存在"),
    USER_NOT_ADMIN(6,"管理员信息不存在或账户密码错误"),
    USER_ACTIVATED(5,"用户已激活，请登录即可"),
    USER_INSERT_ERROR(4,"用户信息写入失败"),
    USER_ALREADY_EXIST(3, "账户已存在"),
    USER_ERROR(2, "用户不存在或账户密码错误"),
    EMPTY_INPUT(1, "输入信息不能为空"),
    SUCCESS(0, "成功"),
    UNKNOWN_ERROR(-1, "未知错误");

    private int resultCode;
    private String resultMessage;


    ResultCodeEnum(int resultCode, String resultMessage) {
        this.resultCode = resultCode;
        this.resultMessage = resultMessage;
    }

    public int getResultCode() {
        return resultCode;
    }

    public void setResultCode(int resultCode) {
        this.resultCode = resultCode;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }




}
