<%@ page contentType="application/json;charset=utf-8" import="com.family168.student.*" %><%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    int start = 0;
    try {
        start = Integer.parseInt(request.getParameter("start"));
    } catch(Exception ex) {
        System.err.println(ex);
    }
    int limit = 15;
    try {
        limit = Integer.parseInt(request.getParameter("limit"));
    } catch(Exception ex) {
        System.err.println(ex);
    }
    String sort = request.getParameter("sort");
    String dir = request.getParameter("dir");

    StudentDao dao = StudentDao.getInstance();
    Page pager = dao.pagedQuery(start, limit, sort, dir);

    out.print(pager.toString());
%>