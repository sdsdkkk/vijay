module Vijay
  class File
    attr_reader :name

    def initialize(name, digest)
      @name = name
      @digest = digest
    end

    def altered?(new_digest)
      @digest != new_digest
    end
  end
end
