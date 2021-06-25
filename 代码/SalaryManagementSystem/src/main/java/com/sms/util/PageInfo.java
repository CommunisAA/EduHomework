package com.sms.util;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

public class PageInfo {
    private long size;
    private long total;
    private long pages;
    private long current;
    private boolean hasPrevious;
    private boolean hasNext;
    private List records;

    public PageInfo(Page page) {
        size = page.getSize();
        total = page.getTotal();
        pages = page.getPages();
        current = page.getCurrent();
        hasPrevious = page.hasPrevious();
        hasNext = page.hasNext();
        records = page.getRecords();
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getPages() {
        return pages;
    }

    public void setPages(long pages) {
        this.pages = pages;
    }

    public long getCurrent() {
        return current;
    }

    public void setCurrent(long current) {
        this.current = current;
    }

    public boolean isHasPrevious() {
        return hasPrevious;
    }

    public void setHasPrevious(boolean hasPrevious) {
        this.hasPrevious = hasPrevious;
    }

    public boolean isHasNext() {
        return hasNext;
    }

    public void setHasNext(boolean hasNext) {
        this.hasNext = hasNext;
    }

    public List getRecords() {
        return records;
    }

    public void setRecords(List records) {
        this.records = records;
    }
}
