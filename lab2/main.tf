provider "aws" {
  region = "${var.region}"
  default_tags {
    tags = {
      proyecto = "${var.nombre}_lab2"
    }
  }


}
