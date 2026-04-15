package com.emp.main;

import com.emp.service.EmployeeService;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.beans.factory.BeanFactory;

public class MainApp {

    public static void main(String[] args) {

        System.out.println("🚀 Starting Spring Employee Management System...\n");

        // BeanFactory via ClassPathXmlApplicationContext (IoC Container)
        BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Spring injects EmployeeService (with its dependencies) automatically
        EmployeeService service = factory.getBean(EmployeeService.class);

        // ── Add Employees ──────────────────────────────────────────────
        service.addEmployee(101, "Alice Johnson",  "Engineering", 75000);
        service.addEmployee(102, "Bob Smith",      "Marketing",   55000);
        service.addEmployee(103, "Carol Williams", "HR",          60000);
        service.addEmployee(104, "David Lee",      "Engineering", 80000);

        // ── Display All ────────────────────────────────────────────────
        service.displayAllEmployees();

        // ── Search by ID ───────────────────────────────────────────────
        System.out.println("\n🔎 Searching for Employee ID 102:");
        service.displayEmployee(102);

        System.out.println("\n🔎 Searching for Employee ID 999 (not exists):");
        service.displayEmployee(999);

        // ── Delete Employee ────────────────────────────────────────────
        System.out.println("\n❌ Deleting Employee ID 103:");
        service.removeEmployee(103);

        // ── Display All After Deletion ─────────────────────────────────
        service.displayAllEmployees();

        System.out.println("\n✅ Done.");

        // Close context
        ((ClassPathXmlApplicationContext) factory).close();
    }
}