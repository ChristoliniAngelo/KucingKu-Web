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
        return model_user, scaler_user, pca_user
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error loading models: {str(e)}")

app = FastAPI()

class UserRequest(BaseModel):
    Userlocation: str
    Userage: int
    Usergender: str

# Load models and preprocessing objects
model_user, scaler_user, pca_user = load_models()

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
        
        # Predict user cluster
        user_cluster = model_user.predict(user_features_pca)[0]
        
        return {"user_cluster": int(user_cluster)}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error predicting user cluster: {str(e)}")


if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
