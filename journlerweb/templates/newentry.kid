<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#">
    <head>
        <script language="javascript">

$(document).ready(function() {
    var folder = ${folder};
    $("#newentry_form").ajaxForm({
        dataType: 'json',
        success: function(json) {
            jweb.select_folder(jweb.folder(folder), function() {
                jweb.select_entry(jweb.entry(json.entryid));        
            });
            jweb.alert(json.msg);
        },
     });
});

        </script>
    </head>

    <body>

        <div style="background: #eee;; padding: 4px;"> 
<form id="newentry_form" action="/newentry" method="post">
<input type="hidden" name="tg_format" value="json"/>    
<input type="hidden" name="folder" value="${folder}"/>    
<table cellspacing="0" cellpadding="2" border="0">
<tr><td width="2%">Name</td><td><input type="text" name="name" tabindex="1"/></td></tr>
<tr><td>Category</td><td><input type="text" name="category" tabindex="2"/></td></tr>
<tr><td>Tags</td><td><input type="text" name="tags" tabindex="3"/></td></tr>
<tr><td>Due</td><td><input type="text" name="due" tabindex="4"/></td></tr>
<tr><td colspan="2"><textarea name="content" cols="80" rows="20" tabindex="5"/></td></tr>
    <tr><td colspan="2" align="right">
            <input id="submitbtn" type="submit" name="submit" tabindex="6" value="Create Entry" 
            onmouseover="this.className='hoverbtn';" onmouseout="this.className=''"/>
    </td></tr>
</table>

</form>

</div>
</body>
</html>

