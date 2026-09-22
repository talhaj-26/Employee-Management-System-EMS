package com.employee.ems;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/EmpServlet")
public class EmpServlet extends HttpServlet {

    private EmpRepository repository;

    @Override
    public void init() throws ServletException {
        repository = new EmpRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showForm(request, response);
                    break;

                case "edit":
                    showEditForm(request, response);
                    break;

                case "delete":
                    deleteEmployee(request, response);
                    break;

                case "view":   // নতুন case
                    showViewForm(request, response);
                    break;

                case "list":
                default:
                    showEmployeeList(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Error processing employee request.", e);
        }
    }

    // SHOW FORM (for new employee)
    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/form.jsp").forward(request, response);
    }

    // SHOW EDIT FORM
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = repository.findById(id);
        if (employee == null) {
            response.sendRedirect(request.getContextPath() + "/EmpServlet");
            return;
        }
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/form.jsp").forward(request, response);
    }

    // VIEW EMPLOYEE DETAILS
    private void showViewForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = repository.findById(id);
        if (employee == null) {
            response.sendRedirect(request.getContextPath() + "/EmpServlet");
            return;
        }
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/view.jsp").forward(request, response);
    }

    // DELETE
    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        repository.delete(id);
        response.sendRedirect(request.getContextPath() + "/EmpServlet");
    }

    // LIST (forward to list.jsp instead of index.jsp)
    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Employee> employees = repository.findAll();
        request.setAttribute("employees", employees);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            if ("save".equals(action)) {
                Employee employee = createEmployeeFromRequest(request);
                repository.save(employee);
                response.sendRedirect(request.getContextPath() + "/EmpServlet");
                return;
            }

            if ("update".equals(action)) {
                Employee employee = createEmployeeFromRequest(request);
                employee.setId(Integer.parseInt(request.getParameter("id")));
                repository.update(employee);
                response.sendRedirect(request.getContextPath() + "/EmpServlet");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/EmpServlet");
        } catch (Exception e) {
            throw new ServletException("Error saving employee.", e);
        }
    }

    private Employee createEmployeeFromRequest(HttpServletRequest request) {
        Employee employee = new Employee();
        employee.setName(request.getParameter("name"));
        employee.setEmail(request.getParameter("email"));
        employee.setGender(request.getParameter("gender"));
        employee.setDepartment(request.getParameter("department"));
        employee.setActive(request.getParameter("active") != null);
        employee.setDescription(request.getParameter("description"));
        return employee;
    }
}
