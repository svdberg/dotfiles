function getpwd {
  output=$(security 2>&1 >/dev/null find-generic-password -ga ecg-ldap)
  echo $output | sed 's/password: "\(.*\)"/\1/' 2>/dev/null
}

function cloudmpauroraintegration {
  export OS_PASSWORD=$(getpwd)
  export OS_USERNAME="$USER"
  export OS_TENANT_ID="4c0e3b97ccfe4ac78dede92511a02c2a"
  export OS_AUTH_URL="https://keystone.ams1.cloud.ecg.so/v2.0"
  export OS_TENANT_NAME="mp-aurora-integration"

  # TerraForm stuff
  export TF_VAR_network=86ae952c-c77c-4ea9-923c-37922f6a4a34
  export TF_VAR_subnet=5c2b53c2-1163-449b-a41b-84e21fdb8af6
  export TF_VAR_image_name=ecg-ubuntu-trusty
  export TF_VAR_keypair=laptop
  export TF_VAR_dc=ams1

  # Consul
  export CONSUL_HTTP_AUTH=$USER:$(getpwd)
}
