package com.docker.attempt.attemp2;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/home")
public class Home {
    @GetMapping("/hello")
    public String getHello(){
        return "this is why docker is awesome";
    }
}
