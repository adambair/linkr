FactoryGirl.define do
  sequence :nickname do |n|
    "person#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do |f|
    f.nickname {Factory.next :nickname}
    f.email    {Factory.next :email}
    f.password 'password'
  end
end
