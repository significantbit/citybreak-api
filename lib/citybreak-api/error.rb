module Citybreak
  class Error < StandardError
    class NoAPIKeySpecified < Error; end
    class NoSuchClientType < Error; end
  end
end
