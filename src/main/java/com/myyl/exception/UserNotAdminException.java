package com.myyl.exception;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserNotAdminException extends RuntimeException{

    private int errorCode;

    private ResultCodeEnum resultCodeEnum;

    public UserNotAdminException() {
    }

    public UserNotAdminException(int errorCode) {
        this.errorCode =errorCode;
    }


    public UserNotAdminException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public UserNotAdminException(ResultCodeEnum resultCodeEnum){
        this(resultCodeEnum.getResultCode(), resultCodeEnum.getResultMessage());
        this.resultCodeEnum = resultCodeEnum;

    }

}
