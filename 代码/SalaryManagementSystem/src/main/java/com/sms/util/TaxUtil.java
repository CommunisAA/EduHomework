package com.sms.util;

import com.sms.entity.Tax;
import com.sms.service.impl.TaxServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TaxUtil {
    @Autowired
    private TaxServiceImpl taxService;

    public float getTax(float totalSalary) {
        List taxList = taxService.list();
        float totalTax = 0f;
        Tax tax;
        for (Object t : taxList) {
            tax = (Tax) t;
            if (tax.getEnd() == -1) {
                totalTax = totalTax + (totalSalary - tax.getStart()) * tax.getRatio();
                break;
            }
            if (totalSalary > tax.getEnd()) {
                totalTax = totalTax + (tax.getEnd() - tax.getStart()) * tax.getRatio();
            } else {
                totalTax = totalTax + (totalSalary - tax.getStart()) * tax.getRatio();
                break;
            }
        }
        return totalTax;
    }
}
