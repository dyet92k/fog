module Fog
  module AWS
    class Elasticache
      class Real

        require 'fog/aws/parsers/elasticache/single_security_group'

        # Authorize ingress to a CacheSecurityGroup using EC2 Security Groups
        #
        # === Parameters
        # * name <~String> - The name of the cache security group
        # * ec2_name <~String> - The name of the EC2 security group to authorize
        # * ec2_owner_id <~String> - The AWS Account Number of the EC2 security group
        # === Returns
        # * response <~Excon::Response>:
        #   * body <~Hash>
        def authorize_cache_security_group_ingress(name, ec2_name, ec2_owner_id)
          request({
            'Action' => 'AuthorizeCacheSecurityGroupIngress',
            'CacheSecurityGroupName' => name,
            'EC2SecurityGroupName' => ec2_name,
            'EC2SecurityGroupOwnerId' => ec2_owner_id,
            :parser => Fog::Parsers::AWS::Elasticache::SingleSecurityGroup.new
          })
        end

      end

      class Mock

        def authorize_cache_security_group_ingress(name, opts = {})
          unless (opts.key?('EC2SecurityGroupName') && opts.key?('EC2SecurityGroupOwnerId'))
            raise ArgumentError, 'Must specify and EC2SecurityGroupName and EC2SecurityGroupOwnerId'
          end

          response = Excon::Response.new

          if sec_group = self.data[:security_groups][name]

            if sec_group['EC2SecurityGroups'].detect{|h| h['EC2SecurityGroupName'] == opts['EC2SecurityGroupName']}
              raise Fog::AWS::Elasticache::AuthorizationAlreadyExists.new("AuthorizationAlreadyExists => #{opts['EC2SecurityGroupName']} is alreay defined")
            end
            sec_group['EC2SecurityGroups'] << opts.merge({"Status" => 'authorizing'})

            response.status = 200
            response.body = {
              "ResponseMetadata"=>{ "RequestId"=> Fog::AWS::Mock.request_id },
              'AuthorizeDBSecurityGroupIngressResult' => {
                'DBSecurityGroup' => sec_group
              }
            }
            response
          else
            raise Fog::AWS::Elasticache::NotFound.new("DBSecurityGroupNotFound => #{name} not found")
          end

        end
      end
    end
  end
end
