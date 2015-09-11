require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  describe "validations" do
    describe "name" do
      context "should be invalid if" do
        it "has a nil name" do
          purchaser = build :purchaser, name: nil
          expect(purchaser).not_to be_valid
        end
        it "has a name tha is not unique" do
          first_purchaser = create  :purchaser
          purchaser = build :purchaser, name: first_purchaser.name
          expect(purchaser).not_to be_valid
        end
      end
      context "should be valid if" do
        it "has a unique name" do
          purchaser = build :purchaser
          expect(purchaser).to be_valid
        end
      end
    end
  end
end
