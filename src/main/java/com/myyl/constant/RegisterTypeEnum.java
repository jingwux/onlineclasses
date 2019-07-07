package com.myyl.constant;

public enum RegisterTypeEnum {

    REGISTER_BY_EMAIL("0"),REGISTER_BY_TEL("1");

    private String type;

    RegisterTypeEnum(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
