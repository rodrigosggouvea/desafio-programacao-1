FactoryGirl.define do
  factory :item do
    purchaser
    merchant
    sale
    description "MyString"
    price 1.5
    count 1
  end

end
