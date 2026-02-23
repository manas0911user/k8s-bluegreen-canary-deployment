#!/bin/bash

echo "🚀 Starting Dev Environment..."

# Start Docker
echo "📦 Starting Docker..."
sudo systemctl start docker

# Start Minikube
echo "☸️ Starting Minikube..."
minikube start --driver=docker

# Use Minikube Docker Daemon
echo "🐳 Setting Minikube Docker env..."
eval $(minikube docker-env)

# Go to nginx-html and rebuild images
echo "🔨 Building Docker Images..."
cd nginx-html
docker build -t blue-nginx:1 .
docker build -t green-nginx:1 .

# Deploy Kubernetes files
echo "📡 Applying Kubernetes manifests..."
cd ../kubernetes
kubectl apply -f service.yaml
kubectl apply -f blue-deploy.yaml
kubectl apply -f green-deploy.yaml

# Open service in browser
echo "🌐 Opening Service..."
minikube service nginx

echo "✅ Dev Environment Ready!"

