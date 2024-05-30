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

        model_kucing=joblib.load(r'Model ML\kucing\model_kucing.pkl')
        scaler_kucing=joblib.load(r'Model ML\kucing\scaler_kucing.pkl')
        pca_kucing=joblib.load(r'Model ML\kucing\pca_kucing.pkl')
        return model_user, scaler_user, pca_user,model_kucing,scaler_kucing,pca_kucing
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error loading models: {str(e)}")

app = FastAPI()

class UserRequest(BaseModel):
    Userlocation: str
    Userage: int
    Usergender: str

class KucingRequest(BaseModel):
    Jenis_Kelamin: str
    Umur: str
    Warna: str
    Status_Vaksinasi: str

# Load models and preprocessing objects
model_user, scaler_user, pca_user,model_kucing,scaler_kucing,pca_kucing = load_models()

# Load data for mapping
df_user = pd.read_csv(r'E:\KucingKu Web\Model ML\user\hasil_usercluster.csv')
mapping = df_user.groupby('ClusterUser ')['ClusterKucing'].apply(list).to_dict()

@app.post("/predict_user")
async def predict_user(request: UserRequest):
    try:
        # Perform preprocessing
        features = {
            'Userage': request.Userage,
            'Userlocation_Jakarta': True if request.Userlocation == 'Jakarta' else False,
            'Userlocation_Kota Lainnya': True if request.Userlocation == 'Kota Lainnya' else False,
            'Userlocation_Sidoarjo': True if request.Userlocation == 'Sidoarjo' else False,
            'Userlocation_Surabaya': True if request.Userlocation == 'Surabaya' else False,
            'Usergender_female': True if request.Usergender == 'Female' else False,
            'Usergender_male ': True if request.Usergender == 'Male' else False
        }
        
        # Transform features into a DataFrame
        user_features_df = pd.DataFrame(features, index=[0])
        
        # Perform scaling
        user_features_scaled = scaler_user.transform(user_features_df)
        
        # Perform PCA
        user_features_pca = pca_user.transform(user_features_scaled)
        
        # Predict kluster user
        user_cluster = model_user.predict(user_features_pca)[0]

        recommended_cat_clusters = mapping.get(user_cluster, [])
        
        return {"user_cluster": int(user_cluster), "recommended_cat_clusters": recommended_cat_clusters}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error predicting user cluster: {str(e)}")

@app.post("/predict_cat")
async def predict_cat (request : KucingRequest):
    try:
        # Perform preprocessing
        features = {
            'Jenis Kelamin_Betina': True if request.Jenis_Kelamin == 'Betina' else False,
            'Jenis Kelamin_Jantan': True if request.Jenis_Kelamin == 'Jantan' else False,
            'Umur_Adult': True if request.Umur == 'Adult' else False,
            'Umur_Baby': True if request.Umur == 'Baby' else False,
            'Umur_Young': True if request.Umur == 'Young' else False,
            'Warna_Abu-Abu': True if request.Warna =='Abu-Abu' else False,
            'Warna_Coklat': True if request.Warna == 'Coklat' else False,
            'Warna_Hitam': True if request.Warna == 'Hitam' else False,
            'Warna_Orange': True if request.Warna == 'Orange' else False,
            'Warna_Putih': True if request.Warna == 'Putih' else False,
            'Status Vaksinasi_Belum': True if request.Status_Vaksinasi == 'Belum' else False,
            'Status Vaksinasi_Sudah': True if request.Status_Vaksinasi == 'Sudah' else False
        }

        #ubah ke df
        Kucing_features_df = pd.DataFrame(features, index=[0])

        #scalling df
        Kucing_features_scaled = scaler_kucing.transform(Kucing_features_df)

        #PCA reduce df
        Kucing_features_pca = pca_kucing.transform(Kucing_features_scaled)

        #predict kluster sesuai referensi
        Kucing_cluster = model_kucing.predict(Kucing_features_pca)[0]

        return {"Kucing_cluster": int(Kucing_cluster)}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error predicting kucing cluster: {str(e)}")

if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
