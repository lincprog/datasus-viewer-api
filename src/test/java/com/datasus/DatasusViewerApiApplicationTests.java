package com.datasus;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DatasusViewerApiApplicationTests {

    @Test
    public void contextLoads() {
        BCryptPasswordEncoder test = new BCryptPasswordEncoder();
        System.out.println(test.encode("12345"));
    }

}
