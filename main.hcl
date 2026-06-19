resource "lab" "main" {
  title       = "Docker & Flask App Lab"
  description = "Learn how Docker works by running a real Flask application inside a container"
  layout      = resource.layout.two_column

  content {
    chapter "getting_started" {
      title = "Getting Started with Docker"

      page "verify_docker" {
        reference = resource.page.verify_docker
      }
    }
  }
}
