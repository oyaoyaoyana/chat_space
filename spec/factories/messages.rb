FactoryGirl.define do

  factory :message do
    body       Faker::Lorem.sentence
    user       { build(:user)}
    group      { build(:group)}
  end

end
