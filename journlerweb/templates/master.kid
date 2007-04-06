<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?python import sitetemplate ?>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#" py:extends="sitetemplate">

<head py:match="item.tag=='{http://www.w3.org/1999/xhtml}head'" py:attrs="item.items()">
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" py:replace="''"/>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css"/>
    <script language="javascript" src="/static/javascript/jquery-latest.js"/>
    <!--<script language="javascript" src="/static/javascript/jquery.interface.js"/>-->
    <script language="javascript" src="/static/javascript/jquery.cookie.js"/>
    <script language="javascript" src="/static/javascript/jquery.treeview.pack.js"/>
    <script language="javascript" src="/static/javascript/jquery.dimensions.js"/>
    <script language="javascript" src="/static/javascript/jquery.splitter.js"/>
    <script language="javascript" src="/static/javascript/jquery.form.js"/>
    <script language="javascript" src="/static/javascript/webtoolkit.scrolltable.js"/>
    <script language="javascript" src="/static/javascript/jquery.block.js"/>
    <script language="javascript" src="/static/javascript/jquery.debug.js"/>
        
    <script language="javascript" src="/static/javascript/journlerweb.js"/>
    <title py:replace="''">Your title goes here</title>
    <meta py:replace="item[:]"/>
    <style type="text/css">
        #pageLogin
        {
            font-size: 10px;
            font-family: verdana;
            text-align: right;
        }
    </style>
</head>

<body py:match="item.tag=='{http://www.w3.org/1999/xhtml}body'" py:attrs="item.items()">
    <div py:if="tg.config('identity.on',False) and not 'logging_in' in locals()"
        id="pageLogin">
        <span py:if="tg.identity.anonymous">
            <a href="/login">Login</a>
        </span>
        <span py:if="not tg.identity.anonymous">
            Welcome ${tg.identity.user.display_name}.
            <a href="/logout">Logout</a>
        </span>
    </div>

    <div py:if="value_of('tg_flash',False)" class="flash" py:content="tg_flash"></div>

    <div py:replace="[item.text]+item[:]"/>

        <div id="footer">another <a target="_blank" href="http://ano.malo.us">ano.malo.us</a> production.</div>
</body>

</html>
