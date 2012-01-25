FactoryGirl.define do

  factory :user do
    first_name              Faker::Name.first_name
    last_name               Faker::Name.last_name
    email                   Faker::Internet.email
    password                'password'
    password_confirmation   'password'
  end
  
  factory :role do
  end
  
  factory :skill do
  end
  
  factory :tool do
      name                  'Tool'
  end
  
  factory :tool_category do
  end
  
  factory :users_skill do
  end

end