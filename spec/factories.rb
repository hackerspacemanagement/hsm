FactoryGirl.define do

  factory :user, :class => User do
    email                   'first_name.last_name@example.com'
    password                'password'
    password_confirmation   'password'
  end
  
  factory :role do
  end
  
  factory :skill do
  end
  
  factory :tool do
      name                  'Bench Grinder'
      identification_number '35498 322010'
      description           'Central Machinery 37822 (6" grinder)'
      location              'Woodworking Bench'
  end
  
  factory :tool_category do
  end
  
  factory :users_skill do
  end

end
