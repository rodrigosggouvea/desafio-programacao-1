require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "validations" do
    describe "name" do
      context "should be invalid if" do
        it "is nil" do
          merchant = build :merchant, name: nil
          expect(merchant).not_to be_valid
        end
        it "has a name-address pair that is not unique" do
          first_merchant = create :merchant
          merchant = build :merchant, name: first_merchant.name, address: first_merchant.address
          expect(merchant).not_to be_valid
        end
      end
      context "should be valid if" do
        it "has a unique name-address" do
          first_merchant = create :merchant, name: "First Merchant", address: "First Merchant's address"
          merchant = build :merchant, name: "Second Merchant", address: first_merchant.address
          expect(merchant).to be_valid
        end
      end
    end
    describe "address" do
      context "it should be invalid if" do
        it "is nil" do
          merchant = build :merchant, address: nil
          expect(merchant).not_to be_valid
        end
      end
    end
  end
end
