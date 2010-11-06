#!/usr/bin/env python
#
# Copyright (C) 2008, Kayvan Sylvan <kayvan@sylvan.com>
#@+leo-ver=4-thin
#@+node:ksylvan.20080515224942.2:@thin sudoku.py
#@@first
#@@first
#@@first
#@@language python
#@@tabwidth -4

#@+at 
#@nonl
# A Literate program to solve any Sudoku puzzle.
#@-at
#@@c
#@<<docstring>>
#@+node:ksylvan.20080515230201.2:<<docstring>>
"""An implementation of a Sudoku puzzle solver.

See http://en.wikipedia.org/wiki/Sudoku for a good decription
of this puzzle."""
#@-node:ksylvan.20080515230201.2:<<docstring>>
#@nl

#@<<imports>>
#@+node:ksylvan.20080515230201.3:<<imports>>
import sys
from optparse import OptionParser
try:
    import Tkinter as tk
    import ScrolledText
    gui_available = True
except ImportError:
    gui_available = False
import time

#@-node:ksylvan.20080515230201.3:<<imports>>
#@nl

#@+others
#@+node:ksylvan.20080515230201.4:Constants
__author__ = "Kayvan Sylvan"
__version__ = "1.2"
__changelog__ = """
2008-05-15 0.1 Initial revision.
2008-05-19 0.2 Re-organized and simplified.
2008-05-20 0.3 Added main() and brute force search.
2008-05-21 1.0 Added ScrolledText and fixed small visual bugs.
2008-05-22 1.1 Fixed a small logic bug (look for more n-groups).
2008-05-22 1.2 Changed how we search (40% speedup on alescargot).
"""

