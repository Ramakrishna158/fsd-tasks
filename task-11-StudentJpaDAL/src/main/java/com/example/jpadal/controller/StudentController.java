package com.example.jpadal.controller;

import com.example.jpadal.entity.Student;
import com.example.jpadal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService service;

    @GetMapping("/department/{dept}")
    public List<Student> getByDepartment(@PathVariable String dept) {
        return service.getByDepartment(dept);
    }

    @GetMapping("/age/{age}")
    public List<Student> getByAge(@PathVariable int age) {
        return service.getByAge(age);
    }

    @GetMapping("/filter")
    public List<Student> getByDeptAndAge(@RequestParam String dept,
                                         @RequestParam int age) {
        return service.getByDeptAndAge(dept, age);
    }

    @GetMapping("/page")
    public Page<Student> getWithPagination(@RequestParam String dept,
                                           @RequestParam int page,
                                           @RequestParam int size) {
        return service.getStudentsWithPagination(dept, page, size);
    }
}