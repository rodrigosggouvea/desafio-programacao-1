FactoryGirl.define do
  factory :item do
    association :purchaser, factory: :purchaser
    association :merchant, factory: :merchant
    association :sale, factory: :sale
    description "MyString"
    price 1.5
    count 1
  end

end
