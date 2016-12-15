require 'ffaker'
FactoryGirl.define do

  factory :message do
    body FFaker::Tweet.body
    image FFaker::Avatar.image
  end
  factory :empty_message , class: Message do
    body ""
  end
end
