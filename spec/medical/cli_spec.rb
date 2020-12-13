require "spec_helper"

module Medical
  module Directory
    RSpec.describe CLI do
      subject { Medical::Directory::CLI.new }

      context "#load" do
        it "is expected to match expected_commands from test file" do
          path = File.dirname(__FILE__) + "/../support/instructions.txt"
          commands = subject.load(path)
          expected_commands = [
            :female_patients_count,
            :male_patients_count,
            :avg_age_of_male_patients,
            :avg_age_of_female_patients,
            [:avg_bp_of_patients, 20, 100],
            :patients_with_increasing_glucose_levels
          ]

          expect(commands).to eq(expected_commands)
        end

        context "when file is not present" do
          it "is expected to raise FileNotExistsError" do
            path = File.dirname(__FILE__) + "/../support/test.txt"
            expect { subject.load(path) }.to raise_error(Medical::Directory::FileNotExistsError)
          end
        end

        context "when file format is not supported" do
          it "is expected to raise FileFormatNotSupportedError" do
            path = File.dirname(__FILE__) + "/../support/test.csv"
            expect { subject.load(path) }.to raise_error(Medical::Directory::FileFormatNotSupportedError)
          end
        end
      end

      context "#run" do
        let(:report) { instance_double(Medical::Directory::Report) }
        let(:dummy_file) { File.dirname(__FILE__) + "/../support/patients.csv" }

        before(:each) do
          allow(subject).to receive(:report) { report }
        end

        context "Female patients count" do
          it "passes female_patients_count instruction to report" do
            expect(report).to receive(:load_prerequisite_data).with(/patients.csv/)
            expect(report).to receive(:female_patients_count)
            subject.run([:female_patients_count], dummy_file)
          end
        end

        context "Male patients count" do
          it "passes male_patients_count instruction to report" do
            expect(report).to receive(:load_prerequisite_data).with(/patients.csv/)
            expect(report).to receive(:male_patients_count)
            subject.run([:male_patients_count], dummy_file)
          end
        end

        context "Avg age of female patients" do
          it "passes avg_age_of_female_patients instruction to report" do
            expect(report).to receive(:load_prerequisite_data).with(/patients.csv/)
            expect(report).to receive(:avg_age_of_female_patients)
            subject.run([:avg_age_of_female_patients], dummy_file)
          end
        end

        context "Avg age of male patients" do
          it "passes avg_age_of_male_patients instruction to report" do
            expect(report).to receive(:load_prerequisite_data).with(/patients.csv/)
            expect(report).to receive(:avg_age_of_male_patients)
            subject.run([:avg_age_of_male_patients], dummy_file)
          end
        end

        context "Avg bg of patients" do
          it "passes avg_bp_of_patients instruction to report" do
            expect(report).to receive(:load_prerequisite_data).with(/patients.csv/)
            expect(report).to receive(:avg_bp_of_patients)
            subject.run([[:avg_bp_of_patients, 20, 100]], dummy_file)
          end
        end

        context "patients with increased glucose levels" do
          it "passes patients_with_increasing_glucose_levels instruction to report" do
            expect(report).to receive(:load_prerequisite_data).with(/patients.csv/)
            expect(report).to receive(:patients_with_increasing_glucose_levels)
            subject.run([:patients_with_increasing_glucose_levels], dummy_file)
          end
        end
      end
    end
  end
end
