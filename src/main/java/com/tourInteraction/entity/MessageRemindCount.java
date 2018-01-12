package com.tourInteraction.entity;

import java.io.Serializable;

public class MessageRemindCount implements Serializable{
    private String type;
    private int count;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
