module Medical
  module Directory
    class HealthRecordHistory
      include Enumerable

      def initialize(records)
        @records = records
      end

      def each(&block)
        list.each(&block)
      end

      # Class hierarchy which represents individual
      # elements of the HealthRecordHistory class.
      #
      # == Initialize:
      # patient_id:: Patient ID
      # date::  Patient health check up date
      # atrributes:: Collection of episodes in terms of hash 
      #              for a date and patient
      class Medical::Directory::HealthRecord
        attr_reader :patient_id, :date, :attributes

        def initialize(options)
          @patient_id = options[:patient_id]
          @date = options[:date]
          @attributes = options[:attributes]
        end
      end

      private

      def list
        @records.map do |record|
          Medical::Directory::HealthRecord.new(record)
        end
      end
    end
  end
end
