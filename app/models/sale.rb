class Sale < ActiveRecord::Base
  has_many :items
  validates :income, presence: true
end
