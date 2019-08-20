<%@ page contentType="text/html;charset=utf-8"%>
<%!
    String province = "[['河北','河北'],['内蒙古','内蒙古']]";
    String cityHebei = "[" +
        "['唐山','唐山']," +
        "['秦皇岛','秦皇岛']," +
        "['承德','承德']," +
        "['张家口','张家口']" +
    "]";
    String cityNeimenggu = "[" +
        "['呼和浩特','呼和浩特']," +
        "['包头','包头']" +
    "]";
    String countyTangshan = "[" +
        "['路南区','路南区']," +
        "['路北区','路北区']," +
        "['开平区','开平区']," +
        "['古冶区','古冶区']," +
        "['丰润区','丰润区']," +
        "['丰南区','丰南区']," +
        "['玉田','玉田']," +
        "['遵化','遵化']," +
        "['迁西','迁西']," +
        "['迁安','迁安']," +
        "['滦县','滦县']," +
        "['滦南','滦南']," +
        "['乐亭','乐亭']," +
        "['唐海','唐海']" +
    "]";
    String countyUnknow = "[['不知道','不知道']]";
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String type = request.getParameter("type");
if ("province".equals(type)) {
    response.getWriter().print(province);
} else if ("city".equals(type)) {
    String province = java.net.URLDecoder.decode(request.getParameter("id"));
    System.out.println(province);
    if ("河北".equals(province)) {
        response.getWriter().print(cityHebei);
    } else if ("内蒙古".equals(province)) {
        response.getWriter().print(cityNeimenggu);
    }
} else if ("county".equals(type)) {
    String city = request.getParameter("id");
    if ("唐山".equals(city)) {
        response.getWriter().print(countyTangshan);
    } else {
        response.getWriter().print(countyUnknow);
    }

}
%>

