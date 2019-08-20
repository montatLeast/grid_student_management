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
        <title>无侵入式整合dwr和ext</title>
        <link rel="stylesheet" type="text/css" href="${ext}/resources/css/ext-all.css" />
        <script type="text/javascript" src="${ext}/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="${ext}/ext-all.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/interface/infoManager.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
        <script type="text/javascript">
Ext.BLANK_IMAGE_URL = '${ext}/resources/images/default/s.gif';

Ext.onReady(function(){

    var cm = new Ext.grid.ColumnModel([
        {header:'编号',dataIndex:'id'},
        {header:'名称',dataIndex:'name'},
        {header:'性别',dataIndex:'sex'},
        {header:'邮箱',dataIndex:'email'},
        {header:'电话',dataIndex:'tel'},
        {header:'添加时间',dataIndex:'addTime'},
        {header:'备注',dataIndex:'descn'}
    ]);

    var store = new Ext.data.JsonStore({
        fields: ["id","name","sex",'email','tel','addTime','descn']
    });

    // 调用dwr取得数据
    infoManager.getResult(function(data) {
        store.loadData(data);
    });

    var grid = new Ext.grid.GridPanel({
        renderTo: 'grid',
        store: store,
        cm: cm
    });

});
        </script>
    </head>
    <body>
        <h1>无侵入式整合dwr和ext</h1>
        <a href="index.jsp">返回</a>
        <hr>
        <div id="grid" style="height:300px;"></div>
    </body>
</html>
