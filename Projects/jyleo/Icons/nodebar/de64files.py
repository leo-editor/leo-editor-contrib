import base64



nodeup = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAhqM
j6nL7QDcgVBS2u5dWqfeTWA4lqYnpeqqFgA7'''
nodedown = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAhuM
j6nL7Q2inLTaGW49Wqa+XBD1YE8GnOrKBgUAOw=='''
nodeleft = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAiOM
jwDIqd3Ug0dOam/MC3JdfR0jjuRHBWjKpUbmvlIsm65WAAA7'''
noderight = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAiGM
A3DLltrag/FMWi+WuiK9WWD4gdGYdenklUnrwqX8tQUAOw=='''
clone = r'''R0lGODlhEAAQAIABAP8AAP///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAhaM
j6nL7Q8jBDRWG8DThjvqSeJIlkgBADs='''
copy = r'''R0lGODlhEAAQAMIEAAAAAI9pLOcxcaCclf///////////////ywAAAAAEAAQAAADLEi63P5vSLiC
vYHiq6+wXSB8mQKcJ2GNLAssr0fCaOyB0IY/ekn9wKBwSEgAADs='''
cut = r'''R0lGODlhEAAQAKECAAAAAKCclf///////yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAA
EAAAAiaUDad7yS8cnDNYi4A0t7vNaCLTXR/ZZSBFrZMLbaIWzhLczCxTAAA7'''
paste = r'''R0lGODlhEAAQAKECAAAAAB89vP///////yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAA
EAAAAiOUH3nLktHYm9HMV92FWfPugQcgjqVBnmm5dsD7gmsbwfEZFQA7'''
insert = r'''R0lGODlhEAAQAKECAAAAAB89vP///////ywAAAAAEAAQAAACKJRhqSvIDGJ8yjWa5MQ5BX4JwXdo
3RiYRyeSjRqKmGZRVv3Q4M73VAEAOw=='''
demote = r'''R0lGODlhEAAQAKECACMj3ucxcf///////yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAA
EAAAAiiUj2nBrNniW+G4eSmulqssgAgoduYWeZ+kANPkCsBM1/abxLih70gBADs='''
promote = r'''R0lGODlhEAAQAKECACMj3ucxcf///////yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAA
EAAAAiWUj6kX7cvcgy1CUU1ecvJ+YUGIbKSJAAlqqGQLxPI8t29650YBADs='''
pasteclone = r'''R0lGODlhEAAQAKEDACMj3v8AAP/9/f///ywAAAAAEAAQAAACOJSPaTPgoxBzgEVDM4yZbtU91/R8
ClkJzGqp7MK21rcG9tYedSCb7sDjwRLAGs7HsPF8khjzcigAADs='''
hoist = r'''R0lGODlhEAAQAKECAAAAAENMzf/9/f/9/SwAAAAAEAAQAAACI5SPaRCtypp7S9rw4sVwzwQYW4ZY
JAWhqYqE7OG+QvzSrI0WADs='''
dehoist = r'''R0lGODlhEAAQAKECAAAAACMj3v/9/f/9/SH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAA
EAAAAiOUj6lrwOteivLQKi4LXCcOegJIBmIZLminklbLISIzQ9hbAAA7'''
question = r'''R0lGODlhEAAQAIABAB89vP///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAiCM
DwnHrNrcgzFQGuGrMnGEfdtnjKRJpt2SsuxZqqgaFQA7'''
sortchildren = r'''R0lGODlhEAAQAKECAAAAAB89vP/9/f/9/SwAAAAAEAAQAAACJJSPKcGt2NwzbKpqYcg68oN9ITde
UQCkKgCeCvutsDXPk/wlBQA7'''
sortsiblings = r'''R0lGODlhEAAQAKECAAAAAB89vP/9/f/9/SH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAA
EAAAAiWUFalxbatcS7IiZh3NE2L+fOAGXpknal4JlAIAw2Br0Fksu1YBADs='''
delete = r'''R0lGODlhEAAQAMIEAAAAAB89vKCclbq3sv///////////////yH+FUNyZWF0ZWQgd2l0aCBUaGUg
R0lNUAAsAAAAABAAEAAAAzJIutwKELoGVp02Xmy5294zDSSlBAupMleAEhoYuahaOq4yCPswvYQe
LyT0eYpEW8iRAAA7'''
moveup = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAh6M
j6nL7QDcgVDWcFfGUW3zfVPHPZHoUeq6Su4LwwUAOw=='''
movedown = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAh+M
j6nL7Q2inFS+EDFw2XT1eVsSHmGJdChpXesFx00BADs='''
moveleft = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAiWM
jwDIqd3egueFSe2lF2+oGV41fkwoZmNJJlxXvbDJSbKI1l4BADs='''
moveright = r'''R0lGODlhEAAQAIABAENMzf///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABAAEAAAAiWM
A3DLltqaSpFBWt3BFTovWeAyIiUinSNnkaf2Zagpo2x343IBADs='''

fd = { "nodeup.gif":nodeup, "nodedown.gif": nodedown, "nodeleft.gif":nodeleft, 
       "noderight.gif": noderight, "clone.gif": clone, "copy.gif":
       copy, "paste.gif": paste,
       "cut.gif": cut,
       "insert.gif": insert, "demote.gif": demote, "promote.gif": promote, "pasteclone.gif": pasteclone,
       "hoist.gif": hoist, "dehoist.gif": dehoist, 
       "question.gif": question, "sortchildren.gif": sortchildren, 
       "sortsiblings.gif": sortsiblings, "delete.gif": delete, "moveup.gif": moveup, 
        "movedown.gif": movedown, "moveleft.gif": moveleft, "moveright.gif": moveright }

for z in fd.keys():
    f = open( z, "w" )
    data = fd[ z ]
    bin = base64.decodestring( data )
    f.write( bin )
    f.close()
     

