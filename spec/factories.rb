FactoryGirl.define do

  factory :user, :class => User do
    first_name              'first_name'
    last_name               'last_name'
    email                   'first_name.last_name@example.com'
    password                'password'
    password_confirmation   'password'
  end
  
  factory :role do
  end
  
  factory :skill do
  end
  
  factory :tool do
      name 'Tool'
  end
  
  factory :tool_category do
  end
  
  factory :users_skill do
  end

  factory :user_action do
  end

  factory :badge do
  end

  factory :interest do
  end

end
