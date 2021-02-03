# frozen_string_literal: true

module M2ySimply
  class Configuration

    attr_writer :username, :password, :proxy, :proxy_user, :proxy_pass, :proxy_port, :server_url

    def initialize #:nodoc:
      @username = nil
      @password = nil
      @proxy = nil
      @proxy_user = nil
      @proxy_pass = nil
    end

    def username
      @username
    end

    def password
      @password
    end

    def proxy
      @proxy
    end

    def proxy_user
      @proxy_user
    end

    def proxy_pass
      @proxy_pass
    end

    def proxy_port
      @proxy_port
    end

    def proxy_url
      "http://#{proxy_user}:#{proxy_pass}@#{proxy}:#{proxy_port}"
    end

    def server_url
      @server_url
    end

  end
end
