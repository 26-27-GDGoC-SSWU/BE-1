package hello.hello_spring.controller;

import io.micrometer.observation.transport.Propagator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Stack;

@Controller
public class HelloController {

    @GetMapping("hello")
    public String hello(Model model) {
        model.addAttribute("data", "나애!!");
        return "hello";
    }

    // MVC: HTML 화면
    @GetMapping("hello-mvc")
    public String helloMvc(@RequestParam("name")String name,Model model) {
        model.addAttribute("name", name);
        return "hello-template";
    }

    //API - 문자: 글자 그대로
    @GetMapping("hello-string")
    @ResponseBody //http자체의 body에 넣어주겠다
    public String helloString(@RequestParam("name")String name) {
        return "hello " + name;
    }

    //API - 객체: JSON
    @GetMapping("hello-api")
    @ResponseBody
    public Hello helloApi(@RequestParam("name")String name) {
        Hello hello = new Hello();
        hello.setName(name);
        return hello;
    }

    static class Hello {
        private String name;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
        public int getAge() {
            return 20;
        }
    }

}