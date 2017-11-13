package com.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping

@Controller
class TestController
{
    @RequestMapping("/main")
    fun main(): String
    {
        return "hello"
    }
}