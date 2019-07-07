package com.myyl.exception;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserActivatedException extends RuntimeException{

    private int errorCode;

    private ResultCodeEnum resultCodeEnum;

    public UserActivatedException() {
    }

    public UserActivatedException(int errorCode) {
        this.errorCode =errorCode;
    }


    public UserActivatedException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public UserActivatedException(ResultCodeEnum resultCodeEnum){
        this(resultCodeEnum.getResultCode(), resultCodeEnum.getResultMessage());
        this.resultCodeEnum = resultCodeEnum;

    }

}