#@-node:ksylvan.20080515230201.4:Constants
#@+node:ksylvan.20080515230201.5:Classes
#@+node:ksylvan.20080516211447.2:Square
#@+at 
#@nonl
# The Square object is the fundamental building block of a Sudoku puzzle. It 
# encapsulates the value and the remaining possible choices.
#@-at
#@@c
class Square(object):
    "The Square holds the possible choices."
    #@    <<Square cvars>>
    #@+node:ksylvan.20080516211447.4:<<Square cvars>>
    #@+others
    #@+node:ksylvan.20080516211447.9:_cache_choices
    _cache_choices = {}
    #@nonl
    #@-node:ksylvan.20080516211447.9:_cache_choices
    #@+node:ksylvan.20080516211447.11:_cache_bitmasks
    _cache_bitmasks = {}
    #@nonl
    #@-node:ksylvan.20080516211447.11:_cache_bitmasks
    #@+node:ksylvan.20080518114743.2:_cache_num_bits
    _cache_num_bits = {}
    #@nonl
    #@-node:ksylvan.20080518114743.2:_cache_num_bits
    #@-others

    #@-node:ksylvan.20080516211447.4:<<Square cvars>>
    #@nl
    #@    @+others
    #@+node:ksylvan.20080516211447.3:__init__
    def __init__(self, choices = None, name = None):
        """The initial setup of a Square is rather simple:

        The square encapsulates a list of possible choices.
        If not set, it defaults to 1 thru 9, inclusive.

        The name parameter is set by the caller and is a unique id;
        something like a (row, col) tuple."""
        if choices is None:
            choices = range(1, 10)
        self._setc(choices)
        self.name = name

    #@+node:ksylvan.20080516211447.8:_choices_to_bitmask
    def _choices_to_bitmask(self, v):
        """Change a choices list to a bitmask. e.g. If the Square
        object can only be 1, 2 or 3, the corresponding bitmask is 7 (0b111).
        Caches the results for later fast retrieval without re-computing."""
        k = "".join(map(str, v)) # We assume v is a sorted and unique list
        if k not in self._cache_choices: # do we need to compute it?
            or_it = lambda x, y: x | y
            b = self._cache_choices[k] = reduce(or_it, [2**(n-1) for n in v])
            self._cache_bitmasks[b] = v
        return self._cache_choices[k]

    #@-node:ksylvan.20080516211447.8:_choices_to_bitmask
    #@+node:ksylvan.20080516211447.12:_bitmask_to_choices
    def _bitmask_to_choices(self, v):
        "Turn a bitmask into a choices list."
        if v not in self._cache_bitmasks:
            l = [i for i in range(1, 10) if v & 2**(i - 1)]
            self._cache_bitmasks[v] = l
            k = "".join(map(str, l))
            self._cache_choices[k] = v
        return self._cache_bitmasks[v]

    #@-node:ksylvan.20080516211447.12:_bitmask_to_choices
    #@+node:ksylvan.20080518114743.3:_num_bits
    def _num_bits(self, v):
        "Return the number of bits in v. Caches results."
        if v not in self._cache_num_bits:
           b = sum([1 for i in range(1, 10) if v & 2**(i - 1)])
           self._cache_num_bits[v] = b
        return self._cache_num_bits[v]

    #@-node:ksylvan.20080518114743.3:_num_bits
    #@-node:ksylvan.20080516211447.3:__init__
    #@+node:ksylvan.20080516211447.10:properties (value, choices, num_choices)
    #@+at 
    #@nonl
    # The "choices" property is a convenience. Getting it returns the list of 
    # values that can be valid values for the current square. Setting it 
    # converts the list to the internal bitmask, which is stored in self._c
    # 
    # Similarly, getting the "value" property is mostly syntactic sugar. It 
    # returns 0 for an empty square (i.e. a square with multiple choices) and 
    # the value (1-9) if there is only one choice for the object. Setting the 
    # value, on the other hand, checks the proposed input against the possible 
    # choices first, then sets the choices to a 1-item list.
    #@-at
    #@@c
    #@+others
    #@+node:ksylvan.20080516211447.14:_getc, _setc and _get_num
    def _getc(self):
        "Return _c as a tuple of choices."
        return self._bitmask_to_choices(self._c)

    def _setc(self, v):
        "Set the _c bitmask. May set the value if no more choices remain."
        if filter(lambda x: x < 1 or x > 9, v):
            raise ValueError, "Bad values in choices list: %s" % (v,)
        self._c = self._choices_to_bitmask(v)

    def _get_num(self):
        "Return the number of bits in _c (number of choices)."
        return self._num_bits(self._c)
    #@-node:ksylvan.20080516211447.14:_getc, _setc and _get_num
    #@+node:ksylvan.20080516211447.13:_getv and _setv
    def _getv(self):
        "If only one choice, return it, otherwise 0 (empty) or -1."
        c = self.choices
        if len(c) > 1:
            return 0
        elif c:
            return c[0]
        else:
            return -1 # No choices here!

    def _setv(self, v):
        "Entirely equivalent to setting choices to a 1-tuple."
        b = 2 ** (v - 1)
        if self._c & b: # Valid choice
            self._c = b
        else:
            c = self.choices
            raise ValueError, "Tried to set %s, choices: %s" % (v, c)
    #@-node:ksylvan.20080516211447.13:_getv and _setv
    #@-others

    choices = property(_getc, _setc, None,
        "The list of possible choices.")

    num_choices = property(_get_num, None, None,
        "Read-only attribute (number of choices for Square).")

    value = property(_getv, _setv, None,
        "The value of the Square (0 for empty).")

    #@-node:ksylvan.20080516211447.10:properties (value, choices, num_choices)
    #@+node:ksylvan.20080519195736.4:__int__
    __int__ = _getv # integer conversion

    #@-node:ksylvan.20080519195736.4:__int__
    #@+node:ksylvan.20080518114743.10:__repr__ and __str__
    def __repr__(self):
        "Printable version of a Square, suitable to eval."
        c = self.__class__
        return "".join([c.__module__, ".", c.__name__, "(",
            "choices = ", str(self.choices),
            ", name = ", str(self.name), ")"])

    def __str__(self):
        "Blank for empty or the number in the Square."
        v = self.value
        if v > 0:
            return str(v)
        elif v < 0:
            return "X"
        else:
            return " "

    #@-node:ksylvan.20080518114743.10:__repr__ and __str__
    #@+node:ksylvan.20080517203352.2:elim_choice
    def elim_choice(self, n):
        "Eliminate a choice or a list of choices."
        if type(n) is type(1): # Simple integer
            b = 2 ** (n - 1)
        else:
            b = self._choices_to_bitmask(n)
        inv_mask = 511 ^ b
        self._c = self._c & inv_mask

    #@-node:ksylvan.20080517203352.2:elim_choice
    #@-others

