resource "exec" "setup" {
  target  = resource.container.ubuntu
  script  = "scripts/exec/setup/script.sh"
  timeout = "600s"

  environment = {
    DEBIAN_FRONTEND = "noninteractive"
  }
}
