package com.sms.entity;

import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author w
 * @since 2020-12-16
 */
public class SalaryHistory implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField("Id")
    private String id;

    @TableField("PostSalary")
    private Float postsalary;

    @TableField("ScaleSalary")
    private Float scalesalary;

    @TableField("Allowance")
    private Float allowance;

    @TableField("PerformanceSalary")
    private Float performancesalary;

    @TableField("TotalSalary")
    private Float totalsalary;

    @TableField("Tax")
    private Float tax;

    @TableField("Salary")
    private Float salary;

    @TableField("Date")
    private LocalDate date;

    public SalaryHistory() {
        this.id = "0";
        this.postsalary = 0.f;
        this.scalesalary = 0.f;
        this.allowance = 0.f;
        this.performancesalary = 0.f;
        this.totalsalary = 0.f;
        this.tax = 0.f;
        this.salary = 0.f;
        this.date = LocalDate.now();
    }

    public SalaryHistory(Salary salary) {
        this.id = salary.getId();
        this.postsalary = salary.getPostsalary();
        this.scalesalary = salary.getScalesalary();
        this.allowance = salary.getAllowance();
        this.performancesalary = salary.getPerformancesalary();
        this.totalsalary = salary.getTotalsalary();
        this.tax = salary.getTax();
        this.salary = salary.getSalary();
        this.date = LocalDate.now();
    }

    public SalaryHistory(Salary salary, LocalDate localDate) {
        this.id = salary.getId();
        this.postsalary = salary.getPostsalary();
        this.scalesalary = salary.getScalesalary();
        this.allowance = salary.getAllowance();
        this.performancesalary = salary.getPerformancesalary();
        this.totalsalary = salary.getTotalsalary();
        this.tax = salary.getTax();
        this.salary = salary.getSalary();
        this.date = localDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Float getPostsalary() {
        return postsalary;
    }

    public void setPostsalary(Float postsalary) {
        this.postsalary = postsalary;
    }

    public Float getScalesalary() {
        return scalesalary;
    }

    public void setScalesalary(Float scalesalary) {
        this.scalesalary = scalesalary;
    }

    public Float getAllowance() {
        return allowance;
    }

    public void setAllowance(Float allowance) {
        this.allowance = allowance;
    }

    public Float getPerformancesalary() {
        return performancesalary;
    }

    public void setPerformancesalary(Float performancesalary) {
        this.performancesalary = performancesalary;
    }

    public Float getTotalsalary() {
        return totalsalary;
    }

    public void setTotalsalary(Float totalsalary) {
        this.totalsalary = totalsalary;
    }

    public Float getTax() {
        return tax;
    }

    public void setTax(Float tax) {
        this.tax = tax;
    }

    public Float getSalary() {
        return salary;
    }

    public void setSalary(Float salary) {
        this.salary = salary;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "SalaryHistory{" +
        "id=" + id +
        ", postsalary=" + postsalary +
        ", scalesalary=" + scalesalary +
        ", allowance=" + allowance +
        ", performancesalary=" + performancesalary +
        ", totalsalary=" + totalsalary +
        ", tax=" + tax +
        ", salary=" + salary +
        ", date=" + date +
        "}";
    }
}
