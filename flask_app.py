from flask import Flask, render_template


app = Flask(__name__)


@app.route('/')
def index():
    return render_template('links.html')


@app.errorhandler(404)
def page_not_found(e):
    return 'Page not found', 404


@app.errorhandler(500)
def internal_error(exception):
    app.logger.exception(exception)
    return "Some Internal error has taken place."


if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
