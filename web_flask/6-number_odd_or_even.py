#!/usr/bin/python3
"""route that display “Python ”, followed by the value of the text"""
from flask import Flask, render_template

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
@app.route("/number/<int:n>", strict_slashes=False)
def is_num(n):
    """Print num"""
    return f"{int(n)} is a number"


@app.route("/number_template/<int:n>", strict_slashes=False)
def is_num_display_htmlpage(n):
    """Print num"""
    return render_template("5-number.html", n=n)


@app.route("/number_odd_or_even/<int:n>", strict_slashes=False)
def is_num_oddeven(n):
    """check if n is odd or even"""
    t = ""
    if n % 2 == 0:
        return render_template("6-number_odd_or_even.html", n=n, t="even")
    else:
        return render_template("6-number_odd_or_even.html", n=n, t="odd")


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
