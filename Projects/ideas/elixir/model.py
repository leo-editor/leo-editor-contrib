#@+leo-ver=5-thin
#@+node:ville.20110410112539.1460: * @file model.py
from elixir import *

metadata.bind = "sqlite:///movies.sqlite"
metadata.bind.echo = True

class Movie(Entity):
    title = Field(Unicode(30))
    year = Field(Integer)
    description = Field(UnicodeText)
    
    def __repr__(self):
        return '<Movie "%s" (%d)>' % (self.title, self.year)
#@-leo
