package com.myyl.exception;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserInsertException extends RuntimeException{

    private int errorCode;

    private ResultCodeEnum resultCodeEnum;

    public UserInsertException() {
    }

    public UserInsertException(int errorCode) {
        this.errorCode =errorCode;
    }


    public UserInsertException(int errorCode,String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public UserInsertException(ResultCodeEnum resultCodeEnum){
        this(resultCodeEnum.getResultCode(), resultCodeEnum.getResultMessage());
        this.resultCodeEnum = resultCodeEnum;

    }

}
