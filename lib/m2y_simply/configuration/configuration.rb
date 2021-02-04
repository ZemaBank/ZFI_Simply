# frozen_string_literal: true

module M2ySimply
  class Configuration

    attr_writer :username, :password, :proxy, :server_url

    def initialize #:nodoc:
      @username = nil
      @password = nil
      @proxy = nil
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

    def server_url
      @server_url
    end

  end
end
