terraform {
  backend "s3" {
    bucket = "cmtr-sghaq6oo-backend-bucket-1779961793"
    key    = "tf_code.tfstate"
    region = "eu-west-1"
  }
}