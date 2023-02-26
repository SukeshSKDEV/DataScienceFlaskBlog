from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = 'mysql+pymysql://root:@localhost/data_science'
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
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html')

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

    return render_template('contact.html')

@app.route('/post')
def post():
    return render_template('post.html')

if __name__ == "__main__":
    app.run(debug=True)