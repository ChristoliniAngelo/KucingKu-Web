from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import numpy as np
import pandas as pd

# Load models and preprocessing objects
def load_models():
    try:
        model_user = joblib.load(r'Model ML\user\model_usercluster.pkl')
        pca_user = joblib.load(r'Model ML\user\pca_usercluster.pkl')
        scaler_user = joblib.load(r'Model ML\user\scaler_usercluster.pkl')

        model_kucing = joblib.load(r'Model ML\kucing\model_kucing.pkl')
        pca_kucing = joblib.load(r'Model ML\kucing\pca_kucing.pkl')
        scaler_kucing = joblib.load(r'Model ML\kucing\scaler_kucing.pkl')
        
        return model_user, pca_user, scaler_user, model_kucing, pca_kucing, scaler_kucing
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error loading models: {str(e)}")

app = FastAPI()

class UserRequest(BaseModel):
    Userlocation: int
    Userage: int
    Usergender: int

class KucingRequest(BaseModel):
    Jenis_Kelamin: int
    Umur: int
    Warna: int
    Status_Vaksinasi: int

# Load models and preprocessing objects
model_user, pca_user, scaler_user, model_kucing, pca_kucing, scaler_kucing = load_models()

# Load data and preprocess mapping
df = pd.read_csv(r'E:\KucingKu Web\Model ML\user\hasil_usercluster.csv')
mapping = df.groupby('UserCluster')['ClusterKucing'].apply(list).to_dict()

@app.post("/predict_user")
async def predict_user(request: UserRequest):
    # Create a DataFrame from the input data with only required columns
    user_features_df = pd.DataFrame({
        'Userlocation': [request.Userlocation],
        'Userage': [request.Userage],
        'Usergender': [request.Usergender]
    })

    # Perform one-hot encoding on the input data
    user_features_encoded = pd.get_dummies(user_features_df)

    # Adjust the columns in the input data to match the columns used during model training
    # If there are columns missing in the input data, add those columns with values of 0
    missing_columns = set(df.columns) - set(user_features_encoded.columns)
    for column in missing_columns:
        user_features_encoded[column] = 0

    # Reorder the columns in the input data to match the columns used during model training
    user_features_encoded = user_features_encoded[df.columns]

    # Transform using the scaler
    user_features_scaled = scaler_user.transform(user_features_encoded)

    # Transform using PCA
    user_features_pca = pca_user.transform(user_features_scaled)

    # Predict the cluster label
    user_cluster = model_user.predict(user_features_pca)[0]

    # Get the list of recommended cat clusters
    recommended_cat_clusters = mapping.get(user_cluster, [])

    return {"user_cluster": int(user_cluster), "recommended_cat_clusters": recommended_cat_clusters}

@app.post("/predict_kucing")
async def predict_kucing(request: KucingRequest):
    kucing_features = np.array([
        request.Jenis_Kelamin,
        request.Umur,
        request.Warna,
        request.Status_Vaksinasi
    ]).reshape(1, -1)
    
    kucing_features_scaled = scaler_kucing.transform(kucing_features)
    kucing_features_pca = pca_kucing.transform(kucing_features_scaled)
    kucing_cluster = model_kucing.predict(kucing_features_pca)[0]
    
    return {"kucing_cluster": int(kucing_cluster)}

if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)