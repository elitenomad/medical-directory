require "spec_helper"

module Medical
  module Directory
    RSpec.describe Instruction do
      let(:instruction) { Medical::Directory::Instruction.new }

      context "FEMALE_PATIENTS_COUNT" do
        describe "when format is valid" do
          it "processes a FEMALE_PATIENTS_COUNT command" do
            instruction = Medical::Directory::Instruction.parse("FEMALE_PATIENTS_COUNT")
            expect(instruction).to eq(:female_patients_count)
          end
        end

        describe "when format is invalid" do
          it "returns :invalid" do
            instruction = Medical::Directory::Instruction.parse("FEMALE_PATIENTS_COUNT_WRONG")
            expect(instruction).to eq(:invalid)
          end
        end
      end

      context "MALE_PATIENTS_COUNT" do
        describe "when format is valid" do
          it "processes a MALE_PATIENTS_COUNT command" do
            instruction = Medical::Directory::Instruction.parse("MALE_PATIENTS_COUNT")
            expect(instruction).to eq(:male_patients_count)
          end
        end

        describe "when format is invalid" do
          it "returns :invalid" do
            instruction = Medical::Directory::Instruction.parse("MALE_PATIENTS_COUNT_WRONG")
            expect(instruction).to eq(:invalid)
          end
        end
      end

      context "AVG_AGE_OF_MALE_PATIENTS" do
        describe "when format is valid" do
          it "processes a AVG_AGE_OF_MALE_PATIENTS command" do
            instruction = Medical::Directory::Instruction.parse("AVG_AGE_OF_MALE_PATIENTS")
            expect(instruction).to eq(:avg_age_of_male_patients)
          end
        end

        describe "when format is invalid" do
          it "returns :invalid" do
            instruction = Medical::Directory::Instruction.parse("AVG_AGE_OF_MALE_PATIENTS_WRONG")
            expect(instruction).to eq(:invalid)
          end
        end
      end

      context "AVG_AGE_OF_FEMALE_PATIENTS" do
        describe "when format is valid" do
          it "processes a AVG_AGE_OF_FEMALE_PATIENTS command" do
            instruction = Medical::Directory::Instruction.parse("AVG_AGE_OF_FEMALE_PATIENTS")
            expect(instruction).to eq(:avg_age_of_female_patients)
          end
        end

        describe "when format is invalid" do
          it "returns :invalid" do
            instruction = Medical::Directory::Instruction.parse("AVG_AGE_OF_FEMALE_PATIENTS_WRONG")
            expect(instruction).to eq(:invalid)
          end
        end
      end
    end
  end
end