#@-node:ksylvan.20080516211447.2:Square
#@+node:ksylvan.20080519195736.10:Combinatoric
#@+at 
#@nonl
# The Combinatoric class just encapsulates a few utility functions.
#@-at
#@@c
class Combinatoric:
    "Utility functions from Combinatorics."
    #@    @+others
    #@+node:ksylvan.20080519195736.15:comb
    def comb(self, n, m):
        "Return unique combinations of n things m at a time."
        funcs = {
            1: (lambda n: dict([('%d' % (i,), (i,)) for i in range(n)])),
            2: self.comb2,
            3: self.comb3,
            4: self.comb4,
            5: self.comb5,
            6: self.comb6,
            7: self.comb7,
            8: self.comb8
        }
        if m in funcs:
            return funcs[m](n)
        else:
            raise ValueError, "second arg: %d, illegal value" % (m,)

    #@-node:ksylvan.20080519195736.15:comb
    #@+node:ksylvan.20080519195736.11:comb2
    #@+at 
    #@nonl
    # Based on David Eppstein's beautiful function, referenced in the 
    # following web page: http://xahlee.org/perl-python/combinatorics.html
    #@-at
    #@@c
    def comb2(self, n):
        "Return all possible unordered pairs of n numbers."
        return dict([('%d,%d' % (i, j), (i, j)) for j in range(n)
            for i in range(j)])

    #@-node:ksylvan.20080519195736.11:comb2
    #@+node:ksylvan.20080519195736.12:comb3
    def comb3(self, n):
        "Returns all possible (unordered) triples out of n numbers"
        return dict([('%d,%d,%d' % (i, j, k), (i, j, k))
            for k in range(n) for j in range(k) for i in range(j)])

    #@-node:ksylvan.20080519195736.12:comb3
    #@+node:ksylvan.20080519195736.13:comb4
    def comb4(self, n):
        "Returns all possible (unordered) quadruples out of n numbers"
        return dict([('%d,%d,%d,%d' % (i, j, k, l), (i, j, k, l))
            for l in range(n) for k in range(l)
                for j in range(k) for i in range(j)])

    #@-node:ksylvan.20080519195736.13:comb4
    #@+node:ksylvan.20080521233852.2:comb5
    def comb5(self, n):
        "Returns all possible (unordered) 5-tuples out of n numbers"
        return dict([('%d,%d,%d,%d,%d' % (x1, x2, x3, x4, x5),
            (x1, x2, x3, x4, x5))
            for x5 in range(n) for x4 in range(x5)
                for x3 in range(x4) for x2 in range(x3)
                for x1 in range(x2)])

    #@-node:ksylvan.20080521233852.2:comb5
    #@+node:ksylvan.20080521233852.3:comb6
    def comb6(self, n):
        "Returns all possible (unordered) 6-tuples out of n numbers"
        return dict([('%d,%d,%d,%d,%d,%d' % (x1, x2, x3, x4, x5, x6),
            (x1, x2, x3, x4, x5, x6))
            for x6 in range(n)
                for x5 in range(x6)
                for x4 in range(x5)
                for x3 in range(x4)
                for x2 in range(x3)
                for x1 in range(x2)])

    #@-node:ksylvan.20080521233852.3:comb6
    #@+node:ksylvan.20080521233852.4:comb7
    def comb7(self, n):
        "Returns all possible (unordered) 7-tuples out of n numbers"
        return dict([('%d,%d,%d,%d,%d,%d,%d' % (x1, x2, x3, x4, x5, x6, x7),
            (x1, x2, x3, x4, x5, x6, x7))
            for x7 in range(n)
                for x6 in range(x7)
                for x5 in range(x6)
                for x4 in range(x5)
                for x3 in range(x4)
                for x2 in range(x3)
                for x1 in range(x2)])
    #@-node:ksylvan.20080521233852.4:comb7
    #@+node:ksylvan.20080521233852.5:comb8
    def comb8(self, n):
        "Returns all possible (unordered) 8-tuples out of n numbers"
        return dict([('%d,%d,%d,%d,%d,%d,%d,%d' %
            (x1, x2, x3, x4, x5, x6, x7, x8),
            (x1, x2, x3, x4, x5, x6, x7, x8))
            for x8 in range(n)
                for x7 in range(x8)
                for x6 in range(x7)
                for x5 in range(x6)
                for x4 in range(x5)
                for x3 in range(x4)
                for x2 in range(x3)
                for x1 in range(x2)])
    #@-node:ksylvan.20080521233852.5:comb8
    #@-others

