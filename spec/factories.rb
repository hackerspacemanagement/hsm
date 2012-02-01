FactoryGirl.define do
  
  factory :permission do
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
  
  factory :user, :class => User do
    first_name              'first_name'
    last_name               'last_name'
    email                   'first_name.last_name@example.com'
    password                'password'
    password_confirmation   'password'
  end
  
  factory :users_skill do
  end

end
