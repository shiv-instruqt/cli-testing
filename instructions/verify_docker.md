# Getting Started with Docker

## Overview

In this lab, you will verify that **Docker** is installed and running, and that your **Flask web application** is live inside a Docker container.

Docker is a platform that lets you package and run applications in isolated containers. Your environment has been pre-configured with:

- Docker installed and running
- A Flask Python app pulled from Docker Hub (`shivtushal/git-lab:python-app-1.0`)
- The app running on **port 5000**

---

## Step 1 — Check if Docker is Running

In the **Terminal** tab, run:

```bash
docker ps
```

You should see a container named `flask-app` with status **Up**. This confirms Docker is working.

---

## Step 2 — View the Running App

Switch to the **Service** tab to see your Flask app running live in the browser.

---

## Step 3 — Inspect the Container

Want to know more about the running container? Try:

```bash
docker inspect flask-app
```

Or check the app logs:

```bash
docker logs flask-app
```

---

<instruqt-task id="check_docker"></instruqt-task>
