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
        <title>DWRProxy</title>
        <link rel="stylesheet" type="text/css" href="${ext}/resources/css/ext-all.css" />
        <script type="text/javascript" src="${ext}/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="${ext}/ext-all.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/interface/infoManager.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
        <script type="text/javascript" src="DWRProxy.js"></script>
        <script type="text/javascript">
Ext.BLANK_IMAGE_URL = '${ext}/resources/images/default/s.gif';

Ext.onReady(function(){

    var info = Ext.data.Record.create([
        {name: 'id', type: 'int'},
        {name: 'name', type: 'string'},
        {name: 'sex', type: 'int'},
        {name: 'email', type: 'string'},
        {name: 'tel', type: 'string'},
        {name: 'addTime'},
        {name: 'descn', type: 'string'}
    ]);

    var cm = new Ext.grid.ColumnModel([
        {header:'编号',dataIndex:'id'},
        {header:'名称',dataIndex:'name'},
        {header:'性别',dataIndex:'sex'},
        {header:'邮箱',dataIndex:'email'},
        {header:'电话',dataIndex:'tel'},
        {header:'添加时间',dataIndex:'addTime'},
        {header:'备注',dataIndex:'descn'}
    ]);

    var store = new Ext.data.Store({
        proxy: new Ext.data.DWRProxy(infoManager.getItems, true),
        reader: new Ext.data.ListRangeReader({
            totalProperty: 'totalSize',
            root: 'data',
            id: 'id'
        }, info),
        remoteSort: true
    });

    var grid = new Ext.grid.GridPanel({
        renderTo: 'grid',
        autoHeight: true,
        store: store,
        cm: cm,
        bbar: new Ext.PagingToolbar({
            pageSize: 10,
            store: store,
            displayInfo: true,
            displayMsg: '显示第 {0} 条到 {1} 条记录，一共 {2} 条',
            emptyMsg: "没有记录"
        })
    });
    store.load({params:{start:0,limit:10}});

});
        </script>
    </head>
    <body>
        <h1>DWRProxy</h1>
        <a href="index.jsp">返回</a>
        <hr>
        <div id="grid" style="height:300px;"></div>
    </body>
</html>
