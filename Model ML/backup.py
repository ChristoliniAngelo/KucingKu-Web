from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

# Load models and preprocessing objects
def load_models():
    try:
        model_user = joblib.load(r'Model ML\user\model_usercluster.pkl')
        scaler_user = joblib.load(r'Model ML\user\scaler_usercluster.pkl')
        pca_user = joblib.load(r'Model ML\user\pca_usercluster.pkl')

        model_kucing = joblib.load(r'Model ML\kucing\model_kucing.pkl')
        scaler_kucing = joblib.load(r'Model ML\kucing\scaler_kucing.pkl')
        pca_kucing = joblib.load(r'Model ML\kucing\pca_kucing.pkl')
        
        return model_user, scaler_user, pca_user, model_kucing, scaler_kucing, pca_kucing
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error loading models: {str(e)}")

app = FastAPI()

class UserRequest(BaseModel):
    Userlocation: str
    Userage: str
    Usergender: str

class KucingRequest(BaseModel):
    Jenis_Kelamin: str
    Umur: str
    Warna: str
    Status_Vaksinasi: str

# Load models and preprocessing objects
model_user, scaler_user, pca_user, model_kucing, scaler_kucing, pca_kucing = load_models()

# Load data for mapping
df_user = pd.read_csv(r'E:\KucingKu Web\Model ML\user\hasil_usercluster.csv')
mapping = df_user.groupby('ClusterUser ')['ClusterKucing'].apply(list).to_dict()

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

    # Ensure that the columns in the input data match the columns used during model training
    for column in df_user.columns:
        if column not in user_features_encoded.columns:
            user_features_encoded[column] = 0

    # Reorder the columns in the input data to match the columns used during model training
    user_features_encoded = user_features_encoded[df_user.columns]

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
    
    # Perform one-hot encoding on the input data
    kucing_features_df = pd.DataFrame(kucing_features, columns=['Jenis_Kelamin',
                                                                'Umur',
                                                                'Warna',
                                                                'Status_Vaksinasi'])
    kucing_features_encoded = pd.get_dummies(kucing_features_df)

    # Ensure that the columns in the input data match the columns used during model training
    for column in df_kucing.columns:
        if column not in kucing_features_encoded.columns:
            kucing_features_encoded[column] = 0

    # Reorder the columns in the input data to match the columns used during model training
    kucing_features_encoded = kucing_features_encoded[df_kucing.columns]

    # Transform using the scaler
    kucing_features_scaled = scaler_kucing.transform(kucing_features_encoded)

    # Transform using PCA
    kucing_features_pca = pca_kucing.transform(kucing_features_scaled)

    # Predict the cluster label
    kucing_cluster = model_kucing.predict(kucing_features_pca)[0]
    
    return {"kucing_cluster": int(kucing_cluster)}

if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
