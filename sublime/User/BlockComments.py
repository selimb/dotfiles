import sublime
import sublime_plugin

class PromptBlockCommentCommand(sublime_plugin.WindowCommand):
    def run(self):
        sublime.active_window().show_input_panel("Insert Block Comment",
                                                 "",
                                                 on_done=self.on_done,
                                                 on_change=None,
                                                 on_cancel=None)
    def on_done(self, input):
        parts = input.split(';')
        if len(parts) == 1:
            length = 0
        else:
            length = int(parts[1])
        title = parts[0].strip()
        view = self.window.active_view()
        if view:
            view.run_command(
                "block_comment",
                {"title": title, "length": length}
            )


class BlockCommentCommand(sublime_plugin.TextCommand):

    def run(self, edit, title, length):
        print(self.view.get_regions("comment"))
        block = self.format_block(title, length)
        self.view.insert(edit, self.view.sel()[0].begin(),
                         block)

    def format_block(self, title, length):
        comment_char = get_comment_character(self.view)
        indent = get_indent(self.view)
        title_length = len(title)
        if length == 0:
            tot_length = 80
        else:
            tot_length = title_length + length
        border = comment_char * tot_length
        mid = "{0}{0}{1}{0}{0}".format(
            comment_char,
            title.center(tot_length - 4)
        )
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
