from flask import Flask, render_template, request
import json
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail

with open('templates/config.json', "r") as c:
    params=json.load(c)["params"]

local_server=True

app = Flask(__name__)

# configuration of mail
app.config.update(MAIL_SERVER="smtp.gmail.com",
                  MAIL_PORT=465,
                  MAIL_USE_SSL=True,
                  MAIL_USERNAME=params['gmail-user'],
                  MAIL_PASSWORD=params['gmail-password'])
mail=Mail(app)

if local_server:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']

db = SQLAlchemy(app)

'''sno name phone_num msg date email'''

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num=db.Column(db.String(12), nullable=False)
    msg=db.Column(db.String(120), nullable=False)
    date=db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)



@app.route('/')
def home():
    return render_template('index.html',params=params)

@app.route('/about')
def about():
    return render_template('about.html',params=params)

@app.route('/contact',methods=['GET','POST'])
def contact():
    '''sno name phone_num msg date email'''
    if request.method=='POST':

        # entry into the database
        name=request.form['name']
        phone=request.form['phone']
        message=request.form['message']
        email=request.form['email']

        entry=Contacts(name=name,phone_num=phone,date=datetime.now(),msg=message,email=email)

        db.session.add(entry)
        db.session.commit()
        mail.send_message('new message from '+name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=message+"\n"+phone)

    return render_template('contact.html',params=params)

@app.route('/post')
def post():
    return render_template('post.html',params=params)

if __name__ == "__main__":
    app.run(debug=True)