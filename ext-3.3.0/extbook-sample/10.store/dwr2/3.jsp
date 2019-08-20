<%@ page contentType="text/html;charset=utf-8"%>
<%
    String ctx = request.getContextPath();
    String ext = ctx + "/../ext-2.0";
    pageContext.setAttribute("ctx", ctx);
    pageContext.setAttribute("ext", ext);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>DWRTreeLoader</title>
        <link rel="stylesheet" type="text/css" href="${ext}/resources/css/ext-all.css" />
        <script type="text/javascript" src="${ext}/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="${ext}/ext-all.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/interface/treeNodeManager.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
        <script type="text/javascript" src="DWRTreeLoader.js"></script>
        <script type="text/javascript">
Ext.BLANK_IMAGE_URL = '${ext}/resources/images/default/s.gif';

Ext.onReady(function(){

    var tree = new Ext.tree.TreePanel({
        el: 'tree',
        loader: new Ext.tree.DWRTreeLoader({dataUrl: treeNodeManager.getTree})
    });

    var root = new Ext.tree.AsyncTreeNode({
        id: '0',
        text:'偶是根'
    });

    tree.setRootNode(root);
    tree.render();

    root.expand();

});
        </script>
    </head>
    <body>
        <h1>DWRTreeLoader</h1>
        <a href="index.jsp">返回</a>
        <hr>
        <div id="tree" style="height:300px;"></div>
    </body>
</html>
