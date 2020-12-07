from flask import Flask, render_template, request
import pickle
import numpy as np

model = pickle.load(open('model2.pkl', 'rb'))

app = Flask(__name__)



@app.route('/')
def man():
    return render_template('home.html')


@app.route('/predict', methods=['POST'])
def home():
    data2 = request.form['km']
    data3 = request.form['emision_escape']
    data4 = request.form['capacidad']
    data5 = request.form['tipo_combustible_diesel']
    data6 = request.form['tipo_combustible_gas']
    data7 = request.form['tipo_combustible_gasolina']
    data8 = request.form['marca_camion_Fiat']
    data9 = request.form['marca_camion_Mercedes']
    data10 = request.form['marca_camion_Renaut']
    data11 = request.form['marca_camion_Volkswagen']
    data12 = request.form['modelo_amarok']
    data13 = request.form['modelo_caddy']
    data14 = request.form['modelo_dacia dokker']
    data15 = request.form['modelo_ducato']
    data16 = request.form['modelo_fiorino']
    data17 = request.form['modelo_kangoo']
    data18 = request.form['modelo_sprinter']
    data19 = request.form['modelo_vito']
    data20 = request.form['tipo_transm_automatica']
    data21 = request.form['tipo_transm_manual']
    arr = np.array([[data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21]])
    pred = model.predict(arr)
    return render_template('after.html', data=pred)


if __name__ == "__main__":
    app.run(debug=True)















