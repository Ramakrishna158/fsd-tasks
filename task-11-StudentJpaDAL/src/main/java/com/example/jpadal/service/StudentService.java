package com.example.jpadal.service;

import com.example.jpadal.entity.Student;
import com.example.jpadal.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository repository;

    public List<Student> getByDepartment(String dept) {
        return repository.findByDepartment(dept);
    }

    public List<Student> getByAge(int age) {
        return repository.findByAgeGreaterThan(age);
    }

    public List<Student> getByDeptAndAge(String dept, int age) {
        return repository.findByDepartmentAndAgeGreaterThan(dept, age);
    }

    public Page<Student> getStudentsWithPagination(String dept, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("age").descending());
        return repository.findByDepartment(dept, pageable);
    }
}