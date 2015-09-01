# OmniAuth SPiD

This is an unofficial OmniAuth strategy for authenticating to SPiD. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
with SPiD.

SPiD stands for Schibsted Payment ID.

The company offering the SPiD service is Schibsted Payment AS, a
subsidiary of Schibsted ASA.

## Basic Usage

    use OmniAuth::Builder do
      provider :spid, ENV['SPID_KEY'], ENV['SPID_SECRET']
    end

Note: by default it will connect to the Norwegian staging API:

`https://stage.payment.schibsted.no/api/2`

## Using in Production

You need to override the site value to point to the correct production API url.

    provider :spid, ENV['SPID_KEY'], ENV['SPID_SECRET'],
        {
          :client_options => {
            :site => ENV['SPID_BASE_URL']
          }
        }


## Auth Hash

Here's an example of an authentication hash available in the callback by accessing request.env["omniauth.auth"]:

    {
        :provider => "spid",
        :uid => "123456789",
        :info => {
            :nickname => "John Doe",
            :email => "john@company_name.com",
            :name => "John Doe",
            :first_name => "John",
            :last_name => "Doe",
            :image => "https://secure.gravatar.com/avatar/1b19ea6c3e4033d54bfcb14d0f8b814a?s=200",
            :url => ""
        },
        :credentials => {
            :token => "token",
            :refresh_token => "another_token",
            :expires_at => 1354920555,
            :expires => true
        },
        :extra => {
            :raw_info => {
                (...)
            }
        }
    }

The information in :raw_info is documented at http://techdocs.spid.no/endpoints/GET/me/

## License

Copyright (c) 2015 R. Arruda and Plendit AS.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.