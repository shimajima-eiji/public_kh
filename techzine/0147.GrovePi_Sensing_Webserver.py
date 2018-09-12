import flask
import grovepi

GROVEPI_CONNECT_D = 'your range(1-8)'
app = flask.Flask('sensor_api')

@app.route('/V1/environment')
def environment_handler():
    (temperature, humidity) = grovepi.dht(GROVEPI_CONNECT_D ,0)
    return flask.jsonify(temperature=temperature,humidity=humidity)

if __name__ == '__main__':
    app.run()
