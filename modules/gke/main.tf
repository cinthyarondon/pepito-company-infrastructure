resource "google_container_cluster" "gke_cluster" {
  name       = var.cluster_name
  project    = var.project_id
  location   = var.zone
  network    = var.network_name
  subnetwork = var.subnet_name

  remove_default_node_pool = true
  initial_node_count = 1

  resource_labels = {
    "env" = var.env
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  workload_identity_config {
    workload_pool = "${data.google_project.project.project_id}.svc.id.goog"
  }

}

resource "google_container_node_pool" "gke_nodes" {
  name     = var.nodes_name
  location = var.zone
  cluster  = google_container_cluster.gke_cluster.name
  
  node_count = 2

  node_config {
    labels = {
      env = var.env
    }

    machine_type = var.vm_type
    preemptible = false

    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
