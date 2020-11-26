module Medical
  module Directory
    class CLI
      attr_reader :report

      ACCEPTED_INSTRUCTION_FORMATS = [".txt"]

      def initialize
        @report = Medical::Directory::Report.new
      end

      def load(file)
        if !ACCEPTED_INSTRUCTION_FORMATS.include?(File.extname(file))
          raise Medical::Directory::FileFormatNotSupportedError.new("Only txt files are supported currently.")
        end

        unless File.exist?(file)
          raise Medical::Directory::FileNotExistsError.new("File does not exist.")
        end

        File.readlines(file).map do |line|
          Medical::Directory::Instruction.parse(line)
        end
      end

      def run(instructions, input_file)
        report.load_prerequisite_data(input_file)

        instructions.each do |instruction|
          unless instruction == :invalid
            output = report.send(instruction)
            puts "#{instruction.to_s.ljust(40)} ----> #{output}"
          end
        end
      end
    end
  end
end
