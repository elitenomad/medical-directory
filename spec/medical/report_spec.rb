require "spec_helper"

module Medical
  module Directory
    RSpec.describe Medical::Directory::Report do
      let(:mock_data) { MedicalDirectoryTestHelper::Mock.new.data}
      let(:health_record_collection) { Medical::Directory::HealthRecordHistory.new(mock_data) }

      subject { Medical::Directory::Report.new }

      before do
        allow_any_instance_of(Medical::Directory::DataLoader).to receive(:run).and_return(health_record_collection)
        subject.load_prerequisite_data(File.dirname(__FILE__) + "/../support/patients.csv")
      end

      context "#female_patients_count" do
        describe "when called" do
          it "is expected to return female patients count" do
            expect(subject.female_patients_count).to eq(2)
          end
        end
      end

      context "#male_patients_count" do
        describe "when called" do
          it "is expected to return male patients count" do
            expect(subject.male_patients_count).to eq(1)
          end
        end
      end

      context "#avg_age_of_male_patients" do
        describe "when called" do
          it "is expected to return avg age of male patients" do
            expect(subject.avg_age_of_male_patients).to eq(24)
          end
        end
      end

      context "#avg_age_of_female_patients" do
        describe "when called" do
          it "is expected to return avg age of female patients" do
            expect(subject.avg_age_of_female_patients).to eq(24.5)
          end
        end
      end
    end
  end
end
