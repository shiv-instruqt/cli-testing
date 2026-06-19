resource "exec" "setup" {
  target  = resource.container.ubuntu
  timeout = "300s"

  environment = {
    DEBIAN_FRONTEND = "noninteractive"
  }

  script = "scripts/exec/setup/script.sh"
}
