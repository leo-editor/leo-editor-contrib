<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="40" left="348" height="675" width="835"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ksylvan.20080515191541.3" str_leo_pos="1,1,3,3,0,0,0"><vh>Startup</vh>
<v t="ksylvan.20080515191541.2"><vh>@chapters</vh></v>
<v t="ksylvan.20080515191541.4"><vh>@button Test</vh></v>
<v t="ksylvan.20080515191541.5"><vh>@button Run all tests</vh></v>
</v>
<v t="ksylvan.20080515191541.6" a="E"><vh>Sudoku Puzzle Solver</vh>
<v t="ksylvan.20080515191541.7"><vh>@url http://en.wikipedia.org/wiki/Sudoku</vh></v>
<v t="ksylvan.20080515224942.2" a="E"
expanded="ksylvan.20080515230201.5,ksylvan.20080516211447.2,ksylvan.20080516211447.4,ksylvan.20080516211447.3,ksylvan.20080516211447.10,ksylvan.20080519195736.10,ksylvan.20080518114743.5,ksylvan.20080518114743.8,ksylvan.20080518114743.9,ksylvan.20080520181059.3,ksylvan.20080520222113.2,ksylvan.20080520222113.3,ksylvan.20080520222113.4,ksylvan.20080515230201.6,"><vh>@thin sudoku.py</vh></v>
<v t="ksylvan.20080516211447.6" a="E"><vh>Tests</vh>
<v t="ksylvan.20080516211447.7"><vh>Square</vh>
<v t="ksylvan.20080516211447.5"><vh>@test initialization</vh></v>
<v t="ksylvan.20080518114743.4"><vh>@test setters/getters</vh></v>
</v>
<v t="ksylvan.20080518114743.12"><vh>Board</vh>
<v t="ksylvan.20080518114743.13"><vh>@test initialization</vh></v>
<v t="ksylvan.20080520181059.2"><vh>@test load</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ksylvan.20080515191541.2"></t>
<t tx="ksylvan.20080515191541.3"></t>
<t tx="ksylvan.20080515191541.4">import leoTest
leoTest.doTests(c, all=False)</t>
<t tx="ksylvan.20080515191541.5">import leoTest
leoTest.doTests(c, all=True)</t>
<t tx="ksylvan.20080515191541.6">@ A Sudoku puzzle is a collection of squares (grouped into rows, columns and 3x3 squares) with the constraint that every group must contain all the numbers in the set 1-9.

This LEO outline constructs a python program to solve any given Sudoku puzzle.</t>
<t tx="ksylvan.20080515191541.7"></t>
<t tx="ksylvan.20080516211447.5">import sudoku
reload(sudoku)

s = sudoku.Square()
assert(s.value == 0)
assert(s.choices == range(1, 10))
s2 = sudoku.Square(choices = [1, 2, 3, 4])
assert(s2.choices == range(1, 5))
</t>
<t tx="ksylvan.20080516211447.6"></t>
<t tx="ksylvan.20080516211447.7"></t>
<t tx="ksylvan.20080518114743.4">import sudoku
reload(sudoku)

x = sudoku.Square()
assert(x.num_choices == 9)
x.elim_choice((1,3,5,7,9))
assert(x.num_choices == 4)
assert(x.value == 0)
x.elim_choice((2,4,6))
assert(x.value == 8)

</t>
<t tx="ksylvan.20080518114743.12"></t>
<t tx="ksylvan.20080518114743.13">import sudoku
reload(sudoku)

b = sudoku.Board()
assert(b.empty_num == 81)
</t>
<t tx="ksylvan.20080520181059.2">import sudoku
reload(sudoku)

b = sudoku.Board(load_from = ['   6 5   ', ' 9     4 ', '2 7   3 5',
    '  37528  ', '7       6', '  51964  ', '1 2   6 4', ' 7     1 ', '   3 8   '])
assert(b.squares[8][3].name == (8, 3))
assert(b.squares[8][3].value == 3)
assert(b.squares[8][8].value == 0)
b.solve()
assert(b.squares[8][8].value == 9)</t>
</tnodes>
</leo_file>
