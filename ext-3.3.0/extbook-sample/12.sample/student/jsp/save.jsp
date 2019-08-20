<%@ page contentType="application/json;charset=utf-8" import="com.family168.student.*" %><%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String sex = request.getParameter("sex");
    String age = request.getParameter("age");
    String political = request.getParameter("political");
    String origin = request.getParameter("origin");
    String professional = request.getParameter("professional");

    Student student = new Student();
    student.setCode(code);
    student.setName(name);
    student.setSex(Integer.parseInt(sex));
    student.setAge(Integer.parseInt(age));
    student.setPolitical(political);
    student.setOrigin(origin);
    student.setProfessional(professional);

    StudentDao dao = StudentDao.getInstance();
    if (id == null || id.equals("")) {
        dao.insert(student);
    } else {
        student.setId(Long.parseLong(id));
        dao.update(student);
    }
    out.print("{success:true,msg:'保存成功'}");
%>