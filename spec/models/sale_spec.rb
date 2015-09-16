require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe "Relationships" do
    it "has many items" do
      expect(build(:sale)).to respond_to(:items)
    end
  end
  describe "Validations" do
    context "income" do
      it "is not valid if it's nil" do
        expect(build(:sale, income: nil)).not_to be_valid
      end
      it "is valid otherwise" do
        expect(build(:sale, income: 10.0)).to be_valid
      end
    end
  end
end
