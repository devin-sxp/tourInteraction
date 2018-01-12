package com.tourInteraction.entity;

import com.tourInteraction.entity.base.Base;

public class MessageRemind extends Base{
    private String type;
    private int remindLinkId;
    private String remindLinkTitle;
    private String remindPosition;
    private String targetUserId;
    private String userIconPath;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getRemindLinkId() {
        return remindLinkId;
    }

    public void setRemindLinkId(int remindLinkId) {
        this.remindLinkId = remindLinkId;
    }

    public String getRemindLinkTitle() {
        return remindLinkTitle;
    }

    public void setRemindLinkTitle(String remindLinkTitle) {
        this.remindLinkTitle = remindLinkTitle;
    }

    public String getRemindPosition() {
        return remindPosition;
    }

    public void setRemindPosition(String remindPosition) {
        this.remindPosition = remindPosition;
    }

    public String getTargetUserId() {
        return targetUserId;
    }

    public void setTargetUserId(String targetUserId) {
        this.targetUserId = targetUserId;
    }

    public String getUserIconPath() {
        return userIconPath;
    }

    public void setUserIconPath(String userIconPath) {
        this.userIconPath = userIconPath;
    }
}
