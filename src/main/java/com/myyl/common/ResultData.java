package com.myyl.common;

import com.myyl.constant.ResultCodeEnum;
import lombok.Data;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Data
public class ResultData {


    public static final boolean SUCCESS = true;

    public static final boolean NOT_SUCCESS = false;



    private boolean success = false;
    private int code;
    private String message;
    private Object data;

    public ResultData() {
    }

    public ResultData(boolean success, ResultCodeEnum resultCodeEnum, Object data) {
        this.success = success;
        this.code = resultCodeEnum.getResultCode();
        this.message = resultCodeEnum.getResultMessage();
        this.data = data;
    }
     public ResultData(boolean success, int code, String message, Object data) {
        this.success = success;
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ResultData(boolean success, ResultCodeEnum resultCodeEnum) {
        this.success = success;
        this.code = resultCodeEnum.getResultCode();
        this.message = resultCodeEnum.getResultMessage();
    }

    public ResultData(boolean success, Object data) {
        this.success = success;
        this.code = ResultCodeEnum.SUCCESS.getResultCode();
        this.message = ResultCodeEnum.SUCCESS.getResultMessage();
        this.data = data;

    }

    public ResultData(boolean success) {
        this.success = success;
    }

}
