# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
      title "MyString"
      notes "MyText"
      user_id 1
      location_id 1
    end
end