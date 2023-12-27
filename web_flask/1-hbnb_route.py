#!/usr/bin/python3
# route that display hbnb
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


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
