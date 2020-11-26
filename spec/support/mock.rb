module MedicalDirectoryTestHelper
  class Mock
    def data
      [
        {
          :date => "2019-12-09",
          :patient_id => 1,
          :attributes => {
            "age" => 23,
            "blood_pressure" => 160,
            "gender" => "F",
            "glucose" => 11.1,
            "diabetes" => "TRUE",
            "wcc" => 120,
          },
        },
        {
          :date => "2019-12-09",
          :patient_id => 2,
          :attributes => {
            "age" => 24,
            "blood_pressure" => 190,
            "glucose" => 5.5,
            "diabetes" => "FALSE",
            "gender" => "M",
            "wcc" => 312,
          },
        },
        {
          :date => "2019-12-11",
          :patient_id => 1,
          :attributes => {
            "age" => 23,
            "blood_pressure" => 180,
            "glucose" => 12.2,
            "diabetes" => "TRUE",
            "wcc" => 212,
          },
        },
        {
          :date => "2019-12-14",
          :patient_id => 3,
          :attributes => {
            "age" => 26,
            "blood_pressure" => 210,
            "glucose" => 9.7,
            "diabetes" => "TRUE",
            "wcc" => 110,
            "gender" => "F",
          },
        },
      ]
    end

    def episodes
      [
        {
          :date => "2019-12-09",
          :patientid => 1,
          :attribute_name => "Age",
          :attribute_value => 23,
        },
        {
          :date => "2019-12-09",
          :patientid => 1,
          :attribute_name => "Blood pressure",
          :attribute_value => 160,
        },
        {
          :date => "2019-12-09",
          :patientid => 1,
          :attribute_name => "Gender",
          :attribute_value => "F",
        },
        {
          :date => "2019-12-09",
          :patientid => 1,
          :attribute_name => "Glucose",
          :attribute_value => 11.1,
        },
        {
          :date => "2019-12-09",
          :patientid => 1,
          :attribute_name => "Diabetes",
          :attribute_value => "TRUE",
        },
        {
          :date => "2019-12-09",
          :patientid => 1,
          :attribute_name => "WCC",
          :attribute_value => 120,
        },
        {
          :date => "2019-12-09",
          :patientid => 2,
          :attribute_name => "Age",
          :attribute_value => 24,
        },
        {
          :date => "2019-12-09",
          :patientid => 2,
          :attribute_name => "Blood pressure",
          :attribute_value => 190,
        },
        {
          :date => "2019-12-09",
          :patientid => 2,
          :attribute_name => "Glucose",
          :attribute_value => 5.5,
        },
        {
          :date => "2019-12-09",
          :patientid => 2,
          :attribute_name => "Diabetes",
          :attribute_value => "FALSE",
        },
        {
          :date => "2019-12-09",
          :patientid => 2,
          :attribute_name => "Gender",
          :attribute_value => "M",
        },
        {
          :date => "2019-12-09",
          :patientid => 2,
          :attribute_name => "WCC",
          :attribute_value => 312,
        },
        {
          :date => "2019-12-11",
          :patientid => 1,
          :attribute_name => "Age",
          :attribute_value => 23,
        },
        {
          :date => "2019-12-11",
          :patientid => 1,
          :attribute_name => "Blood pressure",
          :attribute_value => 180,
        },
        {
          :date => "2019-12-11",
          :patientid => 1,
          :attribute_name => "Glucose",
          :attribute_value => 12.2,
        },
        {
          :date => "2019-12-11",
          :patientid => 1,
          :attribute_name => "Diabetes",
          :attribute_value => "TRUE",
        },
        {
          :date => "2019-12-11",
          :patientid => 1,
          :attribute_name => "WCC",
          :attribute_value => 212,
        },
        {
          :date => "2019-12-14",
          :patientid => 3,
          :attribute_name => "Age",
          :attribute_value => 26,
        },
        {
          :date => "2019-12-14",
          :patientid => 3,
          :attribute_name => "Blood pressure",
          :attribute_value => 210,
        },
        {
          :date => "2019-12-14",
          :patientid => 3,
          :attribute_name => "Glucose",
          :attribute_value => 9.7,
        },
        {
          :date => "2019-12-14",
          :patientid => 3,
          :attribute_name => "Diabetes",
          :attribute_value => "TRUE",
        },
        {
          :date => "2019-12-14",
          :patientid => 3,
          :attribute_name => "WCC",
          :attribute_value => 110,
        },
        {
          :date => "2019-12-14",
          :patientid => 3,
          :attribute_name => "Gender",
          :attribute_value => "F",
        },
      ]
    end

    def grouped_episodes_by_id_and_date
      {
        "2019-12-09-1" => [
          {
            :date => "2019-12-09",
            :patientid => 1,
            :attribute_name => "Age",
            :attribute_value => 23,
          },
          {
            :date => "2019-12-09",
            :patientid => 1,
            :attribute_name => "Blood pressure",
            :attribute_value => 160,
          },
          {
            :date => "2019-12-09",
            :patientid => 1,
            :attribute_name => "Gender",
            :attribute_value => "F",
          },
          {
            :date => "2019-12-09",
            :patientid => 1,
            :attribute_name => "Glucose",
            :attribute_value => 11.1,
          },
          {
            :date => "2019-12-09",
            :patientid => 1,
            :attribute_name => "Diabetes",
            :attribute_value => "TRUE",
          },
          {
            :date => "2019-12-09",
            :patientid => 1,
            :attribute_name => "WCC",
            :attribute_value => 120,
          },
        ],
        "2019-12-09-2" => [
          {
            :date => "2019-12-09",
            :patientid => 2,
            :attribute_name => "Age",
            :attribute_value => 24,
          },
          {
            :date => "2019-12-09",
            :patientid => 2,
            :attribute_name => "Blood pressure",
            :attribute_value => 190,
          },
          {
            :date => "2019-12-09",
            :patientid => 2,
            :attribute_name => "Glucose",
            :attribute_value => 5.5,
          },
          {
            :date => "2019-12-09",
            :patientid => 2,
            :attribute_name => "Diabetes",
            :attribute_value => "FALSE",
          },
          {
            :date => "2019-12-09",
            :patientid => 2,
            :attribute_name => "Gender",
            :attribute_value => "M",
          },
          {
            :date => "2019-12-09",
            :patientid => 2,
            :attribute_name => "WCC",
            :attribute_value => 312,
          },
        ],
        "2019-12-11-1" => [
          {
            :date => "2019-12-11",
            :patientid => 1,
            :attribute_name => "Age",
            :attribute_value => 23,
          },
          {
            :date => "2019-12-11",
            :patientid => 1,
            :attribute_name => "Blood pressure",
            :attribute_value => 180,
          },
          {
            :date => "2019-12-11",
            :patientid => 1,
            :attribute_name => "Glucose",
            :attribute_value => 12.2,
          },
          {
            :date => "2019-12-11",
            :patientid => 1,
            :attribute_name => "Diabetes",
            :attribute_value => "TRUE",
          },
          {
            :date => "2019-12-11",
            :patientid => 1,
            :attribute_name => "WCC",
            :attribute_value => 212,
          },
        ],
        "2019-12-14-3" => [
          {
            :date => "2019-12-14",
            :patientid => 3,
            :attribute_name => "Age",
            :attribute_value => 26,
          },
          {
            :date => "2019-12-14",
            :patientid => 3,
            :attribute_name => "Blood pressure",
            :attribute_value => 210,
          },
          {
            :date => "2019-12-14",
            :patientid => 3,
            :attribute_name => "Glucose",
            :attribute_value => 9.7,
          },
          {
            :date => "2019-12-14",
            :patientid => 3,
            :attribute_name => "Diabetes",
            :attribute_value => "TRUE",
          },
          {
            :date => "2019-12-14",
            :patientid => 3,
            :attribute_name => "WCC",
            :attribute_value => 110,
          },
          {
            :date => "2019-12-14",
            :patientid => 3,
            :attribute_name => "Gender",
            :attribute_value => "F",
          },
        ]
      }
    end
  end
end
