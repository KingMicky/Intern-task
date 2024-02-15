# Provider block for Kubernetes
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Kubernetes deployment resource
resource "kubernetes_deployment" "nodejs_app" {
  metadata {
    name = "app"
    labels = {
      app = "nodejs"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "nodejs"
      }
    }

    template {
      metadata {
        labels = {
          app = "nodejs"
        }
      }

      spec {
        container {
          image = "bit3down/nodejs-app:latest"
          name  = "nodejs-app"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

# Kubernetes service resource
resource "kubernetes_service" "nodejs_app_service" {
  metadata {
    name = "nodejs-app-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.nodejs_app.metadata.0.labels.app
    }

    port {
      port        = 80
      target_port = 3000
    }
  }
}