#@-node:ksylvan.20080519195736.10:Combinatoric
#@+node:ksylvan.20080518114743.5:Board
#@+at 
#@nonl
# A Board is a container for Square objects, with some additional constraints.
#@-at
#@@c
class Board(object):
    "A Board is a Square container."
    #@    @+others
    #@+node:ksylvan.20080518114743.8:__init__
    def __init__(self, load_file = None, load_from = None):
            """The Board object is basically a group of interrelated Square
            objects. Optional named arguments to the __init__ method are:

            load_file: Read lines from the given filename.
            Each line represents a row of the 9x9 board.

            load_from: Read lines from the given object. The object passed
            in must support iteration (file object, sequence, etc)."""
            self.init() # Set up the empty Board
            if load_from:
                self.load(load_from)
            elif load_file:
                self.report("(Loading " + load_file + ")\n")
                f = open(load_file)
                self.load(f)
                f.close()

    #@+node:ksylvan.20080518114743.9:init
    def init(self):
        "Set up an empty Board."
        self.squares = []
        self.empty_num = 81
        for r in range(9):
            self.squares.append([Square(name = (r, i)) for i in range(9)])
        self.original = {} # Dict with entry for each loaded position
        self.search_level = 0
        #@    @+others
        #@+node:ksylvan.20080518114743.11:Set up groups
        #@+at 
        #@nonl
        # "groups" is a dictionary object that points to the row, column and 
        # mini-square groupings of Square objects. All the objects in a group 
        # must conform to the constraint that the numbers 1-9 are represented 
        # once in each group. This constraint is part of the definition of the 
        # Sudoku puzzle.
        #@-at
        #@@c
        self.groups = {}
        for r in range(9):
            self.groups["row%d" % r] = self.squares[r]
        for c in range(9):
            self.groups["col%d" % c] = [self.squares[r][c] for r in range(9)]
        for x in range(0, 9, 3):
            for y in range(0, 9, 3):
                self.groups["sq%d%d" % (x, y)] = [self.squares[r][c]
                    for r in range(x, x + 3) for c in range(y, y + 3)]
        #@nonl
        #@-node:ksylvan.20080518114743.11:Set up groups
        #@-others

    #@-node:ksylvan.20080518114743.9:init
    #@+node:ksylvan.20080519195736.2:load
    def load(self, src):
        "Load the Board object, using the given iterable."
        for x, row in enumerate(src):
            if x > 8: break
            for y, c in enumerate(row):
                if y > 8: break
                try:
                    c = int(c)
                except ValueError:
                    pass
                else:
                    self.original[(x, y)] = c
                    self.set(x, y, c, "Load: %s <- %s")

    #@-node:ksylvan.20080519195736.2:load
    #@-node:ksylvan.20080518114743.8:__init__
    #@+node:ksylvan.20080519195736.3:set
    def set(self, x, y, c, msg = "%s <- %s"):
        "Set the square at (x, y) to c."
        if not int(self.squares[x][y]):
            self.squares[x][y].value = c
            self.empty_num -= 1
            self.render(x, y, c, msg % ((x, y), c))

    #@-node:ksylvan.20080519195736.3:set
    #@+node:ksylvan.20080519195736.5:__repr__
    def __repr__(self):
        "Printable version of a Board, suitable to eval."
        c = self.__class__
        l = ["".join([str(self.squares[x][y]) for y in range(9)])
                for x in range(9)]
        return "".join([c.__module__, ".", c.__name__, "(",
            "load_from = ", str(l)])

    #@-node:ksylvan.20080519195736.5:__repr__
    #@+node:ksylvan.20080519195736.7:__str__
    def __str__(self):
        "Human printable version of Board object"
        sep = "".join(["|---" * 9, "|\n"])
        l = [ sep ]
        for r in range(9):
            row = []
            for c in range(9):
                if (r, c) in self.original:
                    v = "(" + str(self.squares[r][c]) + ")"
                else:
                    v = " " + str(self.squares[r][c]) + " "
                row.append(v)
            l.append("".join(["|", "|".join(row), "|\n"]))
            l.append(sep)
        return "".join(l)

    #@-node:ksylvan.20080519195736.7:__str__
    #@+node:ksylvan.20080521233852.6:_total_num_choices
    def _total_num_choices(self):
        "Returns the sum of all the numbers of choices for all Squares."
        return sum([self.squares[i][j].num_choices for i in range(9)
            for j in range(9)])
    #@nonl
    #@-node:ksylvan.20080521233852.6:_total_num_choices
    #@+node:ksylvan.20080519195736.8:solve
    #@+at 
    #@nonl
    # In order to solve the Sudoku puzzle after it is loaded, we must first 
    # scan and eliminate choices from the Square objects. We start with the 
    # idea that if a group of n Square objects in a "related group" contain 
    # exactly n distinct choices between them, then those same n choices can 
    # not also be a valid choice of any other members of the related group. A 
    # related group is a row, a column or a mini-square.
    # 
    # This idea can be applied starting with a 1-group (a single Square with 
    # only one choice), all the way to an 8-group.
    #@-at
    #@@c
    def solve(self):
        "Solve the puzzle."
        while self.empty_num:
            e = self._total_num_choices()
            for n in range(1, 9):
                self.elim_in_groups(n)
            if e == self._total_num_choices():
                break   # No point in continuing
        if self.empty_num:
            self.search_level += 1
            self.search()
            self.search_level -= 1
        if not self.empty_num and not self.search_level:
            self.report("\nSuccess! Puzzle solved!")

    #@-node:ksylvan.20080519195736.8:solve
    #@+node:ksylvan.20080519195736.14:elim_in_groups
    #@+at 
    #@nonl
    # Look for complete groups and eliminate choices from others.
    #@-at
    #@@c
    def elim_in_groups(self, n):
        "Look for complete n-groups and eliminate choices"
        if self.empty_num is 0: return
        cf = Combinatoric()
        for (gname, slist) in self.groups.iteritems():
            l = [s for s in slist if s.num_choices <= n]
            if len(l) < n: continue # short-circuit
            look_at_sets = cf.comb(len(l), n).values()
            for look_at in look_at_sets:
                bit_union = lambda x, y: x | y
                c = reduce(bit_union, [l[i]._c for i in look_at])
                if l[0]._num_bits(c) == n: # complete group
                    complete_list = [l[i] for i in look_at]
                    for i, s in enumerate(slist):
                        if s in complete_list: continue
                        self.elim_choices(s, c, gname)

    #@-node:ksylvan.20080519195736.14:elim_in_groups
    #@+node:ksylvan.20080519195736.16:elim_choices
    def elim_choices(self, square, choice_bitmask, group_name):
        "Eliminate the choices from the square."
        num = square.num_choices # before elimination
        bmask = 511 ^ choice_bitmask
        square._c = square._c & bmask
        if num != square.num_choices:
            if square.num_choices is 1:
                clist = square._bitmask_to_choices(choice_bitmask)
                msg = "%s <- %s (eliminated %s in %s)" % (
                    square.name, square.value, clist, group_name)
                x, y = square.name
                self.render(x, y, square.value, msg)
                self.empty_num -= 1
            elif square.num_choices is 0:
                clist = square._bitmask_to_choices(choice_bitmask)
                msg = "%s: No choices (eliminated %s in %s)" % (
                    square.name, clist, group_name)
                raise ValueError, msg

    #@-node:ksylvan.20080519195736.16:elim_choices
    #@+node:ksylvan.20080520181059.3:search
    #@+at 
    #@nonl
    # Having exhausted the elimination route, we now have to do a brute force 
    # search.
    #@-at
    #@@c
    def search(self):
        "Brute force search, recursively."
        #@    <<set s to an empty square>>
        #@+node:ksylvan.20080522152137.2:<<set s to an empty square>>
        #@+at 
        #@nonl
        # Here, we pick an empty square with a minimal number of choices.
        #@-at
        #@@c
        l = [self.squares[r][c] for r in range(9)
            for c in range(9) if self.squares[r][c].num_choices > 1]
        l.sort(cmp = lambda x, y: cmp(x.num_choices, y.num_choices))
        s = l[0]
        #@nonl
        #@-node:ksylvan.20080522152137.2:<<set s to an empty square>>
        #@nl
        for t in s.choices:
            try:
                self.save()
                x, y = s.name
                self.set(x, y, t, "Trying %s <- %s")
                self.solve()
            except ValueError:
                self.restore()
            if self.empty_num is 0:
                break
        if self.empty_num:
            raise ValueError, "No solution found."

        self.trash_stack()

    #@-node:ksylvan.20080520181059.3:search
    #@+node:ksylvan.20080520181059.4:save, restore, trash_stack
    def save(self):
        "Save the current state onto a stack."
        sq = self.squares
        to_save = (self.empty_num, self.search_level,
            [[sq[i][j]._c for j in range(9)] for i in range(9)])
        try:
            self._save_stack.append(to_save)
        except AttributeError:
            self._save_stack = [to_save]
        n = len(self._save_stack)
        self.report("".join([" " * n, str(n),
            "-> Saved state. empty_num = ", str(self.empty_num)]))

    def restore(self):
        "Restore the saved state."
        to_restore = self._save_stack.pop()
        self.empty_num = to_restore[0]
        self.search_level = to_restore[1]
        t = to_restore[2]
        for i, l in enumerate(t):
            for j, c in enumerate(l):
                self.squares[i][j]._c = c
        n = len(self._save_stack) + 1
        self.redraw("".join([" " * n, str(n),
            "<- Restored state. empty_num = ", str(self.empty_num)]))

    def trash_stack(self):
        "Throw away the saved state."
        self._save_stack = []

    #@-node:ksylvan.20080520181059.4:save, restore, trash_stack
    #@+node:ksylvan.20080520181059.5:render, redraw and report
    #@+at 
    #@nonl
    # This is here to make it easy to plug in a GUI. The basic idea is that 
    # this method will render the given change, possibly also reporting on the 
    # change (in a text box or on the console).
    #@-at
    #@@c
    def render(self, x, y, c, msg):
        "Render the given change. In Board, just print the message."
        self.report(msg)

    def redraw(self, msg):
        "Redraw the board. Called by restore."
        self.report(msg)
        print self

    def report(self, msg):
        "Only report the message"
        if msg:
            print msg

    #@-node:ksylvan.20080520181059.5:render, redraw and report
    #@-others

