#!/usr/bin/python3
#doc
from flask import Flask

app = Flask(__name__)


@app.route("/", strict_slashes=False)
def hello():
    return "Hello HBNB!"


@app.route("/hbnb", strict_slashes=False)
def hbnb():
    return "HBNB"


@app.route("/c/<text>", strict_slashes=False)
def c_is(text):
    return "C {}".format(text)


def hbnb():
    return "HBNB"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
