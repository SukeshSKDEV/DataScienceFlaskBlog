from flask import Flask, render_template, request, session, redirect
from werkzeug.utils import secure_filename
import json
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import os

with open('templates/config.json', "r") as c:
    params=json.load(c)["params"]

local_server=True

app = Flask(__name__)
app.secret_key = 'super secret key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
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

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    content=db.Column(db.String(120), nullable=False)
    date=db.Column(db.String(12), nullable=True)
    slug = db.Column(db.String(21), nullable=False)
    img_file = db.Column(db.String(21), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)



@app.route('/')
def home():
    posts=Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html',params=params,posts=posts)

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

@app.route('/post/<string:post_slug>',methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)

@app.route('/edit/<string:sno>',methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method=='POST':
            box_title=request.form.get('title')
            tline=request.form.get('tline')
            content=request.form.get('content')
            slug=request.form.get('slug')
            img_file=request.form.get('img_file')
            date=datetime.now()

            if sno=='0':
                post=Posts(title=box_title,slug=slug,content=content, tagline=tline,img_file=img_file,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.tagline=tline
                post.content=content
                post.slug=slug
                post.img_file=img_file
                post.date=date
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post)
@app.route('/dashboard',methods=['GET','POST'])
def login_dashboard():
    if 'user' in session and session['user']==params['admin_user']:
        posts=Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)

    if request.method=='POST':
        username=request.form.get('uname')
        password=request.form.get('pass')
        # REDIRECT TO ADMIN PANEL
        if username==params['admin_user'] and password==params['admin_password']:
            # set the session variable
            session['user']=username
            posts=Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)
    else:
        return render_template('login.html',params=params)

@app.route('/uploader',methods=['GET','POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method=='POST':
            f=request.files['fileupload']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
        return "Uploaded successfully"

@app.route('/delete/<string:sno>',methods=['GET','POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
            post=Posts.query.filter_by(sno=sno).first()
            db.session.delete(post)
            db.session.commit()
    return redirect('/dashboard')


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


if __name__ == "__main__":
    app.run(debug=True)