import sublime
import sublime_plugin

class PromptBlockCommentCommand(sublime_plugin.WindowCommand):
    def run(self):
        sublime.active_window().show_input_panel("Insert Block Comment",
                                                 "",
                                                 on_done=self.on_done,
                                                 on_change=None,
                                                 on_cancel=None)
    def on_done(self, title):
        try:
            title = str(title)
            if self.window.active_view():
                self.window.active_view().run_command("block_comment",
                                                      {"title": title})
        except ValueError:
            pass


class BlockCommentCommand(sublime_plugin.TextCommand):

    def run(self, edit, title):
        print("Hi")
        print(self.view.get_regions("comment"))
        block = self.format_block(title)
        self.view.insert(edit, self.view.sel()[0].begin(),
                         block)

    def format_block(self, title):
        comment_char = get_comment_character(self.view)
        indent = get_indent(self.view)
        title_length = len(title)
        tot_length = title_length + 6
        border = comment_char * tot_length
        mid = "{0}{0} {1} {0}{0}".format(comment_char, title)
        return '\n'.join((border, indent + mid, indent + border, indent))


def get_comment_character(view):
    # http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/reference/metadata.html
    comment = view.meta_info('shellVariables', view.sel()[0].b)[0]['value']
    return comment.strip()


def get_indent(view):
    # The point is to detect if the line is indented by scanning the line.
    current_line_region = view.line(view.sel()[0])
    line_contents = view.substr(current_line_region)
    return line_contents
