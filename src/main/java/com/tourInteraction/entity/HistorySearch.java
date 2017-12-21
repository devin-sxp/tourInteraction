package com.tourInteraction.entity;

import java.io.Serializable;

public class HistorySearch implements Serializable{
    private String hitorySearchValue;
    private int hitorySearchCount;

    public String getHitorySearchValue() {
        return hitorySearchValue;
    }

    public void setHitorySearchValue(String hitorySearchValue) {
        this.hitorySearchValue = hitorySearchValue;
    }

    public int getHitorySearchCount() {
        return hitorySearchCount;
    }

    public void setHitorySearchCount(int hitorySearchCount) {
        this.hitorySearchCount = hitorySearchCount;
    }
}
