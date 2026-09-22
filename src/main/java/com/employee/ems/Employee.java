package com.employee.ems;

public class Employee {

    private int id;
    private String name;
    private String email;
    private String gender;
    private String department;
    private boolean active;
    private String description;

    public Employee() {
    }

    public Employee(
            int id,
            String name,
            String email,
            String gender,
            String department,
            boolean active,
            String description
    ) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.gender = gender;
        this.department = department;
        this.active = active;
        this.description = description;
    }

    // =========================
    // GETTERS
    // =========================
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getGender() {
        return gender;
    }

    public String getDepartment() {
        return department;
    }

    public boolean isActive() {
        return active;
    }

    public String getDescription() {
        return description;
    }

    // =========================
    // SETTERS
    // =========================
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Employee{"
                + "id=" + id
                + ", name=" + name
                + ", email=" + email
                + ", gender=" + gender
                + ", department=" + department
                + ", active=" + active
                + ", description=" + description
                + '}';
    }

}
