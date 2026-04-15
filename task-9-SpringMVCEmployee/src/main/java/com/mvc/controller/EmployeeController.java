package com.mvc.controller;

import com.mvc.model.Employee;
import com.mvc.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller  // Marks as Spring MVC Controller
public class EmployeeController {

    @Autowired  // DI — Spring injects EmployeeService
    private EmployeeService employeeService;

    // HOME PAGE
    // URL: http://localhost:8080/SpringMVCEmployee/
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "Welcome to Employee Management System");
        return "home";  // → /WEB-INF/views/home.jsp
    }

    // LIST ALL EMPLOYEES
    // URL: http://localhost:8080/SpringMVCEmployee/employees
    @GetMapping("/employees")
    public String listEmployees(Model model) {
        model.addAttribute("employees", employeeService.getAllEmployees());
        return "employeeList";  // → /WEB-INF/views/employeeList.jsp
    }

    // VIEW SINGLE EMPLOYEE DETAIL
    // URL: http://localhost:8080/SpringMVCEmployee/employee/101
    @GetMapping("/employee/{id}")
    public String employeeDetail(@PathVariable int id, Model model) {
        Employee emp = employeeService.getEmployeeById(id);
        if (emp != null) {
            model.addAttribute("employee", emp);
            return "employeeDetail";  // → /WEB-INF/views/employeeDetail.jsp
        } else {
            model.addAttribute("error", "Employee with ID " + id + " not found!");
            return "home";
        }
    }
}