package com.employee.ems;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpRepository {

    public void save(Employee employee)
            throws Exception {

        String sql = """
                     INSERT INTO employees
                     (name, email, gender, department, active, description)
                     VALUES (?, ?, ?, ?, ?, ?)
                     """;

        try (
                Connection connection
                = DBConnection.getConnection(); PreparedStatement statement
                = connection.prepareStatement(sql)) {

            statement.setString(
                    1,
                    employee.getName()
            );

            statement.setString(
                    2,
                    employee.getEmail()
            );

            statement.setString(
                    3,
                    employee.getGender()
            );

            statement.setString(
                    4,
                    employee.getDepartment()
            );

            statement.setBoolean(
                    5,
                    employee.isActive()
            );

            statement.setString(
                    6,
                    employee.getDescription()
            );

            statement.executeUpdate();
        }
    }


    public List<Employee> findAll()
            throws Exception {

        String sql
                = "SELECT * FROM employees";

        List<Employee> employees
                = new ArrayList<>();

        try (
                Connection connection
                = DBConnection.getConnection(); PreparedStatement statement
                = connection.prepareStatement(sql); ResultSet resultSet
                = statement.executeQuery()) {

            while (resultSet.next()) {

                Employee employee
                        = new Employee();

                employee.setId(
                        resultSet.getInt("id")
                );

                employee.setName(
                        resultSet.getString("name")
                );

                employee.setEmail(
                        resultSet.getString("email")
                );

                employee.setGender(
                        resultSet.getString("gender")
                );

                employee.setDepartment(
                        resultSet.getString("department")
                );

                employee.setActive(
                        resultSet.getBoolean("active")
                );

                employee.setDescription(
                        resultSet.getString("description")
                );

                employees.add(employee);
            }
        }

        return employees;
    }


    public Employee findById(int id)
            throws Exception {

        String sql
                = "SELECT * FROM employees WHERE id = ?";

        try (
                Connection connection
                = DBConnection.getConnection(); PreparedStatement statement
                = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            try (
                    ResultSet resultSet
                    = statement.executeQuery()) {

                if (resultSet.next()) {

                    Employee employee
                            = new Employee();

                    employee.setId(
                            resultSet.getInt("id")
                    );

                    employee.setName(
                            resultSet.getString("name")
                    );

                    employee.setEmail(
                            resultSet.getString("email")
                    );

                    employee.setGender(
                            resultSet.getString("gender")
                    );

                    employee.setDepartment(
                            resultSet.getString("department")
                    );

                    employee.setActive(
                            resultSet.getBoolean("active")
                    );

                    employee.setDescription(
                            resultSet.getString("description")
                    );

                    return employee;
                }
            }
        }

        return null;
    }


    public boolean update(Employee employee)
            throws Exception {

        String sql = """
                     UPDATE employees
                     SET
                         name = ?,
                         email = ?,
                         gender = ?,
                         department = ?,
                         active = ?,
                         description = ?
                     WHERE id = ?
                     """;

        try (
                Connection connection
                = DBConnection.getConnection(); PreparedStatement statement
                = connection.prepareStatement(sql)) {

            statement.setString(
                    1,
                    employee.getName()
            );

            statement.setString(
                    2,
                    employee.getEmail()
            );

            statement.setString(
                    3,
                    employee.getGender()
            );

            statement.setString(
                    4,
                    employee.getDepartment()
            );

            statement.setBoolean(
                    5,
                    employee.isActive()
            );

            statement.setString(
                    6,
                    employee.getDescription()
            );

            statement.setInt(
                    7,
                    employee.getId()
            );

            return statement.executeUpdate() > 0;
        }
    }


    public boolean delete(int id)
            throws Exception {

        String sql
                = "DELETE FROM employees WHERE id = ?";

        try (
                Connection connection
                = DBConnection.getConnection(); PreparedStatement statement
                = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            return statement.executeUpdate() > 0;
        }
    }
}
