package com.myyl.exception;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CourseNotExistException extends RuntimeException{

    private int errorCode;

    private ResultCodeEnum resultCodeEnum;

    public CourseNotExistException() {
    }

    public CourseNotExistException(int errorCode) {
        this.errorCode =errorCode;
    }


    public CourseNotExistException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public CourseNotExistException(ResultCodeEnum resultCodeEnum){
        this(resultCodeEnum.getResultCode(), resultCodeEnum.getResultMessage());
        this.resultCodeEnum = resultCodeEnum;

    }

}
