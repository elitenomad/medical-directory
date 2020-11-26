module Medical
  module Directory
    class DataLoader
      include Medical::Directory::Helpers
      attr_reader :file

      def initialize(file)
        @file = file
      end

      def episodes
        SmarterCSV.process(file) 
      end

      def group_episodes_by_date_and_patientid
        episodes.group_by do |record|
          "#{record[:date]}-#{record[:patientid]}"
        end
      end

      def raw_health_records
        records = []

        group_episodes_by_date_and_patientid.each do |key, episodes|
          flattened_episode = {
            date: nil,
            patient_id: nil,
            attributes: {},
          }

          episodes.each do |episode|
            flattened_episode[:date] = episode[:date]
            flattened_episode[:patient_id] = episode[:patientid]
            flattened_episode[:attributes].merge!({
              "#{format(episode[:attribute_name])}" => episode[:attribute_value],
            })
          end

          records << flattened_episode
        end

        records
      end

      def run
        Medical::Directory::HealthRecordHistory.new(raw_health_records)
      end
    end
  end
end
