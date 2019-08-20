<%
String start = request.getParameter("start");
String limit = request.getParameter("limit");

String sort = request.getParameter("sort");
String dir = request.getParameter("dir");
System.out.println(dir);
if (dir == null) {
    dir = "ASC";
}

try {
    int index = Integer.parseInt(start);
    int pageSize = Integer.parseInt(limit);

    String json = "{totalProperty:100,root:[";

    if (dir.equals("ASC")) {
        for (int i = index; i < pageSize + index; i++) {
            json += "{id:" + i + ",name:'name" + i + "',descn:'descn" + i + "'}";
            if (i != pageSize + index - 1) {
                json += ",";
            }
        }
    } else {
        for (int i = pageSize + index; i > index; i--) {
            json += "{id:" + i + ",name:'name" + i + "',descn:'descn" + i + "'}";
            if (i != index - 1) {
                json += ",";
            }
        }
    }
    json += "]}";
    response.getWriter().write(json);
} catch(Exception ex) {
}
%>
