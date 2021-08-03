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
      post_encoded(base_url + TOKEN_PATH, body).parsed_response["access_token"]
    end

    def self.fixie
      URI.parse M2ySimply.configuration.proxy if !M2ySimply.configuration.production?
    end

    def self.post_encoded(url, body)
      headers = {}
      headers['Content-Type'] = "application/x-www-form-urlencoded"
      headers['charset'] = "utf-8"
      post(url, URI.encode_www_form(body), headers)
    end

    def self.post(url, body, headers = nil)
      if headers.nil?
        headers = base_headers
      end
      puts "Sending POST request to URL: #{url}"
      puts headers
      puts body

      if M2ySimply.configuration.production?
        HTTParty.post(url, headers: headers, body: body)
      else
        HTTParty.post(url, headers: headers, body: body,
                      http_proxyaddr: fixie.host,
                      http_proxyport: fixie.port,
                      http_proxyuser: fixie.user,
                      http_proxypass: fixie.password)
      end
    end

    def self.put(url, body, headers = nil)
      if headers.nil?
        headers = base_headers
      end
      puts "Sending PUT request to URL: #{url}"
      if M2ySimply.configuration.production?
        response = HTTParty.put(url, headers: headers, body: body)
      else
        response = HTTParty.put(url, headers: headers, body: body,
                                http_proxyaddr: fixie.host,
                                http_proxyport: fixie.port,
                                http_proxyuser: fixie.user,
                                http_proxypass: fixie.password)
      end
      format_response(response)
    end

    def self.get(url, headers = nil)
      if headers.nil?
        headers = base_headers
      end
      puts "Sending GET request to URL: #{url}"
      if M2ySimply.configuration.production?
        response = HTTParty.get(url, headers: headers)
      else
        response = HTTParty.get(url, headers: headers,
                                http_proxyaddr: fixie.host,
                                http_proxyport: fixie.port,
                                http_proxyuser: fixie.user,
                                http_proxypass: fixie.password)
      end
      format_response(response)
    end

    def self.base_headers
      headers = {}
      headers['Content-Type'] = "application/json"
      headers['Authorization'] = "Bearer #{get_token}"
      headers
    end

    def self.format_response(original_response)
      response = original_response.parsed_response
      response = { body: response } if response.is_a?(Array)
      response = {} unless response.is_a?(Hash) # Could be empty
      response[:status_code] = original_response.code
      puts response
      response
    end
  end
end
