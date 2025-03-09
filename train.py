from ultralytics import YOLO
import torch
print(torch.cuda.is_available())

# Load a model

model = YOLO('yolov8n-cls.pt') 

# Train the model
results = model.train(data='alzheimers_normal_dataset', epochs=50)
