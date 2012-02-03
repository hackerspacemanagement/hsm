FactoryGirl.define do

  factory :user, :class => User do
    email                   'first_name.last_name@example.com'
    password                'password'
    password_confirmation   'password'
  end
  
  factory :tool do
      name                  'Bench Grinder'
      identification_number '35498 322010'
      description           'Central Machinery 37822 (6" grinder)'
      location              'Woodworking Bench'
  end

  factory :associate_member, :class => Member do
    first_name        "Student"
    last_name         "Member"
    email             "student.member@heatsynclabs.org"
    membership_level  "Associate"
    active            true
  end

  factory :basic_member, :class => Member do
    first_name        "Basic"
    last_name         "Member"
    email             "basic.member@heatsynclabs.org"
    membership_level  "Basic"
    active            true
  end

  factory :premium_member, :class => Member do
    first_name        "Premium"
    last_name         "Member"
    email             "premium.member@heatsynclabs.org"
    membership_level  "Premium"
    active            true
  end
  
end
