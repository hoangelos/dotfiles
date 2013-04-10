import sublime
import sublime_plugin

django_comment = """\
{%% comment %%}

%s

{%% endcomment %%}"""


class DjangoCommentCommand(sublime_plugin.TextCommand):
    def run(self, edit):

        sublime.status_message('...marking django comment')
        for region in self.view.sel():
            if not region.empty():
                text = django_comment % self.view.substr(region)
                self.view.replace(edit, region, text)
            else:
                sublime.error_message('You need to select something')
