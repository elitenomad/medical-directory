module Medical
  module Directory
    class Report
      attr_reader :patients

      ACCEPTED_DATA_INPUT_FORMATS = [".csv"]

      def load_prerequisite_data(file)
        if !ACCEPTED_DATA_INPUT_FORMATS.include?(File.extname(file))
          raise Medical::Directory::FileFormatNotSupportedError.new("Only CSV files are supported for data loading.")
        end

        @patients ||= Medical::Directory::DataLoader.new(file).run
      end

      def female_patients_count
        female_patients.count
      end

      def male_patients_count
        male_patients.count
      end

      def avg_age_of_male_patients
        total_age_of_male_patients = male_patients.map do |patient|
          patient.attributes["age"]
        end.reduce(&:+)

        total_age_of_male_patients / male_patients_count.to_f
      end

      def avg_age_of_female_patients
        total_age_of_female_patients = female_patients.map do |patient|
          patient.attributes["age"]
        end.reduce(&:+)

        total_age_of_female_patients / female_patients_count.to_f
      end

      private

      def female_patients
        @patients.filter do |patient|
          patient.attributes["gender"] == "F"
        end
      end

      def male_patients
        @patients.filter do |patient|
          patient.attributes["gender"] == "M"
        end
      end
    end
  end
end
