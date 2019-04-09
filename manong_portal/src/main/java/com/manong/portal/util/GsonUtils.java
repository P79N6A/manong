package com.manong.portal.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonUtils {

    private static Gson gson = null;

    static {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gson = gsonBuilder.create();
    }

    // 对象转json
    public static String toJson(Object object){
        return gson.toJson(object);
    }

    // json转对象
    public static <T> T fromJson(Class<T> clazz,String json){
        return  gson.fromJson(json,clazz);
    }

}
