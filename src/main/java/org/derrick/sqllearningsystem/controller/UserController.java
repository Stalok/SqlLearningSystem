package org.derrick.sqllearningsystem.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
}
