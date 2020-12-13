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
        # puts "GROUP",group_episodes_by_date_and_patientid.inspect
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

          # PSEUDO CODE - Pairing to skip the grouping part above.
          # patients = {}
          # episodes.each do |episode|
          #   # Lookup the patients ID
          #   # If it do not exists
          #   #   Add a new One
          #   #   Value will be a Array of attribute names and values per date . For {"2020-12-12": {age:10, WCC: 20} }
          #   # If the patient ID is already there
          #   # Go Look for the date. if episode[patientID][date] O(1)
          #   # If the date is present, we merge the attributes which are already there.
          #   # if the date is not present, episode[patientID][date] = { [episode[patientId][attribute_name] => episode[patientId][attribute_value ]}
          #   patients[episode.patientid] = {
          #     episode.date => {
          #       episode[:attribute_name] => episode[:attribute_value]
          #     }
          #   }
          # end

          

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
