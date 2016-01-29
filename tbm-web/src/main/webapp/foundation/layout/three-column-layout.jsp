<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.tumbleweed.platform.trunk.util.local.LocaleUtil" %>
<%@ page import="com.tumbleweed.platform.trunk.util.theme.ThemeUtil" %>
<%@ page import="java.util.Locale" %>
<%
    String contextPath = request.getContextPath();
    String theme = ThemeUtil.getTheme(request);
    Locale locale = LocaleUtil.getCurrentLocale(request);
    long currentTimeMillis = System.currentTimeMillis();
%>
<%@ include file="/foundation/common/init.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>tumbleweed管理系统</title>
    <%@ include file="/foundation/common/meta.jspf" %>
    <%@ include file="/foundation/common/uilibrary.jspf" %>
    <%@ include file="/foundation/common/theme.jspf" %>
    <style>
        html, body {
            margin: 0 auto !important;
        }
    </style>
    <script>
        var serverDate = new Date();
        serverDate.setTime(<%=currentTimeMillis%>);

        Ext.require([
            'Ext.panel.*',
            'Ext.container.*',
            'Ext.layout.*'
        ]);

        Ext.onReady(function () {
        	Ext.QuickTips.init();
            var trunkPanel = Ext.create('Ext.Panel', {
                id: 'trunk-panel',
                width: '100%',
                border: 0,
                minWidth: 1000,
                maxWidth: 1300,
                layout: {
                    type: 'vbox',
                    align: 'stretch'
                },
                renderTo: 'trunk-body',
                items: [
                    {
                        xtype: 'container',
                        height: 139,
                        border: 0,
                        contentEl: 'trunk-header'
                    },
                    {
                        xtype: 'container',
                        border: 0,
                        layout: {
                            type: 'hbox',
                            align: 'stretch'
                        },
                        items: [
                            {
                                xtype: 'container',
                                width: 180,
                                minHeight: 400,
                                padding: "0 5",
                                border: 0,
                                contentEl: 'trunk-left-navigator'
                            },
                            {
                                xtype: 'container',
                                id: 'trunk-center-panel',
                                flex: 1,
                                minHeight: 400,
                                border: 0,
                                layout: 'fit',
                                contentEl: 'trunk-center'
                            },
                            {
                                xtype: 'container',
                                width: 180,
                                minHeight: 400,
                                border: 0,
                                padding: "0 5",
                                contentEl: 'trunk-right-navigator'
                            }
                        ]
                    },
                    {
                        xtype: 'container',
                        border: 0,
                        contentEl: 'trunk-footer'
                    }
                ]
            });

            Ext.EventManager.onWindowResize(function (w, h) {
                trunkPanel.doComponentLayout();
            });

            function doLayout() {
                Soupe.doLayout();
            }

            var task = Ext.TaskManager.start({
                run: doLayout,
                interval: 1000
            });
        });
    </script>
</head>
<body>
<center>
    <div id="trunk-body"></div>
    <div id="trunk-container" style="display:none">
        <%@ include file="/foundation/include/header.jspf" %>
        <%@ include file="/foundation/include/left-navigator.jspf" %>
        <%@ include file="/foundation/include/center.jspf" %>
        <%@ include file="/foundation/include/right-navigator.jspf" %>
        <%@ include file="/foundation/include/footer.jspf" %>
    </div>
</center>
</body>
</html>