#@-node:ksylvan.20080518114743.5:Board
#@+node:ksylvan.20080520222113.2:TkBoard
#@+at 
#@nonl
# TkBoard is a straightforward subclass of the Board class, adding the Tk GUI.
#@-at
#@@c
class TkBoard(Board):
    "A Tk GUI version of the Board class."
    #@    @+others
    #@+node:ksylvan.20080520222113.3:__init__
    def __init__(self, load_file = None,
        load_from = None, delay = 0.005):
        "Set up the GUI and call the super __init__."
        #@    <<Set up GUI>>
        #@+node:ksylvan.20080520222113.4:<<Set up GUI>>
        self.root = tk.Tk()
        self.root.title("Sudoku")
        self.f = tk.Frame(self.root)
        self.f["padx"] = 5
        self.f["pady"] = 5
        self.tksquares = []
        #@+others
        #@+node:ksylvan.20080520222113.5:Set up the board array
        sq = self.tksquares
        for row in range(9):
            sq.append([tk.Button(self.f,
                {"text":" ", "font":('Courier', '-12', 'bold')})
                for col in range(9)])
        for row in range(9):
            for col in range(9):
                sq[row][col]["bg"] = "white"
                sq[row][col]["text"] = " "
                sq[row][col].grid(row = row, column = col)
        #@nonl
        #@-node:ksylvan.20080520222113.5:Set up the board array
        #@+node:ksylvan.20080520222113.6:Solve Button
        self.f2 = tk.Frame(self.root)
        self.run = tk.Button(self.f2, command = self.solve_in_try)
        self.run.config({"text" : "Solve", "bg" : "green"})
        self.run.grid(row = 1, column = 4)
        self.f2["pady"] = 5
        self.f2.pack(side = tk.BOTTOM)
        #@nonl
        #@-node:ksylvan.20080520222113.6:Solve Button
        #@+node:ksylvan.20080521005521.3:Report pane
        self.log = ScrolledText.ScrolledText(self.root,
            height = 20, width=60,
            state="disabled")
        self.log.pack(side = tk.RIGHT)
        #@nonl
        #@-node:ksylvan.20080521005521.3:Report pane
        #@-others
        #@nonl
        #@-node:ksylvan.20080520222113.4:<<Set up GUI>>
        #@nl
        self.f.pack()
        self.delay = 0 # No delay while loading
        super(TkBoard, self).__init__(load_file = load_file,
            load_from = load_from)
        self.delay = delay
        self.root.mainloop()

    #@-node:ksylvan.20080520222113.3:__init__
    #@+node:ksylvan.20080520222113.7:render, redraw and report
    #@+at 
    #@nonl
    # Here, we plug in the Tk code to give graphical feedback while solving 
    # the puzzle.
    #@-at
    #@@c
    def render(self, x, y, c, msg):
        "Render the given change."
        self.tksquares[x][y]["text"] = c
        if (x, y) in self.original:
            self.tksquares[x][y]["bg"] = "pink"
        if c == "X":
            self.tksquares[x][y]["bg"] = "red"
        self.report(msg)
        if self.delay:
            self.root.update()
            time.sleep(self.delay)

    def redraw(self, msg):
        "Redraw the board. Called by restore."
        saved, self.delay = self.delay, 0
        for i in range(9):
            for j in range(9):
                v = self.squares[i][j].value
                if v is 0:
                    v = " "
                elif v < 0:
                    v = "X"
                self.render(i, j, v, "")
        self.delay = saved
        self.root.update()
        self.report(msg)

    def report(self, msg):
        "Only report the message"
        if msg:
            self.log["state"] = "normal"
            self.log.insert(ScrolledText.END, msg + "\n")
            self.log["state"] = "disabled"

    #@-node:ksylvan.20080520222113.7:render, redraw and report
    #@+node:ksylvan.20080521005521.2:solve_in_try
    def solve_in_try(self):
        "Solve in a try/except block."
        try:
            self.solve()
        except ValueError, e:
            try:
                m = e.message
            except AttributeError:
                m = e.args[0]
            self.redraw("\nNo solution: " + m)
            self.run["state"] = "disabled"

    #@-node:ksylvan.20080521005521.2:solve_in_try
    #@-others

