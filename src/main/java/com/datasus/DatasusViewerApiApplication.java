package com.datasus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class DatasusViewerApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(DatasusViewerApiApplication.class, args);
    }

}
