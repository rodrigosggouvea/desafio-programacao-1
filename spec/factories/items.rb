FactoryGirl.define do
  factory :item do
    association :purchaser, factory: :purchaser
    association :merchant, factory: :merchant
    description "MyString"
    price 1.5
    count 1
  end

end
