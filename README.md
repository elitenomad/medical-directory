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


### Enhancements
When considering your design, bear in mind that that your product manager plans to add more functionality to the system like:
 * finding all patients with increasing Glucose levels,
 * printing a report of average blood pressure for patients in a specified age range,
 * etc...

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'medical-directory'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install medical-directory

## Usage

Note: Ensure latest ruby is installed on the system.

1. Unzip the medical-directory.zip
2. cd medical-directory/exe
3. Run simulator with filename as argument.


```
./simulator usecase-1.txt
```

Note: usecase-1.txt will have the instructions or commands listed.

## Test

```
rspec spec/
```

# Design

## Considerations

TODO: In progress :)

## Assumptions

TODO: In Progress :) 


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
