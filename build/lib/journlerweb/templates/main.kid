<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'master.kid'">

<head>
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" py:replace="''"/>
    <title>Journler Web</title>
    <script language="javascript">
        $().ready(function() {
            // initialize the main application singleton
            jweb.init();
        });
    </script>
</head>

<body>
    <img src="/static/images/journler.png"/>
    <span id="toolbar">
        <a class="toolbar" href="#" onclick="jweb.new_entry();">New Entry</a> | 
        <a class="toolbar" href="#">Preferences</a> | 
        Search <input type="text" width="40"/>
        &nbsp;<span id="activity_indicator"><img src="/static/images/indicator.gif"/></span>
    </span>
    <br/>
    <div id="alert" align="center" width="60%"></div>
    <br/>
    <div id="rootpane">
        <div id="folderpane">${XML(folders)}</div>
        <div id="entrypane">
            <div id="entries">
            </div>
            <div id="entrycontent">
            </div>
        </div>
    </div> 
</body>
</html>
