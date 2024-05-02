from flask import Flask, request, jsonify
from keras.models import load_model
import numpy as np
import pandas as pd
import json

app = Flask(__name__)
model = load_model('model.h5')

@app.route('/predict', methods=['POST'])
def predict():
    # Mendapatkan data JSON dari request
    data = request.get_json()

    # Mendapatkan informasi lokasi pengguna
    user_location = data['user_location']

    # Menghapus informasi lokasi dari data
    del data['user_location']

    # Membuat DataFrame dari data
    data = pd.DataFrame(data, index=[0])

    # Menambahkan informasi lokasi sebagai kolom baru
    data['user_location'] = user_location

    # Lakukan prediksi dengan model
    prediction = model.predict(data)

    # Mengembalikan hasil prediksi dalam bentuk JSON
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    app.run(port=5000)
