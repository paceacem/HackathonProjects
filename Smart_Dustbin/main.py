import os, joblib, torch
from smart import CustomDataset, CustomResNet
from torch.utils.data import DataLoader
from PIL import Image
from torchvision import transforms
from tqdm import tqdm

mode = 2
num_class = 3
batch_size = 48

model = joblib.load('model.joblib')
folder_path = 'images/images'
test_data = CustomDataset(folder_path, mode, num_class)
test_dl = DataLoader(test_data, batch_size, shuffle=True)

correct = 0
total = 0
with torch.no_grad():
    for images, labels in tqdm(test_dl):
        if torch.cuda.is_available():
            images, labels = images.cuda(), labels.cuda()
            model = model.cuda()

        outputs = model(images)

        _, predicted = torch.max(outputs.data, 1)

        total += labels.size(0)
        correct += (predicted == labels).sum().item()
accuracy = (correct / total) * 100.0
print(f"accuracy: {accuracy}%")

