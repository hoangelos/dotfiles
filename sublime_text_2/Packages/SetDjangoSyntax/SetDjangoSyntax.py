import sublime, sublime_plugin
import os, string, re

# modified for django by pjv
# based on this gist: https://gist.github.com/1497794 by phillipkoebbe

# requires Djaneiro [https://github.com/squ1b3r/Djaneiro]

ST2_dir = os.path.dirname(os.path.dirname(os.getcwdu()))

class SetDjangoSyntaxCommand(sublime_plugin.EventListener):
    """ Attempts to set Python Django Syntax when appropriate. """


    def __init__(self):
        super(SetDjangoSyntaxCommand, self).__init__()
        self.path = None
        self.name = None
        self.ext  = None
        self.view = None


    def on_load(self, view):
        self.check_syntax(view)


    def on_post_save(self, view):
        self.check_syntax(view)


    def check_syntax(self, view):
        self.view      = view
        self.file_name = view.file_name()
    
        if not self.file_name: # buffer has never been saved
            return

        self.reset_cache_variables()

        if not self.ext == '.py':
            print "Not python file - SetDjangoSyntax exiting"
            return

        if self.is_django():
            self.set_syntax('Python Django', 'Djaneiro')
            return
        else:
            self.set_syntax('Python', 'Python')
            return


    def is_django(self):
        if self.view.find('from django',0,sublime.IGNORECASE) > -1:
            return True
        return False


    def reset_cache_variables(self):
        self.path = os.path.dirname(self.file_name)
        self.name = os.path.basename(self.file_name).lower()
        self.name, self.ext = os.path.splitext(self.name)


    def set_syntax(self, syntax, path = None):
        if path is None:
            path = syntax

        new_syntax = 'Packages/' + path + '/' + syntax + '.tmLanguage'

        if not os.path.exists(os.path.join(ST2_dir, new_syntax)):
            new_syntax = 'Packages/' + path + '/Syntaxes/' + syntax + '.tmLanguage'
        current_syntax = self.view.settings().get('syntax')

        if current_syntax != new_syntax:
            self.view.settings().set('syntax', new_syntax)
            print "Switched syntax to: " + syntax