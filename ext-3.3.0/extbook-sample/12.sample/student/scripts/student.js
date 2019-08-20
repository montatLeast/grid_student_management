
Ext.onReady(function() {

    Ext.QuickTips.init();

    var sexRenderer = function(value) {
        if (value == 1) {
            return '<span style="color:red;font-weight:bold;">男</span>';
        } else if (value == 2) {
            return '<span style="color:green;font-weight:bold;">女</span>';
        }
    };

    var StudentRecord = Ext.data.Record.create([
        {name: 'id', type: 'int'},
        {name: 'code', type: 'string'},
        {name: 'name', type: 'string'},
        {name: 'sex', type: 'int'},
        {name: 'age', type: 'int'},
        {name: 'political', type: 'string'},
        {name: 'origin', type: 'string'},
        {name: 'professional', type: 'string'}
    ]);

    var store = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({url: './jsp/list.jsp'}),
        reader: new Ext.data.JsonReader({
            totalProperty: 'totalCount',
            root: 'result'
        },StudentRecord),
        remoteSort: true
    });
    store.load({params:{start:0,limit:15}});

    var columns = new Ext.grid.ColumnModel([
        {header: '学号', dataIndex: 'code'},
        {header: '姓名', dataIndex: 'name'},
        {header: '性别', dataIndex: 'sex', renderer: sexRenderer},
        {header: '年龄', dataIndex: 'age'},
        {header: '政治面貌', dataIndex: 'political'},
        {header: '籍贯', dataIndex: 'origin'},
        {header: '所属系', dataIndex: 'professional'}
    ]);
    columns.defaultSortable = true;

    // grid start
    var grid = new Ext.grid.GridPanel({
        title: '学生信息列表',
        region: 'center',
        loadMask: true,
        store: store,
        cm: columns,
        sm: new Ext.grid.RowSelectionModel({singleSelect:true}),
        viewConfig: {
            forceFit: true
        },
        bbar: new Ext.PagingToolbar({
            pageSize: 15,
            store: store,
            displayInfo: true
        })
    });
    // grid end

    // form start
    var form = new Ext.form.FormPanel({
        title: '编辑学生信息',
        region: 'east',
        frame: true,
        width: 300,
        autoHeight: true,
        labelAlign: 'right',
        labelWidth: 60,
        defaultType: 'textfield',
        defaults: {
            width: 200,
            allowBlank: false
        },
        items: [{
            xtype: 'hidden',
            name: 'id'
        },{
            fieldLabel: '学号',
            name: 'code'
        },{
            fieldLabel: '姓名',
            name: 'name'
        },{
            fieldLabel: '年龄',
            name: 'age',
            xtype: 'numberfield',
            allowNegative: false
        },{
            fieldLabel: '性别',
            name: 'sexText',
            hiddenName: 'sex',
            xtype: 'combo',
            store: new Ext.data.SimpleStore({
                fields: ['value','text'],
                data: [['1','男'],['2','女']]
            }),
            emptyText: '请选择',
            mode: 'local',
            triggerAction: 'all',
            valueField: 'value',
            displayField: 'text',
            readOnly: true
        },{
            fieldLabel: '政治面貌',
            name: 'political',
            xtype: 'combo',
            store: new Ext.data.SimpleStore({
                fields: ['text'],
                data: [['群众'],['党员'],['团员']]
            }),
            emptyText: '请选择',
            mode: 'local',
            triggerAction: 'all',
            valueField: 'text',
            displayField: 'text',
            readOnly: true
        },{
            fieldLabel: '籍贯',
            name: 'origin'
        },{
            fieldLabel: '所属系',
            name: 'professional'
        }],
        buttons: [{
            text: '添加',
            handler: function() {
                if (!form.getForm().isValid()) {
                    return;
                }
                if (form.getForm().findField("id").getValue() == "") {
                    // 添加
                    form.getForm().submit({
                        url: './jsp/save.jsp',
                        success: function(f, action) {
                            if (action.result.success) {
                                Ext.Msg.alert('消息', action.result.msg, function() {
                                    grid.getStore().reload();
                                    form.getForm().reset();
                                    form.buttons[0].setText('添加');
                                });
                            }
                        },
                        failure: function() {
                            Ext.Msg.alert('错误', "添加失败");
                        }
                    });
                } else {
                    // 修改
                    form.getForm().submit({
                        url: './jsp/save.jsp',
                        success: function(f, action) {
                            if (action.result.success) {
                                Ext.Msg.alert('消息', action.result.msg, function() {
                                    grid.getStore().reload();
                                    form.getForm().reset();
                                    form.buttons[0].setText('添加');
                                });
                            }
                        },
                        failure: function() {
                            Ext.Msg.alert('错误', "修改失败");
                        }
                    });
                }
            }
        },{
            text: '清空',
            handler: function() {
                form.getForm().reset();
                form.buttons[0].setText('添加');
            }
        },{
            text: '删除',
            handler: function() {
                var id = form.getForm().findField('id').getValue();
                if (id == '') {
                    Ext.Msg.alert('提示', '请选择需要删除的信息。');
                } else {
                    Ext.Ajax.request({
                        url: './jsp/remove.jsp',
                        success: function(response) {
                            var json = Ext.decode(response.responseText);
                            if (json.success) {
                                Ext.Msg.alert('消息', json.msg, function() {
                                    grid.getStore().reload();
                                    form.getForm().reset();
                                    form.buttons[0].setText('添加');
                                });
                            }
                        },
                        failure: function() {
                            Ext.Msg.alert('错误', "删除失败");
                        },
                        params: "id=" + id
                    });
                }
            }
        }]
    });
    // form end

    // 单击修改信息 start
    grid.on('rowclick', function(grid, rowIndex, event) {
        var record = grid.getStore().getAt(rowIndex);
        form.getForm().loadRecord(record);
        form.buttons[0].setText('修改');
    });
    // 单击修改信息 end

    // layout start
    var viewport = new Ext.Viewport({
        layout: 'border',
        items: [{
            region: 'north',
            contentEl: 'head'
        }, grid, form, {
            region: 'south',
            contentEl: 'foot'
        }]
    });
    // layout end
});

