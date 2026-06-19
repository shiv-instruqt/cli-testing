resource "terminal" "shell" {
  target = resource.container.ubuntu
  shell  = "/bin/bash"
}

resource "service" "flask_app" {
  target = resource.container.ubuntu
  port   = 5000
  scheme = "http"
}
