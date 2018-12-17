package com.baizhi.controller;

import com.baizhi.entity.Employee;
import com.baizhi.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("employee")
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("queryAll")
    public String QueryAll(HttpServletRequest request) {
        List<Employee> list = employeeService.getAllEmployee();
        request.setAttribute("list", list);
        return "emplist";
    }


}
