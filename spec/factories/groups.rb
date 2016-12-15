require 'ffaker'
require 'faker'
FactoryGirl.define do

  factory :group do
    name FFaker::Company.name

    # after(:create) do |group|
    #   create(:group_user, group: group, user: User.first)
    # end
  end
end
