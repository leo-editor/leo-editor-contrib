# -*- coding: utf-8 -*-
"""Leonine pygments theme."""
from pygments.style import Style
from pygments.token import Comment, Generic, Keyword, Name, String
    # Error, Whitespace
from leo.core.leoColor import leo_color_database as d

def tr (color):
    '''Translate a Leo color name to a color constant.'''
    color = color.replace('-','')
    if color in d:
        return d.get(color)
    print('leonine.py: unknown color: %r, using white' % color)
    return d.get('white')

class LeonineStyle(Style):
    """Leonine pygments theme."""
    styles = {
        Comment:            'italic ' + tr('solarized-red'),
        Keyword:            tr('solarized-blue'),
        Name.Decorator:     tr('solarized-orange'),
        Name:               tr('white'),
        String:             tr('alt-solarized-green'),
        String.Interpol:    tr('alt-solarized-green'),
        #
        # Leo constructs...
        Name.Entity:        tr('solarized-blue'),
            # Defined section name.
        Name.Other:         'underline ' + tr('solarized-red'),
            # Undefined section name.
        #
        # For rest: see styles/markup.py
        Generic.Emph:           'italic ' + tr('solarized-blue'),
        Generic.Heading:        'underline ' + tr('solarized-magenta'), # Used??
        Generic.Strong:         'bold ' + tr('solarized-blue'),
        Name.Tag:               'italic ' + tr('solarized-magenta'), # Hyperlink
        #
        # For diff.
        Generic.Deleted:        tr('solarized-red'),
        Generic.Inserted:       tr('alt-solarized-green'),
        Generic.Subheading:     tr('solarized-magenta'), # @@ line.
        #
        # Remaining tokens from default...
        # Comment.Preproc:           "noitalic #BC7A00",
        # Error:                     "border:#FF0000",
        # Generic.Error:             "#FF0000",
        # Generic.Output:            "#888",
        # Generic.Prompt:            "bold #000080",
        # Generic.Subheading:        "bold #800080",
        # Generic.Traceback:         "#04D",
        # Keyword.Pseudo:            "nobold",
        # Keyword.Type:              "nobold #B00040",
        # Name.Attribute:            "#7D9029",
        # Name.Builtin:              "#008000",
        # Name.Class:                "bold #0000FF",
        # Name.Constant:             "#880000",
        # Name.Exception:            "bold #D2413A",
        # Name.Function:             "#0000FF",
        # Name.Label:                "#A0A000",
        # Name.Namespace:            "bold #0000FF",
        # Name.Tag:                  "bold #008000",
        # Name.Variable:             "#19177C",
        # Number:                    "#666666",
        # Operator.Word:             "bold #AA22FF",
        # Operator:                  "#666666",
        # String.Doc:                "italic",
        # String.Escape:             "bold #BB6622",
        # String.Interpol:           "bold #BB6688",
        # String.Other:              "#008000",
        # String.Regex:              "#BB6688",
        # String.Symbol:             "#19177C",
        # Whitespace:                "#bbbbbb",
    }

