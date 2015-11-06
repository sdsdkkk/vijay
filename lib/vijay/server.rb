module Vijay
  class Server
    attr_reader :host

    def initialize(host, credentials)
      @host = host
      @credentials = credentials
    end

    def user
      @credentials["user"]
    end

    def password
      @credentials["pass"]
    end
  end
end
