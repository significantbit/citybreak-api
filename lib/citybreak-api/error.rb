module Citybreak
  class Error < StandardError
    class NoAPIKeySpecified < Error; end
    class NoSuchClientType < Error; end
    class DateToOld < Error; end
  end
end
