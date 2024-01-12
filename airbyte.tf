resource "kubernetes_namespace" "airbyte" {
  metadata {
    name = "airbyte"
  }
}

resource "helm_release" "airbyte" {
  chart      = kubernetes_namespace.airbyte.metadata.0.name
  name       = "airbyte"
  repository = "https://airbytehq.github.io/helm-charts"
  namespace  = "airbyte"
  version    = "0.50.14"
  values     = [templatefile("${path.module}/helm-values/airbyte.yml", {})]
}