#@-node:ksylvan.20080520222113.2:TkBoard
#@-node:ksylvan.20080515230201.5:Classes
#@+node:ksylvan.20080515230201.6:Internal Functions
def main():
    "Main entry point."
    if gui_available:
        #@        <<Parse GUI related options>>
        #@+node:ksylvan.20080522160401.2:<<Parse GUI related options>>
        parser = OptionParser()
        parser.add_option("-n", "--no-gui", default = False,
            action = "store_true", dest = "no_gui",
            help = "No GUI Board (output to stdout only).")
        parser.add_option("-d", "--delay", default = "0.005",
            dest = "delay",
            help = "Delay seconds between update of squares (default 0.005)")
        (opts, args) = parser.parse_args()
        #@nonl
        #@-node:ksylvan.20080522160401.2:<<Parse GUI related options>>
        #@nl
    else:
        print "Warning: No Tkinter module loaded (no GUI option here)."
        args = sys.argv[1:]
    for f in args:
        if not gui_available or opts.no_gui:
            b = Board(f)
            try:
                b.solve()
                b.redraw("")
            except ValueError, e:
                try:
                    m = e.message
                except AttributeError:
                    m = e.args[0]
                b.redraw("\nNo solution: " + m)
        else:
            b = TkBoard(f, delay = float(opts.delay))
#@-node:ksylvan.20080515230201.6:Internal Functions
#@-others

if __name__ == '__main__':
    status = main()
    sys.exit(status)
#@-node:ksylvan.20080515224942.2:@thin sudoku.py
#@-leo
