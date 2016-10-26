module Citybreak
  class Error < StandardError
    class NoAPIKeySpecified < Error; end
  end
end
