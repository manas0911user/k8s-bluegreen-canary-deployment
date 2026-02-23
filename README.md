# 🚀 Blue-Green & Canary Deployments using GitHub Actions (Local Kubernetes)

![Kubernetes](https://img.shields.io/badge/Kubernetes-Local-blue)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue)
![CI/CD](https://img.shields.io/badge/GitHubActions-AutoCanary-success)
![License](https://img.shields.io/badge/License-MIT-green)

---

# 📚 Table of Contents

1. Project Overview
2. Why Progressive Delivery?
3. Blue-Green Deployment Explained
4. Canary Deployment Explained
5. Architecture Flow
6. Folder Structure
7. Prerequisites
8. Complete Local Setup Guide
9. Docker Image Creation
10. Kubernetes Deployment Guide
11. GitHub Actions Auto Canary Pipeline
12. Deployment Flow Explained
13. Troubleshooting
14. Demo
15. Key Features
16. License

---

# 📌 Project Overview

> This repository demonstrates **Blue-Green** and **Canary deployment strategies** using Kubernetes with a fully **FREE local setup**.

The project simulates production-grade DevOps workflows using:

* Docker containers
* Kubernetes deployments
* GitHub Actions automation
* Progressive delivery concepts

No Azure, no paid cloud — everything runs locally.

---

# 💡 Why Progressive Delivery?

Traditional deployments replace applications instantly which may cause downtime.

Progressive delivery strategies like Blue-Green and Canary allow:

* Gradual rollout
* Testing in real environments
* Safe deployment validation
* Easy rollback

---

# 🔵 Blue-Green Deployment Explained

![BlueGreen](img/blue-green-deployment-process.gif)

> Blue-Green deployment maintains two environments.

### Terminology

* **Blue Environment** → Stable production version
* **Green Environment** → New candidate version

Traffic shifts only after validation.

### Benefits

* Zero downtime deployments
* Instant rollback
* Production-level safety

---

# 🟡 Canary Deployment Explained

![Canary](img/canary-deploy.gif)

> Canary deployment releases updates gradually.

Instead of switching all users at once:

* Small percentage → new version
* Monitor behaviour
* Promote or rollback

### Why Canary?

* Detect issues early
* Reduce blast radius
* Improve release confidence

---

# 🏗️ Architecture Flow

```
User Request
     │
     ▼
Kubernetes NodePort Service
     │
 ┌───┴────────────┐
 │                │
Blue Pods      Green Pods
Stable         Canary
```

GitHub Actions automatically builds images and deploys them.

---

# 📂 Folder Structure

```
.github/workflows/
kubernetes/
nginx-html/
img/
scripts/start-dev.sh
LICENSE.md
README.md
```

---

# ⚙️ Prerequisites

Install the following tools:

* Docker
* kubectl
* Minikube
* Git

Verify installation:

```
docker --version
kubectl version --client
minikube version
```

---

# 🧰 Complete Local Setup Guide

## Step 1 — Start Docker

```
sudo systemctl start docker
```

---

## Step 2 — Start Minikube Cluster

```
minikube start --driver=docker
```

Verify:

```
kubectl get nodes
```

---

## Step 3 — Enable Minikube Docker Environment

```
eval $(minikube docker-env)
```

This ensures images build inside Kubernetes.

---

## Step 4 — One Command Startup

```
./scripts/start-dev.sh
```

This script will:

* Start Docker
* Start Kubernetes
* Build Images
* Deploy Services

---

# 🐳 Docker Image Creation

Navigate to project:

```
cd nginx-html
```

Build Blue Version:

```
docker build -t blue-nginx:1 .
```

Modify `index.html` for new version.

Build Green Version:

```
docker build -t green-nginx:1 .
```

---

# ☸️ Kubernetes Deployment Guide

Apply Service:

```
kubectl apply -f kubernetes/service.yaml
```

Deploy Blue Version:

```
kubectl apply -f kubernetes/blue-deploy.yaml
```

Deploy Green Version:

```
kubectl apply -f kubernetes/green-deploy.yaml
```

Check Pods:

```
kubectl get pods
```

Open Application:

```
minikube service nginx
```

---

# 🔁 GitHub Actions Auto Canary Pipeline

Workflow location:

```
.github/workflows/canary.yml
```

### Pipeline Steps

1. Create KIND cluster
2. Build Docker images
3. Deploy Blue environment
4. Deploy Green canary
5. Run health checks
6. Promote automatically

Trigger pipeline:

```
git push origin main
```

---

# 🔄 Deployment Flow Explained

### Blue Deployment Phase

Stable version runs with full traffic.

### Canary Phase

New version deployed alongside stable pods.

### Promotion Phase

If healthy:

* Blue removed
* Green becomes stable

---

# 🧪 Manual Canary Simulation

Scale deployments:

```
kubectl scale deployment nginx-green --replicas=1
```

Observe rollout:

```
kubectl get pods -w
```

---

# 🧯 Troubleshooting

### Pods Not Starting

```
kubectl describe pod <pod-name>
```

### Check Logs

```
kubectl logs <pod-name>
```

### Restart Deployments

```
kubectl rollout restart deployment nginx-deployment
```

---

# 🎥 Demo

Blue-Green Deployment:

```
img/blue-green-deployment-process.gif
```

Canary Deployment:

```
img/canary-deploy.gif
```

---

# ⭐ Key Features

* Fully FREE local progressive delivery setup
* Automated Canary pipeline via GitHub Actions
* Production-style Kubernetes deployments
* DevOps portfolio ready

---

# 📜 License

MIT License — see LICENSE.md
