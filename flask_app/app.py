from flask import Flask, render_template, request, jsonify
from flask_ngrok import run_with_ngrok
import pickle
import numpy as np

model = pickle.load(open('model1.pkl', 'rb'))

app = Flask(__name__)
run_with_ngrok(app)  

@app.route('/')
def man():
    return render_template('home.html')


@app.route('/predict', methods=['POST'])
def home():
    print(request.form)
    data1 = request.form['combustibleConsumido']
    data2 = request.form['km']
    data3 = request.form['emisionescape']
    data4 = request.form['capacidad']
    data5 = request.form['combustibleDiesel']
    data6 = request.form['combustibleGas']
    data7 = request.form['combustibleGasolina']
    data8 = request.form['camionFiat']
    data9 = request.form['camionMercedes']
    data10 = request.form['camionRenaut']
    data11 = request.form['camionVolkswagen']
    data12 = request.form['modeloAmarok']
    data13 = request.form['modeloCaddy']
    data14 = request.form['transmAutomatica']
    data15 = request.form['transmManual']
    arr = np.array([[data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15]])
    pred = model.predict(arr)
    return jsonify({'prediction': str(pred[0])})
    # return render_template('after.html', data=pred)


if __name__ == "__main__":
    app.run()















