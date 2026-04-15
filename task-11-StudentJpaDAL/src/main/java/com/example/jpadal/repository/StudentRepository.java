package com.example.jpadal.repository;

import com.example.jpadal.entity.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Long> {

    // Custom methods
    List<Student> findByDepartment(String department);

    List<Student> findByAgeGreaterThan(int age);

    List<Student> findByDepartmentAndAgeGreaterThan(String department, int age);

    // Pagination + Sorting
    Page<Student> findByDepartment(String department, Pageable pageable);
}