# Medical::Directory

Patient data from laboratory are exported into CSV file. One line in CSV file represents one attribute with four fields - date, patientId, attribute name and attribute value. 
Attribute and their values are grouped into episodes. An episode is a group of all attributes for one patient on a single day.

### Input data

```
Date, PatientId, Attribute Name, Attribute Value
2019-12-09, 1, Age, 23
2019-12-09, 1, Blood pressure, 160
2019-12-09, 1, Gender, F
2019-12-09, 1, Glucose, 11.1
2019-12-09, 1, Diabetes, TRUE
2019-12-09, 1, WCC, 120
2019-12-09, 2, Age, 24
2019-12-09, 2, Blood pressure, 190
2019-12-09, 2, Glucose, 5.5
2019-12-09, 2, Diabetes, FALSE
2019-12-09, 2, Gender, M
2019-12-09, 2, WCC, 312
2019-12-11, 1, Age, 23
2019-12-11, 1, Blood pressure, 180
2019-12-11, 1, Glucose, 12.2
2019-12-11, 1, Diabetes, TRUE
2019-12-11, 1, WCC, 212
2019-12-14, 3, Age, 26
2019-12-14, 3, Blood pressure, 210
2019-12-14, 3, Glucose, 9.7
2019-12-14, 3, Diabetes, TRUE
2019-12-14, 3, WCC, 110
2019-12-14, 3, Gender, F
```

### Each task is a command or instruction to display output based on input data.

Your task is to provide an implementation to:
 * read data from the CSV file.
 * print number of female patients.
 * print number of male patients.
 * print average age of male patients.
 * print average age of female patients.

## Development or Installation

Unzip the medical-directory.zip into your local folder.

```
cd medical-directory
bundle install

(or)

cd medical-directory
bin/setup

```

- After checking out the repo, run `bin/setup` to install dependencies.
- Then, run `rake spec` to run the tests. 
- You can also run `bin/console` for an interactive prompt that will allow you to experiment.
    
## Directory structure

```
.
├── Gemfile
├── Gemfile.lock
├── bin - setup and console binaries
├── data
│   └── patients.csv ----- Input data file. 
├── exe
│   ├── instructions.txt ----- Instructions file to the program
│   └── simulator ----- script which takes instructions.txt and input data file to produce output requiired
├── lib
│   └── medical
│       ├── directory
│       │   ├── cli.rb   ------ Loads instructions, Loads input data and sequentially executes instructions
│       │   ├── data_loader.rb ---- File responsible for loading the file and transforming to meaningful data.
│       │   ├── health_record_history.rb ---- Health records data collection class.
│       │   ├── helpers.rb - Helper methods.
│       │   ├── instruction.rb ----- Class responsible to parse the instructions passed.
│       │   ├── report.rb ---- Class responsible to execute methods for each instruction sent.
│       └── directory.rb
├── medical-directory.gemspec ----- Meta data for the project created.
|
└── spec ----- Unit tests for the project code.
```

## Usage

Note: Ensure latest ruby is installed on the system.

1. Unzip the medical-directory.zip
2. cd medical-directory
3. Run simulator with filename as argument.

```
./exe/simulator ./exe/instructions.txt ./data/patients.csv
```

## Test

```
rspec spec/
```


or

```
rake spec
```
# Design

Each task is mapped to a command. 

For e.g 

```
    * print number of female patients ->  FEMALE_PATIENTS_COUNT
    * print number of male patients. -> MALE_PATIENTS_COUNT
    * print average age of male patients. -> AVG_AGE_OF_MALE_PATIENTS
    * print average age of female patients. -> AVG_AGE_OF_FEMALE_PATIENTS
```

`Medical::Directory::CLI` class loads the instructions and input data file and passes it to `Medical::Directory::Report` class which inturn executes method based on instruction.

when `Medical::Directory::Report` is initialized, `Medical::Directory::DataLoader` class prepares health record history data.

## Considerations

1. Used `bundle gem`  to create a folder structure.
2. Added smarter_csv gem to improve handling of CSV parsing. In current case, it helped me turn the csv row data into custom objects easily which inturn helped group the data easily with keys.
3. Added awesome_print for better viewing of jsons and array in `bin/console`.
4. If `bin/console` is used to test with the manual inputs and outputs.

## Assumptions

1. If multiple records are with same date and patient, the last one will override the previous ones.
2. Gender won't change in subsequent records. If it did the results will not be as expected.
3. Better results are possible if an instruction is for a date range. Smaller datasets is fine when the user age is same.


# Enhancements

```
When considering your design, bear in mind that that your product manager plans to add more functionality to the system like:
 * finding all patients with increasing Glucose levels,
 * printing a report of average blood pressure for patients in a specified age range,
 * etc...
```
- Map the task with an instruction
- Add it to instructions.txt
- Update `Medical::Directory::Report` with new instruction methods. For if instruction is FIND_PATIENTS, method would be find_patients
- Add logic to above added method, Filter, Map or do some processing on HealthHistoryCollection data to get desired result.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
