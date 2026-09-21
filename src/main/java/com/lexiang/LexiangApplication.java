package com.lexiang;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.lexiang.mapper")
@SpringBootApplication
public class LexiangApplication {

    public static void main(String[] args) {
        SpringApplication.run(LexiangApplication.class, args);
    }

}
