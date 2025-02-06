# Resource /reset_temporary_password
resource "aws_api_gateway_resource" "reset_temporary_password" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "reset-temporary-password"
}

# POST method for /reset_temporary_password
resource "aws_api_gateway_method" "reset_temporary_password_post" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.reset_temporary_password.id
  http_method   = "POST"
  authorization = "NONE"
}

# Integration for /reset_temporary_password POST
resource "aws_api_gateway_integration" "reset_temporary_password_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.reset_temporary_password.id
  http_method             = aws_api_gateway_method.reset_temporary_password_post.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:880587150218:function:LifeManagerLambdaAuth:prod/invocations"
}