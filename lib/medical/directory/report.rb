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

      def avg_bp_of_patients(lower, higher)
        bp_hashes = {}
        if filter_patients_by_age(lower, higher).length <= 0
          return "No data available."
        end
        filter_patients_by_age(lower, higher).map do |patient|
          bp_hashes[patient.patient_id] = patient.attributes["blood_pressure"]
        end
        total_bp_of_patients = bp_hashes.values.reduce(&:+)
        total_bp_of_patients / bp_hashes.size.to_f
      end

      def patients_with_increasing_glucose_levels
        gl_hashes = {}
        patients.map do |patient|
          id = patient.patient_id
          glevel = patient.attributes["glucose"]
          
          if gl_hashes[id]
            gl_hashes[id].last < glevel ?
              gl_hashes[id] << glevel :
              gl_hashes.delete(id)
          else
            gl_hashes[id] = [glevel]
          end
        end
       
        gl_hashes.keys
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

      def filter_patients_by_age(lower, higher)
        @patients.filter do |patient|
          patient.attributes["age"] >= lower.to_i && 
          patient.attributes["age"] <= higher.to_i
        end
      end
    end
  end
end
