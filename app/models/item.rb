class Item < ActiveRecord::Base
  validates :description, presence: true
  validates :price, presence: true
  validates :count, presence: true
end
