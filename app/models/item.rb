class Item < ActiveRecord::Base
  belongs_to :sale
  belongs_to :purchaser
  belongs_to :merchant

  validates :description, presence: true
  validates :price, presence: true
  validates :count, presence: true
  
end
