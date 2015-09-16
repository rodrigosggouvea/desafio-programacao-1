class Merchant < ActiveRecord::Base
  has_many :items
  validates :name, presence: true, uniqueness: { scope: :address }
  validates :address, presence: true, uniqueness: { scope: :name }
end
