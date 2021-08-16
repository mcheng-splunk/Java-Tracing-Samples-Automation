# data "local_file" "test" {
#     filename = "${path.module}/okhttp-and-jedis/start.sh"
# }


resource "null_resource" "repo_home" {
  provisioner "local-exec" {
    command = "pwd >> ${path.module}/pwd.txt"
  }
}

resource "null_resource" "docker_run" {
  provisioner "local-exec" {
    command = "../${path.module}/${var.JAVAPROJECT}/start.sh"
  }
}

data "local_file" "current-path" {
  filename = "${path.module}/pwd.txt"
  depends_on = [null_resource.repo_home]
}

