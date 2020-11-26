module Medical
  module Directory
    RSpec.describe Medical::Directory::HealthRecordHistory do
      let(:records) { MedicalDirectoryTestHelper::Mock.new.data}

      subject { Medical::Directory::HealthRecordHistory.new(records) }

      it { is_expected.to respond_to(:each) }

      it "is expected to return list of records of type Medical::Directory::HealthRecord" do
        subject.each do |record|
          expect(record).to be_a_kind_of(Medical::Directory::HealthRecord)
        end
      end

      describe "#each" do
        it "is expected not to raise error when accessed" do
          expect { subject.each { |z| z } }.not_to raise_error
        end
      end
    end
  end
end
