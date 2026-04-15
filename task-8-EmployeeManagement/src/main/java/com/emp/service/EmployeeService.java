package com.emp.service;

import com.emp.model.Employee;
import com.emp.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component  // Spring-managed bean
public class EmployeeService {

    @Autowired  // Dependency Injection — Spring injects EmployeeRepository automatically
    private EmployeeRepository employeeRepository;

    public void addEmployee(int id, String name, String dept, double salary) {
        Employee emp = new Employee(id, name, dept, salary);
        employeeRepository.save(emp);
    }

    public void displayEmployee(int id) {
        Employee emp = employeeRepository.findById(id);
        if (emp != null)
            System.out.println("🔍 Found: " + emp);
        else
            System.out.println("⚠️  No employee with ID: " + id);
    }

    public void displayAllEmployees() {
        List<Employee> list = employeeRepository.findAll();
        if (list.isEmpty()) {
            System.out.println("📭 No employees found.");
        } else {
            System.out.println("\n📋 All Employees:");
            System.out.println("─".repeat(60));
            list.forEach(System.out::println);
            System.out.println("─".repeat(60));
        }
    }

    public void removeEmployee(int id) {
        employeeRepository.delete(id);
    }
}