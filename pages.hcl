resource "page" "verify_docker" {
  title = "Verify Docker is Running"
  file  = "instructions/verify_docker.md"

  activities = {
    check_docker = resource.task.check_docker
  }
}
