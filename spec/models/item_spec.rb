require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Associations" do
    it "should belong to sale" do
      expect(build(:item)).to respond_to :sale
    end
    it "should belong to purchaser" do
      expect(build(:item)).to respond_to :purchaser
    end
    it "should belong to merchant" do
      expect(build(:item)).to respond_to :merchant
    end
  end
  describe "validations" do
    describe "description" do
      context "should be invalid if" do
        it "has a nil description" do
          item = build :item, description: nil
          expect(item).not_to be_valid
        end
      end
      context "should be valid if" do
        it "isn't nil" do
          item = build :item, description: "description"
          expect(item).to be_valid
        end
      end
    end
    describe "price" do
      context "should be invalid if" do
        it "has a nil price" do
          item = build :item, price: nil
          expect(item).not_to be_valid
        end
      end
      context "should be valid if" do
        it "isn't nil" do
          item = build :item, price: 2.0
          expect(item).to be_valid
        end
      end
    end
    describe "count" do
      context "should be invalid if" do
        it "has a nil count" do
          item = build :item, count: nil
          expect(item).not_to be_valid
        end
      end
      context "should be valid if" do
        it "isn't nil" do
          item = build :item, count: 2
          expect(item).to be_valid
        end
      end
    end
  end
end
