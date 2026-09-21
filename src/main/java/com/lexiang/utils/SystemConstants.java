package com.lexiang.utils;

public class SystemConstants {

    public static final String IMAGE_UPLOAD_DIR = java.nio.file.Paths.get(
            System.getProperty("lexiang.upload-dir", "frontend/html/lexiang/imgs"))
            .toAbsolutePath().normalize().toString();

    public static final String USER_NICK_NAME_PREFIX = "user_";

    public static final int DEFAULT_PAGE_SIZE = 5;

    public static final int MAX_PAGE_SIZE = 10;
}
