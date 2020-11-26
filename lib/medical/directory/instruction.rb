module Medical
  module Directory
    class Instruction
      def self.parse(cmd)
        case cmd
        when /\AFEMALE_PATIENTS_COUNT\Z/
          :female_patients_count
        when /\AMALE_PATIENTS_COUNT\Z/
          :male_patients_count
        when /\AAVG_AGE_OF_MALE_PATIENTS\Z/
          :avg_age_of_male_patients
        when /\AAVG_AGE_OF_FEMALE_PATIENTS\Z/
          :avg_age_of_female_patients
        else
          :invalid
        end
      end
    end
  end
end
