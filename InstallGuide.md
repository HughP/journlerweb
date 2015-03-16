JournlerWeb is not yet ready for prime time.  Installation requires several steps.  I hope to have an easier way to install soon.

For now, you have to install these separately but it shouldn't bee too difficult to make a single installer in the future.

  1. Install Python 2.4 from [here](http://www.pythonmac.org/packages/py24-fat/dmg/python-2.4.4-macosx2006-10-18.dmg). Check which version you currently have with `python -V`
  1. Install appscript from [here](http://sourceforge.net/project/downloading.php?groupname=appscript&filename=Appscript-Installer-1.5.1.dmg)
  1. Install Turbogears from [here](http://www.turbogears.com/download/)
  1. Install Subversion (svn) from [here](http://metissian.com/downloads/macosx/subversion/subversion-client-1.3.1.dmg)
  1. Finally, install JournlerWeb from  [here](http://groups.google.com/group/journlerweb/web/JournlerWeb-0.1.dmg) or using svn. If using svn, checkout the code and run `python setup.py install` or just run `start-journlerweb.py` to run from source directory.

To run JournlerWeb, run `start-journlerweb.py` in the terminal.




