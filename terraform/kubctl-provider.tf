provider "kubectl" {
  config_path = "~/.kube/config"
}

resource "kubectl_manifest" "nodejs_app" {
  yaml_body = file("${path.module}/app-deployment.yaml")
}
