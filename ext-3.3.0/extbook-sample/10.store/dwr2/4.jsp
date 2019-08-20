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
        <title>DWRProxy和ComboBox</title>
        <link rel="stylesheet" type="text/css" href="${ext}/resources/css/ext-all.css" />
        <script type="text/javascript" src="${ext}/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="${ext}/ext-all.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/interface/infoManager.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
        <script type="text/javascript" src="DWRProxy.js"></script>
        <script type="text/javascript">
Ext.BLANK_IMAGE_URL = '${ext}/resources/images/default/s.gif';

Ext.onReady(function() {

    var info = Ext.data.Record.create([
        {name: 'id', type: 'int'},
        {name: 'name', type: 'string'}
    ]);

    var store = new Ext.data.Store({
        proxy: new Ext.data.DWRProxy(infoManager.getItems, true),
        reader: new Ext.data.ListRangeReader({
            totalProperty: 'totalSize',
            root: 'data',
            id: 'id'
        }, info)
    });

    var combo = new Ext.form.ComboBox({
        store: store,
        displayField: 'name',
        valueField: 'id',
        triggerAction: 'all',
        typeAhead: true,
        mode: 'remote',
        emptyText: '请选择',
        selectOnFocus: true
    });
    combo.render('combo');

});
        </script>
    </head>
    <body>
        <h1>DWRProxy和ComboBox</h1>
        <a href="index.jsp">返回</a>
        <hr>
        <div id="combo" style="height:300px;"></div>
    </body>
</html>
