import logging

import cherrypy

import turbogears
from turbogears import controllers, expose, validate, redirect

from journlerweb import json
from journlerweb.model import *

log = logging.getLogger("journlerweb.controllers")


class EntryController(controllers.Controller):
    @expose('journlerweb.templates.entry')
    def default(self, id, export=None):
        if export:
            content = export_entry(id, export)
            cherrypy.response.headers['Content-Type'] = "application/pdf"
            return content

        return dict(entry=entry(id))

class Root(controllers.RootController):
    entry = EntryController()
    
    @expose(template="journlerweb.templates.main")
    def index(self):
        return dict(folders=render_folder_tree(folder_tree()))

    @expose(template="journlerweb.templates.entries")
    def entries(self, folder=0):
        return dict(entries=entries(folder))

    @expose(template="journlerweb.templates.newentry", allow_json=True)
    def newentry(self, **kwargs):
        folder = kwargs.get("folder", "0")

        if 'submit' in kwargs.keys():
            # new entry submitted. add it to Journler.
            id = new_entry(**kwargs)
            msg = "Successfully created entry #%s" % id
            return dict(type='success', entryid=id, msg=msg)
            
        return dict(folder=folder)

