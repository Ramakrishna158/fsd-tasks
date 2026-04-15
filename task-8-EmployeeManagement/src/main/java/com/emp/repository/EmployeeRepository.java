package com.emp.repository;

import com.emp.model.Employee;
import org.springframework.stereotype.Component;

import java.util.*;

@Component  // Marks this class as a Spring Bean (IoC)
public class EmployeeRepository {

    // In-memory storage using a Map
    private Map<Integer, Employee> employeeStore = new HashMap<>();

    public void save(Employee employee) {
        employeeStore.put(employee.getId(), employee);
        System.out.println("✅ Saved: " + employee);
    }

    public Employee findById(int id) {
        return employeeStore.get(id);
    }

    public List<Employee> findAll() {
        return new ArrayList<>(employeeStore.values());
    }

    public void delete(int id) {
        Employee removed = employeeStore.remove(id);
        if (removed != null)
            System.out.println("🗑️  Deleted: " + removed);
        else
            System.out.println("⚠️  Employee ID " + id + " not found.");
    }
}