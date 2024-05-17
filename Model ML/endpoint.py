from flask import Flask, request, jsonify
import pickle
import numpy as np
import pandas as pd

# Load models and preprocessing objects
with open('model_usercluster.pkl', 'rb') as f:
    model_user = pickle.load(f)
with open('pca_usercluster.pkl', 'rb') as f:
    pca_user = pickle.load(f)
with open('scaler_usercluster.pkl', 'rb') as f:
    scaler_user = pickle.load(f)

with open('model_kucing.pkl', 'rb') as f:
    model_kucing = pickle.load(f)
with open('pca_kucing.pkl', 'rb') as f:
    pca_kucing = pickle.load(f)
with open('scaler_kucing.pkl', 'rb') as f:
    scaler_kucing = pickle.load(f)

# Baca file CSV dan analisis pemetaan
df = pd.read_csv('hasil_usercluster.csv')
mapping = df.groupby('user_cluster')['cat_cluster'].apply(list).to_dict()

app = Flask(__name__)

@app.route('/predict_user', methods=['POST'])
def predict_user():
    data = request.get_json()
    user_features = np.array([
        data['Userlocation'],
        data['Userage'],
        data['Usergender']
    ]).reshape(1, -1)
    
    user_features_scaled = scaler_user.transform(user_features)
    user_features_pca = pca_user.transform(user_features_scaled)
    user_cluster = model_user.predict(user_features_pca)[0]
    
    recommended_cat_clusters = mapping.get(user_cluster, [])
    
    return jsonify({'user_cluster': int(user_cluster), 'recommended_cat_clusters': recommended_cat_clusters})

@app.route('/predict_kucing', methods=['POST'])
def predict_kucing():
    data = request.get_json()
    kucing_features = np.array([
        data['Jenis Kelamin'],
        data['Umur'],
        data['Warna'],
        data['Status Vaksinasi']
    ]).reshape(1, -1)
    
    kucing_features_scaled = scaler_kucing.transform(kucing_features)
    kucing_features_pca = pca_kucing.transform(kucing_features_scaled)
    kucing_cluster = model_kucing.predict(kucing_features_pca)
    
    return jsonify({'kucing_cluster': int(kucing_cluster[0])})

if __name__ == '__main__':
    app.run(debug=True)
