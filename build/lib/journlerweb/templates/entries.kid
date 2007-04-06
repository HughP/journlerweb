<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#">
<body>
<table class="entries" cellspacing="0" cellpadding="3" width="100%">
    <thead>
        <tr>
            <td>Name</td>
            <td>Category</td>
            <td>Tags</td>
            <td>Created</td>
            <td>Modified</td>
            <td>Due</td>
            <td>#</td>
        </tr>
    </thead>
    <tbody>
        <tr py:for="i, entry in enumerate(entries)" py:attrs="id=entry.id" class="entry ${i%2 and 'entry_odd' or 'entry_even'}">
        <td py:attrs="id=entry.id">${entry.name}</td>
        <td>${entry.category}</td>
        <td>${" ".join(entry.tags)}</td>
        <td>${entry.date_created.strftime("%b %d, %Y")}</td>
        <td>${entry.date_modified.strftime("%b %d, %Y")}</td>
        <td>${entry.date_due and entry.due_date.strftime("%b %d, %Y") or " "}</td>
        <td>${entry.id}</td>
    </tr>
    </tbody>
</table>
</body>
</html>
