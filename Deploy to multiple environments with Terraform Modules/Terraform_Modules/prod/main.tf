module "mymodule" {
    source = "../modules/vpc_module"
    vpc_cidr = var.prodcidr
}