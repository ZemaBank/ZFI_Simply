# frozen_string_literal: true

module M2ySimply
  class Configuration

    attr_writer :username, :password, :proxy, :server_url, :workflow

    def initialize #:nodoc:
      @username = nil
      @password = nil
      @proxy = nil
      @workflow = nil
      @server_url = nil
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

    def workflow
      @workflow
    end

  end
end
