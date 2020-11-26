require "medical/directory/version"
require "medical/directory/report"
require "medical/directory/helpers"
require "medical/directory/data_loader"
require "medical/directory/health_record_history"
require "medical/directory/instruction"
require "medical/directory/cli"

module Medical
  module Directory
    class Error < StandardError; end
    class FileNotExistsError < StandardError; end
    class FileFormatNotSupportedError < StandardError; end

    require "smarter_csv"
  end
end
