package com.myyl.exception;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CaptchaErrorException extends RuntimeException {


    private int errorCode;

    private ResultCodeEnum resultCodeEnum;

    public CaptchaErrorException() {
    }

    public CaptchaErrorException(int errorCode) {
        this.errorCode =errorCode;
    }


    public CaptchaErrorException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public CaptchaErrorException(ResultCodeEnum resultCodeEnum){
        this(resultCodeEnum.getResultCode(), resultCodeEnum.getResultMessage());
        this.resultCodeEnum = resultCodeEnum;

    }

}
