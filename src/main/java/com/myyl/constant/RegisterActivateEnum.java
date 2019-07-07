package com.myyl.constant;

public enum RegisterActivateEnum {

    NOT_ACTIVATED(1),ACTIVATED(0);

    private int value;

    RegisterActivateEnum(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
