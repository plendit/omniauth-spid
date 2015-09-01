require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Spid < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "spid"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => 'https://stage.payment.schibsted.no/api/2'}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['userId'] }
      # without making any additional calls:
      #uid{ @access_token['user_id'] }

      info do
        {
          :nickname   => raw_info['displayName'],
          :email      => raw_info['email'],
          :name       => raw_info['name']['formatted'],
          :first_name => raw_info['name']['givenName'],
          :last_name  => raw_info['name']['familyName'],
          :image      => raw_info['photo'],
          :url        => raw_info['url']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :oauth_token

        @raw_info ||= access_token.get('me').parsed['data']
      end
    end
  end
end
