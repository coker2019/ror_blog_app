FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    post_counter { 0 }
  end
end
