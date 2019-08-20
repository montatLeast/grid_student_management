package com.family168.student;

public class Student {
    private long id;
    private String code;
    private String name;
    private int sex;
    private int age;
    private String political;
    private String origin;
    private String professional;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPolitical() {
        return political;
    }

    public void setPolitical(String political) {
        this.political = political;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public String toString() {
        return "{id:" + id +
            ",code:'" + code +
            "',name:'" + name +
            "',sex:" + sex +
            ",age:" + age +
            ",political:'" + political +
            "',origin:'" + origin +
            "',professional:'" + professional +
            "'}";
    }
}
