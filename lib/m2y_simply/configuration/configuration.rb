# frozen_string_literal: true

module M2ySimply
  class Configuration

    attr_writer :username, :password, :proxy, :server_url, :workflow, :env

    def initialize #:nodoc:
      @username = nil
      @password = nil
      @proxy = nil
      @workflow = nil
      @server_url = nil
      @env = nil
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

    def env
      @env
    end

    def production?
      env.to_s.upcase == 'PRD'
    end
  end
end
