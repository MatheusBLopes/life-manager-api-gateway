# Resource /change_password
resource "aws_api_gateway_resource" "change_password" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "change-password"
}

# POST method for /change_password
resource "aws_api_gateway_method" "change_password_post" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.change_password.id
  http_method   = "POST"
  authorization = "NONE"
}

# Integration for /change_password POST
resource "aws_api_gateway_integration" "change_password_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.change_password.id
  http_method             = aws_api_gateway_method.change_password_post.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:880587150218:function:LifeManagerLambdaAuth:prod/invocations"
}