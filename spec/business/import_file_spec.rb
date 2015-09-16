require 'rails_helper'

describe ImportFile do
  context "Methods" do
    describe "#import" do
      it "converts a file into Sale, Items, Purchasers and Merchants, and returns the sum" do
        file = ActionDispatch::Http::UploadedFile.new({
          filename: 'example_input.tab',
          content_type: 'application/octet-stream',
          tempfile: File.new("#{Rails.root}/spec/support/example_input.tab")
        })
        sale = ImportFile.import(file)
        expect(sale).to be_valid
        expect(sale.items.any?).to eq(true)
        expect(sale.income).to eq(95.0)
      end
    end
    describe "parse" do
      it "parses a file row into a Merchant, a Purchaser and an Item record" do
        sale = create :sale
        row = {
          'purchaser name' => "João Silva",
          'item description' => "R$10 off R$20 of food",
          'item price' => "10.0",
          'purchase count' => "2",
          'merchant address' => "987 Fake St",
          'merchant name' => "Bob's Pizza"
          }
        item = ImportFile.parse(row, sale)
        expect(item.class).to eq(Item)
        expect(item).to be_valid
        expect(Purchaser.where(name: "João Silva").any?).to eq(true)
        expect(Merchant.where(name: "Bob's Pizza", address: "987 Fake St").any?).to eq(true)
      end
    end
    describe "update_income" do
      it "sets the sale's income" do
        item = create :item
        sale = item.sale
        ImportFile.update_income(sale)
        expect(sale.income).to eq(item.price)
      end
    end
  end
end