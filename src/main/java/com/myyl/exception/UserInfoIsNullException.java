package com.myyl.exception;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserInfoIsNullException extends RuntimeException {

    private int errorCode;

    private ResultCodeEnum resultCodeEnum;

    public UserInfoIsNullException() {
    }

    public UserInfoIsNullException(int errorCode) {
        this.errorCode = errorCode;
    }


    public UserInfoIsNullException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public UserInfoIsNullException(ResultCodeEnum resultCodeEnum) {
        this(resultCodeEnum.getResultCode(), resultCodeEnum.getResultMessage());
        this.resultCodeEnum = resultCodeEnum;
    }

}
