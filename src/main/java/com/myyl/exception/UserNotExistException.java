package com.myyl.exception;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserNotExistException extends RuntimeException {


    private int errorCode;

    private ResultCodeEnum resultCodeEnum;

    public UserNotExistException() {
    }

    public UserNotExistException(int errorCode) {
        this.errorCode =errorCode;
    }


    public UserNotExistException(int errorCode,String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public UserNotExistException(ResultCodeEnum resultCodeEnum){
        this(resultCodeEnum.getResultCode(), resultCodeEnum.getResultMessage());
        this.resultCodeEnum = resultCodeEnum;

    }

}
