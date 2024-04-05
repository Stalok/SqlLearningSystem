package org.derrick.sqllearningsystem.entity;

public class ResultUtil {


    public static <T> Result<T> success(T data) {
        return new Result<>(ResultEnum.SUCCESS.ordinal(), "success", data);
    }

    public static <T> Result<T> fail(String msg) {
        return new Result<>(ResultEnum.FAIL.ordinal(), msg, null);
    }

    public static <T> Result<T> notFound(String msg, T data){
        return new Result<>(ResultEnum.NOT_FOUND.ordinal(), msg, data);
    }

    public static <T> Result<T> internalServerError(String msg, T data){
        return new Result<>(ResultEnum.INTERNAL_SERVER_ERROR.ordinal(), msg, data);
    }

    public static <T> Result<T> other(int code, String msg, T data){
        return new Result<>(code, msg, data);
    }

}
