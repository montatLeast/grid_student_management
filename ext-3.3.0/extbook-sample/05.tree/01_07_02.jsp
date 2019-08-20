<%@ page contentType="text/html;charset=utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // 获得node参数，对应的是正在展开的节点id
    String node = request.getParameter("node");
    System.out.println(node);


    String json = "";
    if ("0".equals(node)) {
        json += "[{id:1,text:'节点阿一'},{id:2,text:'节点阿二'}]";
    } else if ("1".equals(node)) {
        json += "[{id:11,text:'节点阿一一',leaf:false},{id:12,text:'节点阿一二',leaf:true}]";
    } else if ("2".equals(node)) {
        json += "[{id:21,text:'节点阿二一',leaf:true},{id:22,text:'节点阿二二',leaf:true}]";
    } else if ("11".equals(node)) {
        json += "[{id:111,text:'节点阿一一一',leaf:true},{id:112,text:'节点阿一一二',leaf:true}]";
    }

    response.getWriter().print(json);
%>
