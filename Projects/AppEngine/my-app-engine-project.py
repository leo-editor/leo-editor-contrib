#@+leo-ver=5-thin
#@+node:ekr.20101106071931.2102: * @file my-app-engine-project.py
from google.appengine.ext import db
from google.appengine.ext import webapp
from google.appengine.ext.webapp import template
import wsgiref.handlers

if 0:
    print 'Content-Type: text/plain'
    print ''
    print 'Hello from Leo!'
# print webapp
# print wsgiref.handlers

#@+others
#@+node:ekr.20101106090932.2108: ** class myHandler
class MyHandler(webapp.RequestHandler):

    def get(self):
        shouts = db.GqlQuery(
            'SELECT * FROM Shout '
            'ORDER BY when DESC'
        )
        values = {'shouts':shouts}
        # self.response.out.write("hello!")
        self.response.out.write(
            # template.render('main.html',{}))
            template.render('main.html',values))

    def post(self):
        shout = Shout(
            message=self.request.get('message'),
            who=self.request.get('who'),
        )
        shout.put()
        # self.response.out.write('posted!')
        self.redirect('/')
#@+node:ekr.20101106095827.2502: ** class Shout(db.Model)
class Shout(db.Model):

    message = db.StringProperty(required=True)

    when = db.DateTimeProperty(auto_now_add=True)

    who = db.StringProperty()
#@+node:ekr.20101106090932.2109: ** main
def main():

    app = webapp.WSGIApplication(
        [(r'.*',MyHandler)],debug=False)

    wsgiref.handlers.CGIHandler().run(app)
#@-others

if __name__ == '__main__':

    main()
#@-leo
