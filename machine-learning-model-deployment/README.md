---
title: Machine Learning Model Deployment
aliases: [ML Deployment, Model Serving, MLOps]
tags: [#system-design,#ml,#devops]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Machine learning model deployment involves serving trained models in production environments, handling prediction requests, and managing model lifecycle. This includes containerization, scaling, monitoring, and continuous integration practices for reliable ML systems.

## Detailed Explanation

### Deployment Strategies

- **Batch Prediction**: Process data in batches for offline scenarios
- **Online Prediction**: Real-time inference for immediate responses
- **Edge Deployment**: Run models on edge devices
- **Hybrid Approach**: Combine batch and online methods

### Key Components

- **Model Registry**: Store and version trained models
- **Serving Infrastructure**: APIs and services for model inference
- **Monitoring**: Track model performance and drift
- **Scaling**: Handle varying prediction loads

### Challenges

- **Model Drift**: Changes in data distribution over time
- **Cold Start**: Latency for infrequently used models
- **Resource Management**: GPU/CPU allocation for inference
- **Version Control**: Managing multiple model versions

## Real-world Examples & Use Cases

### Recommendation System

Deploy a collaborative filtering model for product recommendations:

```python
# Flask API for model serving
from flask import Flask, request, jsonify
import joblib

app = Flask(__name__)
model = joblib.load('recommendation_model.pkl')

@app.route('/recommend', methods=['POST'])
def recommend():
    user_data = request.json
    recommendations = model.predict(user_data['user_id'])
    return jsonify({'recommendations': recommendations.tolist()})
```

### Image Classification Service

Serve a CNN model for real-time image classification:

```python
import tensorflow as tf
from PIL import Image
import numpy as np

class ImageClassifier:
    def __init__(self, model_path):
        self.model = tf.keras.models.load_model(model_path)
    
    def predict(self, image_bytes):
        image = Image.open(io.BytesIO(image_bytes))
        image = np.array(image.resize((224, 224))) / 255.0
        prediction = self.model.predict(np.expand_dims(image, axis=0))
        return np.argmax(prediction[0])
```

### Fraud Detection API

Deploy anomaly detection model for transaction monitoring:

```java
@RestController
public class FraudDetectionController {
    @Autowired
    private MLModelService mlService;
    
    @PostMapping("/detect-fraud")
    public FraudResult detectFraud(@RequestBody Transaction transaction) {
        double riskScore = mlService.predictFraudRisk(transaction);
        boolean isFraud = riskScore > 0.8;
        return new FraudResult(isFraud, riskScore);
    }
}
```

## Code Examples

### Docker Containerization

```dockerfile
# Dockerfile for ML model
FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY model.pkl .
COPY app.py .

EXPOSE 5000
CMD ["python", "app.py"]
```

### Kubernetes Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ml-model-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: ml-model
  template:
    metadata:
      labels:
        app: ml-model
    spec:
      containers:
      - name: ml-model
        image: my-ml-model:v1.0
        ports:
        - containerPort: 5000
        resources:
          requests:
            memory: "512Mi"
            cpu: "500m"
          limits:
            memory: "1Gi"
            cpu: "1000m"
```

### Model Monitoring

```python
import prometheus_client as prom

# Metrics for model monitoring
prediction_counter = prom.Counter('model_predictions_total', 'Total predictions', ['model_version'])
prediction_latency = prom.Histogram('model_prediction_latency_seconds', 'Prediction latency')

def monitor_prediction(model_version, prediction_func):
    @wraps(prediction_func)
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = prediction_func(*args, **kwargs)
        prediction_counter.labels(model_version).inc()
        prediction_latency.observe(time.time() - start_time)
        return result
    return wrapper
```

### A/B Testing Framework

```python
class ABTestingService:
    def __init__(self, models):
        self.models = models  # dict of model_name -> model_instance
    
    def predict_with_ab_test(self, features, user_id):
        model_name = self.get_model_for_user(user_id)
        model = self.models[model_name]
        return model.predict(features), model_name
    
    def get_model_for_user(self, user_id):
        # Simple A/B split based on user ID
        return 'model_v2' if hash(user_id) % 100 < 20 else 'model_v1'
```

## Tools & Libraries

- **TensorFlow Serving**: High-performance serving for TensorFlow models
- **TorchServe**: Model serving for PyTorch
- **Seldon Core**: Kubernetes-native model serving
- **MLflow**: Model lifecycle management
- **Kubeflow**: ML pipelines on Kubernetes

## References

- [TensorFlow Serving](https://www.tensorflow.org/tfx/guide/serving)
- [TorchServe Documentation](https://pytorch.org/serve/)
- [MLflow Model Registry](https://mlflow.org/docs/latest/model-registry.html)
- [Kubeflow Pipelines](https://www.kubeflow.org/docs/pipelines/)

## Github-README Links & Related Topics

- [Machine Learning in System Design](./machine-learning-in-system-design/README.md)
- [Serverless Architecture](./serverless-architecture/README.md)
- [Container Orchestration with Kubernetes](./system-design/container-orchestration-k8s/README.md)
- [Monitoring and Logging](./monitoring-and-logging/README.md)