terraform {
  backend "s3" {
    bucket = "cmtr-sghaq6oo-backend-new-bucket-1779959646"
    key    = "tf_code.tfstate"
    region = "eu-west-1"
  }
}