<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#">
<body>
${XML(entry.content)}

<script language="javascript">

entryid = ${entry.id}

<!--    
$($(".p1")[0]).prepend("<p class='p1'><span class=s1 style='color: #808080;'>Export as: </span><a href=/entry/" + entryid + "?export=pdf>PDF</a></p>");    

-->
</script>
</body>
</html>
