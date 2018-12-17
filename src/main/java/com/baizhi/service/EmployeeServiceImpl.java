package com.baizhi.service;

import com.baizhi.entity.Employee;
import com.baizhi.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
@Service
public class EmployeeServiceImpl implements EmployeeService {


    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAllEmployee() {
        List<Employee> employees = employeeMapper.selectAll();
        return employees;

    }
}
