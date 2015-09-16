class AddPurchaseAndMerchantToItems < ActiveRecord::Migration
  def change
    add_reference :items, :purchaser, index: true, foreign_key: true
    add_reference :items, :merchant, index: true, foreign_key: true
  end
end
