__author__ = 'zhangbo'


from flask import Flask

app = Flask(__name__)

@app.route('/')

def hell():

    return 'h1'

if __name__ == '__main__':

    app.run(debug=True,host="192.168.5.54",port=5000)