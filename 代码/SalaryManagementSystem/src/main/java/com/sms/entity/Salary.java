package com.sms.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author w
 * @since 2020-12-01
 */
public class Salary implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("Id")
    private String id;

    @TableField("PostSalary")
    private Float postsalary = 0f;

    @TableField("ScaleSalary")
    private Float scalesalary = 0f;

    @TableField("Allowance")
    private Float allowance = 0f;

    @TableField("PerformanceSalary")
    private Float performancesalary = 0f;

    @TableField("TotalSalary")
    private Float totalsalary = 0f;

    @TableField("Tax")
    private Float tax = 0f;

    @TableField("Salary")
    private Float salary = 0f;


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
        totalsalary = postsalary + scalesalary + allowance + performancesalary;
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

    @Override
    public String toString() {
        return "Salary{" +
        "id=" + id +
        ", postsalary=" + postsalary +
        ", scalesalary=" + scalesalary +
        ", allowance=" + allowance +
        ", performancesalary=" + performancesalary +
        ", totalsalary=" + totalsalary +
        ", tax=" + tax +
        ", salary=" + salary +
        "}";
    }

    public Salary calculate(float tax) {
        totalsalary = postsalary + scalesalary + allowance + performancesalary;
        this.tax = tax;
        salary = totalsalary - tax;
        return this;
    }
}
