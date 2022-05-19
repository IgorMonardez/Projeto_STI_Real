keyclkeyoak_credentials = YAML.load_file('config/keycloak.yml')[Rails.env]
Iduff::KeycloakClient.configure do |config|
  config.issuer = keyclkeyoak_credentials['issuer']
  config.secret = keyclkeyoak_credentials['secret']
  config.identifier = keyclkeyoak_credentials['identifier']
  config.update_endpoints
end
