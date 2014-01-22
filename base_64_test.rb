username, password = 'carlos', 'secret'
encoded = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
p encoded
decoded = Base64.decode64(encoded.split.last).split(/:/)
p decoded
