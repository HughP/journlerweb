# This module provides helper functions for the JSON part of your
# view, if you are providing a JSON-based API for your app.

# Here's what most rules would look like:
# @jsonify.when("isinstance(obj, YourClass)")
# def jsonify_yourclass(obj):
#     return [obj.val1, obj.val2]
#
# The goal is to break your objects down into simple values:
# lists, dicts, numbers and strings

from turbojson.jsonify import jsonify
from journlerweb.model import *

@jsonify.when('isinstance(obj, JournlerEntry)')
def jsonify_journler_entry(obj):
    def strdate(dateobj):
        return dateobj and dateobj.strftime("%b %d, %Y") or ' '

    return dict(
        id = obj.id,
        name = obj.name,
        category = obj.category,
        tags = " ".join(obj.tags),
        date_created = strdate(obj.date_created),
        date_modified = strdate(obj.date_modified),
        date_due = strdate(obj.date_due),
        label = str(obj.label),
    )

