
  /*max_subnet_length = max(
    length(var.private_subnets),
    length(var.elasticache_subnets),
    length(var.database_subnets),
    length(var.redshift_subnets),
  )
  nat_gateway_count = var.single_nat_gateway ? 1 : var.one_nat_gateway_per_az ? length(var.azs) : local.max_subnet_length

  # Use `local.vpc_id` to give a hint to Terraform that subnets should be deleted before secondary CIDR blocks can be free!
  vpc_id = try(aws_vpc_ipv4_cidr_block_association.this[0].vpc_id, aws_vpc.this[0].id, "")

  create_vpc = var.create_vpc && var.putin_khuylo

  name   = "ex-${replace(basename(path.cwd), "_", "-")}"
  name_prefix    = "localstack_vpc_dev"
  region = "us-east-1"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-vpc"
    GithubOrg  = "terraform-aws-modules"
  }
*/

#-----------------------------------------------------------------------------------

  name = "localstack_vpc_dev"
  #cidr = "192.173.12.0/22"
  cidr = "10.0.0.0/16"
  create_vpc=true

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = false

/*  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  public_subnet_tags_per_az = {
    "us-east-1a" = {
      "availability-zone" = "us-east-1a"
    }
  }
*/
  #tags = local.tags

  vpc_tags = {
    Name = "vpc-name"
  }