//generate a code for aws provider configuration


//generate a code snippet for a simple AWS S3 bucket using Terraform
resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

//generate a code snippet for an AWS EC2 instance using Terraform
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

//genetate a code snippet for an AWS Lambda function using Terraform
resource "aws_lambda_function" "example" {
  function_name = "example_lambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "index.handler"
  runtime       = "nodejs12.x"

  source_code_hash = filebase64sha256("lambda_function.zip")
}

/generate a code snippet for an AWS IAM role using Terraform
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
