package com.sms.model;

import com.sms.entity.Employee;
import com.sms.entity.Salary;
import com.sms.entity.User;

import java.io.Serializable;

public class EmployeeInfo implements Serializable {
    private User user;
    private Employee employee;
    private Salary salary;

    public EmployeeInfo() {

    }

    public EmployeeInfo(User user, Employee employee, Salary salary) {
        this.user = user;
        this.employee = employee;
        this.salary = salary;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Salary getSalary() {
        return salary;
    }

    public void setSalary(Salary salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "EmployeeInfo{" +
                "user=" + user +
                ", employee=" + employee +
                ", salary=" + salary +
                '}';
    }
}
