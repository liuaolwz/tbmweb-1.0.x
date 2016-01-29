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
            'Ext.layout.*',
            'Ext.data.*',
            'Ext.grid.*'
        ]);

        Ext.onReady(function () {
        	Ext.QuickTips.init();
        	
            Ext.create('Ext.Viewport', {
                layout: {
                    type: 'border'
                },
                items: [
                    {
                        id: 'trunk-center-panel',
                        region: 'center',
                        flex: 1,
                        layout: 'fit',
                        border: 0,
                        contentEl: 'trunk-center'
                    }
                ]
            });
        });
    </script>
</head>
<body>
<center>
    <div id="trunk-body"></div>
    <div id="trunk-container" style="display:none">
        <%@ include file="/foundation/include/center.jspf" %>
    </div>
</center>
</body>
</html>
