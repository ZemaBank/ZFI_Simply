module M2ySimply

  class Base

    def self.base_url
      M2ySimply.configuration.server_url
    end

    def self.get_token
      body = {
        grant_type: 'password',
        username: M2ySimply.configuration.username,
        password: M2ySimply.configuration.password
      }
      token = post_encoded(base_url + TOKEN_PATH, body).parsed_response["token"]
      puts token
      token
    end

    def self.fixie
      URI.parse M2ySimply.configuration.proxy
    end


    def self.post_encoded(url, body)
      headers = {}
      headers['Content-Type'] = "application/x-www-form-urlencoded"
      post(url, URI.encode_www_form(body), headers)
    end

    def self.post(url, body, headers = nil)
      if headers.nil?
        headers = base_headers
      end
      HTTParty.post(url, headers: headers, body: body,
                    http_proxyaddr: fixie.host,
                    http_proxyport: fixie.port,
                    http_proxyuser: fixie.user,
                    http_proxypass: fixie.password)
    end
    def self.put(url, body, headers = nil)
      if headers.nil?
        headers = base_headers
      end
      HTTParty.put(url, headers: headers, body: body,
                    http_proxyaddr: fixie.host,
                    http_proxyport: fixie.port,
                    http_proxyuser: fixie.user,
                    http_proxypass: fixie.password)
    end

    def self.get(url, headers = nil)
      if headers.nil?
        headers = base_headers
      end
      HTTParty.get(url, headers: headers,
                    http_proxyaddr: fixie.host,
                    http_proxyport: fixie.port,
                    http_proxyuser: fixie.user,
                    http_proxypass: fixie.password)
    end


    def self.base_headers
      headers = {}
      headers['Content-Type'] = "application/json"
      headers['Authorization'] = "Bearer #{get_token}"
      headers
    end

  end
end
