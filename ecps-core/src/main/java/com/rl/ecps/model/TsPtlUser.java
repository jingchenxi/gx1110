package com.rl.ecps.model;

import java.util.Date;

public class TsPtlUser {
    private Long ptlUserId;

    private String username;

    private Short gender;

    private String password;

    private String nickname;

    private String realName;

    private String phone;

    private String resiProv;

    private String resiCity;

    private String resiDist;

    private String addr;

    private Integer zipCode;

    private Date loginTime;

    private Short status;

    private String email;

    private Long groupId;

    private String birthday;

    private String qqNum;

    private String msnNum;

    private String cellphone;

    private String introInfo;

    private Long loginCount;

    private Date registerTime;

    public Long getPtlUserId() {
        return ptlUserId;
    }

    public void setPtlUserId(Long ptlUserId) {
        this.ptlUserId = ptlUserId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Short getGender() {
        return gender;
    }

    public void setGender(Short gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getResiProv() {
        return resiProv;
    }

    public void setResiProv(String resiProv) {
        this.resiProv = resiProv == null ? null : resiProv.trim();
    }

    public String getResiCity() {
        return resiCity;
    }

    public void setResiCity(String resiCity) {
        this.resiCity = resiCity == null ? null : resiCity.trim();
    }

    public String getResiDist() {
        return resiDist;
    }

    public void setResiDist(String resiDist) {
        this.resiDist = resiDist == null ? null : resiDist.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public Integer getZipCode() {
        return zipCode;
    }

    public void setZipCode(Integer zipCode) {
        this.zipCode = zipCode;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getQqNum() {
        return qqNum;
    }

    public void setQqNum(String qqNum) {
        this.qqNum = qqNum == null ? null : qqNum.trim();
    }

    public String getMsnNum() {
        return msnNum;
    }

    public void setMsnNum(String msnNum) {
        this.msnNum = msnNum == null ? null : msnNum.trim();
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone == null ? null : cellphone.trim();
    }

    public String getIntroInfo() {
        return introInfo;
    }

    public void setIntroInfo(String introInfo) {
        this.introInfo = introInfo == null ? null : introInfo.trim();
    }

    public Long getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Long loginCount) {
        this.loginCount = loginCount;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}