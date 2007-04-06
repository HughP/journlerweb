#from sqlobject import *

#from turbogears.database import PackageHub

#hub = PackageHub("journlerweb")
#__connection__ = hub


import appscript
from appscript import *
import os

class JournlerFolder(object):
    def __init__(self, folder=None):
        self.id = -1
        self.children = []
                
        if folder:
            self.id = folder.id.get()
            self.type = folder.type.get()
            self.name = folder.name.get()
            self.label = folder.label.get()
            self.parent = folder.parent.id.get()

def folder_tree():
    app = appscript.app("Journler")
    folders = dict((f.id.get(), JournlerFolder(f)) for f in app.folders.get())
    
    # convert list of folders to tree
    root = JournlerFolder()
    folders[root.id] = root
    
    for f in folders.values():
        if f.id != -1:
            folders[f.parent].children.append(f)
    return root

# Depth-first iteration through tree. to render as HTML list
def render_folder_tree(folder):
    html = ""
    root = folder.id is -1
    
    if not root:
        html += "<li class=\"folder\" id=\"%s\"><span id=\"%s\">%s</span>" % (folder.id, folder.id, folder.name)
    
    if folder.children:
        html += "<ul>"
        for child in folder.children:
            html += render_folder_tree(child)
        html += "</ul>"
    
    if not root:
        html += "</li>"
    
    return html

class JournlerEntry(object):
    def __init__(self, entry):
        self.id = entry.id.get()
        self.name = entry.name.get()
        self.category = entry.category.get()
        self.tags = entry.tags.get().split()
        self.label = entry.label.get()
        self.date_created = entry.date_created.get()
        self.date_modified = entry.date_modified.get()
        self.date_due = entry.date_due.get()
        self.resources = [(r.id.get, r.type.get(), r.name.get()) for r in entry.resources.get()]
        self.contents = None

def entries(folder=0):
    app = appscript.app("Journler")
    if folder is 0:
        entries = [JournlerEntry(e) for e in app.entries.get()]
    else:
        folder = app.folders.ID(folder)
        entries = [JournlerEntry(e) for e in folder.entries.get()]
    return entries


def entry(id):
    app = appscript.app("Journler")
    entry = app.entries.ID(id).get()
    je = JournlerEntry(entry)
   
    index = [i+1 for i,e in enumerate(app.entries.get()) if int(e.id.get()) == int(id)][0]
    os.system("osascript ./journlerweb/jexport_xhtml.scpt %s" % index)
    je.content = open("/tmp/%s.html" % index).read()
    return je

# merge this with entry() into entry(export=pdf) or something..
def export_entry(id, export='pdf'):
    app = appscript.app("Journler")
    entry = app.entries.ID(id).get()
    je = JournlerEntry(entry)
   
    index = [i+1 for i,e in enumerate(app.entries.get()) if int(e.id.get()) == int(id)][0]
    os.system("osascript ./journlerweb/jexport_%s.scpt %s" % (export, index))
    content = open("/tmp/%s.%s" % (index, export)).read()
    return content

def new_entry(folder="0", name="Untitled", category="", tags="", content="", due="", **kwargs):
    app = appscript.app("Journler")
    e = app.entries.end.make(new=k.entry, with_properties={
            k.name: name,
            k.category: category,
            k.tags: tags,
            k.contents: content
    })
    
    return e.id.get()

    
