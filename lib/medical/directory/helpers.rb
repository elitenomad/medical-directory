module Medical
  module Directory
    module Helpers
      def format(key)
        key.gsub(" ", "_").downcase
      end
    end
  end
end
