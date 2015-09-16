class Sale < ActiveRecord::Base
  has_many :items, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :items
  validates :income, presence: true
end
