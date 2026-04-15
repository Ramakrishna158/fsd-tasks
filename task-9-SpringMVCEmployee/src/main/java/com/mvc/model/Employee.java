package com.mvc.model;

public class Employee {
    private int id;
    private String name;
    private String department;
    private String email;
    private double salary;

    public Employee(int id, String name, String department, String email, double salary) {
        this.id = id;
        this.name = name;
        this.department = department;
        this.email = email;
        this.salary = salary;
    }

    // Getters
    public int    getId()         { return id; }
    public String getName()       { return name; }
    public String getDepartment() { return department; }
    public String getEmail()      { return email; }
    public double getSalary()     { return salary; }
}