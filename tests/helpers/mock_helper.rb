# Use so you can run in mock mode from the command line
#
# FOG_MOCK=true fog

if ENV["FOG_MOCK"] == "true"
  Fog.mock!
end

# if in mocked mode, fill in some fake credentials for us
if Fog.mock?
  Fog.credentials = {
    :aws_access_key_id                => 'aws_access_key_id',
    :aws_secret_access_key            => 'aws_secret_access_key',
    :ia_access_key_id                 => 'aws_access_key_id',
    :ia_secret_access_key             => 'aws_secret_access_key',
    :brightbox_client_id              => 'brightbox_client_id',
    :brightbox_secret                 => 'brightbox_secret',
    :clodo_api_key                    => 'clodo_api_key',
    :clodo_username                   => 'clodo_username',
    :digitalocean_api_key             => 'digitalocean_api_key',
    :digitalocean_client_id           => 'digitalocean_client_id',
    :digitalocean_token               => 'digitalocean_token',
    :dnsimple_email                   => 'dnsimple_email',
    :dnsimple_password                => 'dnsimple_password',
    :dnsmadeeasy_api_key              => 'dnsmadeeasy_api_key',
    :dnsmadeeasy_secret_key           => 'dnsmadeeasy_secret_key',
    :glesys_username                  => 'glesys_username',
    :glesys_api_key                   => 'glesys_api_key',
    :go_grid_api_key                  => 'go_grid_api_key',
    :go_grid_shared_secret            => 'go_grid_shared_secret',
    :hp_access_key                    => 'hp_access_key',
    :hp_secret_key                    => 'hp_secret_key',
    :hp_tenant_id                     => 'hp_tenant_id',
    :hp_avl_zone                      => 'hp_avl_zone',
    :hp_auth_uri                      => 'http://hp/v2.0/tokens',
    :os_account_meta_temp_url_key     => 'os_account_meta_temp_url_key',
    :ibm_username                     => 'ibm_username',
    :ibm_password                     => 'ibm_password',
    :linode_api_key                   => 'linode_api_key',
    :local_root                       => '~/.fog',
    :bare_metal_cloud_password        => 'bare_metal_cloud_password',
    :bare_metal_cloud_username        => 'bare_metal_cloud_username',
#    :public_key_path                  => '~/.ssh/id_rsa.pub',
#    :private_key_path                 => '~/.ssh/id_rsa',
    :opennebula_endpoint              => 'http://opennebula:2633/RPC2',
    :opennebula_username              => 'oneadmin',
    :opennebula_password              => 'oneadmin',
    :openstack_api_key                => 'openstack_api_key',
    :openstack_username               => 'openstack_username',
    :openstack_tenant                 => 'openstack_tenant',
    :openstack_auth_url               => 'http://openstack:35357/v2.0/tokens',
    :profitbricks_username            => 'profitbricks_username',
    :profitbricks_password            => 'profitbricks_password',
    :rackspace_api_key                => 'rackspace_api_key',
    :rackspace_region                 => 'dfw',
    :rackspace_username               => 'rackspace_username',
    :sakuracloud_api_token            => 'sakuracloud_api_token',
    :sakuracloud_api_token_secret     => 'sakuracloud_api_token_secret',
    :vcloud_host                      => 'vcloud_host',
    :vcloud_password                  => 'vcloud_password',
    :vcloud_username                  => 'vcloud_username',
    :vcloud_director_host             => 'vcloud-director-host',
    :vcloud_director_password         => 'vcloud_director_password',
    :vcloud_director_username         => 'vcd_user@vcd_org_name',
    :dynect_customer                  => 'dynect_customer',
    :dynect_username                  => 'dynect_username',
    :dynect_password                  => 'dynect_password',
    :cloudsigma_username              => 'csuname',
    :cloudsigma_password              => 'cspass',
    :docker_username                  => 'docker-fan',
    :docker_password                  => 'i<3docker',
    :docker_email                     => 'dockerfan@gmail.com',
    :docker_url                       => 'unix://var/run/docker.sock'
  }.merge(Fog.credentials)
end
