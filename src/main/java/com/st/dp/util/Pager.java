package com.st.dp.util;

public class Pager {

    private Integer     pageIndex = 1;
    private Integer     pageLimit = 10;
    private Integer     rowStart;
    private Integer     rowCount;
    private boolean pageOn    = false;
    private String  orderby;

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageLimit() {
        return pageLimit;
    }

    public void setPageLimit(Integer pageLimit) {
        this.pageLimit = pageLimit;
    }

    public Integer getRowStart() {
        rowStart = (pageIndex - 1) * pageLimit;
        return rowStart;
    }

    public void setRowStart(Integer rowStart) {
        this.rowStart = rowStart;
    }

    public Integer getRowCount() {
        return rowCount;
    }

    public void setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
    }

    public boolean isPageOn() {
        return pageOn;
    }

    public void setPageOn(boolean pageOn) {
        this.pageOn = pageOn;
    }

    public String getOrderby() {
        return orderby;
    }

    public void setOrderby(String orderby) {
        this.orderby = orderby;
    }

}
