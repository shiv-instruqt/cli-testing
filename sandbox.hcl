resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "container" "ubuntu" {
  image {
    name = "ubuntu:22.04"
  }

  privileged = true

  port {
    local = 5000
  }

  network {
    id = resource.network.main.meta.id
  }

  environment = {
    DEBIAN_FRONTEND = "noninteractive"
  }
}
