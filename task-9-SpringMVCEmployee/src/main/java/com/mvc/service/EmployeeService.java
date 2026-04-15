package com.mvc.service;

import com.mvc.model.Employee;
import org.springframework.stereotype.Service;

import java.util.*;

@Service  // Spring-managed service bean
public class EmployeeService {

    // In-memory employee data store
    private static Map<Integer, Employee> employeeMap = new LinkedHashMap<>();

    static {
        employeeMap.put(101, new Employee(101, "Alice Johnson",  "Engineering", "alice@company.com",  75000));
        employeeMap.put(102, new Employee(102, "Bob Smith",      "Marketing",   "bob@company.com",    55000));
        employeeMap.put(103, new Employee(103, "Carol Williams", "HR",          "carol@company.com",  60000));
        employeeMap.put(104, new Employee(104, "David Lee",      "Engineering", "david@company.com",  80000));
        employeeMap.put(105, new Employee(105, "Eva Brown",      "Finance",     "eva@company.com",    70000));
    }

    public List<Employee> getAllEmployees() {
        return new ArrayList<>(employeeMap.values());
    }

    public Employee getEmployeeById(int id) {
        return employeeMap.get(id);
    }
}