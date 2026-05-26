terraform {
  backend "s3" {
    bucket = "cmtr-sghaq6oo-backend-bucket-1779771041"
    key    = "tf_code_1.tfstate"
    region = "eu-west-1"
  }
}