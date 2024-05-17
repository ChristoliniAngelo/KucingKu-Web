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
    user_features = np.array([
        request.Userlocation,
        request.Userage,
        request.Usergender
    ]).reshape(1, -1)
    
    user_features_scaled = scaler_user.transform(user_features)
    user_features_pca = pca_user.transform(user_features_scaled)
    user_cluster = model_user.predict(user_features_pca)[0]
    
    recommended_cat_clusters = df[df['UserCluster'] == user_cluster]['ClusterKucing'].tolist()
    
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
