#!/usr/bin/python3
"""route that display “Python ”, followed by the value of the text"""
from flask import Flask

app = Flask(__name__)


@app.route("/", strict_slashes=False)
def hello():
    """print hello hbnb"""

    return "Hello HBNB!"


@app.route("/hbnb", strict_slashes=False)
def hbnb():
    """print hbnb"""

    return "HBNB"


@app.route("/c/<text>", strict_slashes=False)
def c_is(text):
    """print text"""
    text = text.replace("_", " ")
    return "C {}".format(text)


@app.route("/python", strict_slashes=False)
@app.route("/python/<text>", strict_slashes=False)
def python_is(text="is cool"):
    """Print text"""
    text = text.replace("_", " ")
    return f"Python {text}"


# @app.route("/number", strict_slashes=False)
@app.route("/number/<n>", strict_slashes=False)
def is_num(n):
    """Print num"""
    if n.isdigit():
        return f"{int(n)} is a number"
    return ""


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
