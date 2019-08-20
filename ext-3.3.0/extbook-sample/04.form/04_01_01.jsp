<%@ page contentType="text/html;charset=utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String text = request.getParameter("text");
    System.out.println(text);

    response.getWriter().print("{success:true,msg:'成功'}");
%>
