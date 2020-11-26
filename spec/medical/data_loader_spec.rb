require "spec_helper"

module Medical
  module Directory
    RSpec.describe Medical::Directory::DataLoader do
      let(:expected_data) { MedicalDirectoryTestHelper::Mock.new.data }
      let(:expected_episodes) { MedicalDirectoryTestHelper::Mock.new.episodes }
      let(:expected_grouped_data) { MedicalDirectoryTestHelper::Mock.new.grouped_episodes_by_id_and_date}

      subject { Medical::Directory::DataLoader.new(File.dirname(__FILE__) + "/../support/patients.csv") }


      describe "#episodes" do
        it "is expected to return collection of episodes" do
          expect(subject.episodes).to eq(expected_episodes)
        end
      end

      describe "#group_episodes_by_date_and_patientid" do
        it "is expected to return episodes grouped by id and date" do
          expect(subject.group_episodes_by_date_and_patientid).to eq(expected_grouped_data)
        end
      end

      describe "#raw_health_records" do
        it "is expected to return flattened health records" do
          expect(subject.raw_health_records).to eq(expected_data)
        end
      end

      describe "#run" do
        it "is expected to call HealthRecordHistory with raw health records" do
          expect(Medical::Directory::HealthRecordHistory).to receive(:new).with(expected_data)
          subject.run
        end
      end
    end
  end
end
