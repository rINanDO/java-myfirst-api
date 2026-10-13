package com.rinando.myfirstapi;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class HelloController {
    record HelloResponse(String message) {
    }

    @GetMapping("/hello")
    public HelloResponse hello() {
        return new HelloResponse("Hello, world");
    }
}
