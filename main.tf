# API Gateway Rest API
resource "aws_api_gateway_rest_api" "api" {
  name = "life-manager-api"
}

# Deploy API
#resource "aws_api_gateway_deployment" "api_deployment" {
#  rest_api_id = aws_api_gateway_rest_api.api.id
#  depends_on = [
#    aws_api_gateway_method.login_post
#  ]
#}

# Cognito Authorizer
resource "aws_api_gateway_authorizer" "cognito_authorizer" {
  name            = "cognito-authorizer"
  rest_api_id     = aws_api_gateway_rest_api.api.id
  identity_source = "method.request.header.Authorization"
  provider_arns   = ["arn:aws:cognito-idp:us-east-1:880587150218:userpool/us-east-1_VpVMi1O2k"]
  type            = "COGNITO_USER_POOLS"
}
