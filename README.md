# Node.js App Deployment on Kubernetes with Terraform

This project demonstrates how to deploy a sample Node.js application to a Kubernetes cluster using Terraform. It includes Dockerizing the Node.js app, deploying it to DockerHub, and then deploying it to a Kubernetes cluster managed by Kind (Kubernetes in Docker).

## Usage

1. **Setup Kind Cluster**: Run the `setup_kind_cluster.sh` script to create a local Kubernetes cluster using Kind. Ensure Docker is installed on your machine.

   ```bash
   ./setup_kind_cluster.sh
   ```

Deploy Node.js App: Dockerize your Node.js app and push it to DockerHub. Then apply the Kubernetes deployment manifest using Terraform.

bash
```
docker build -t bit3down/nodejs-app .
docker tag bit3down/nodejs-app bit3down/nodejs-app:latest
docker push bit3down/nodejs-app:latest
```

```
terraform init
terraform apply
```
Access the Application: Once deployed, you can access your Node.js application by port-forwarding the service to your local machine.

bash
```
kubectl port-forward service/nodejs-app-service 8080:80
```