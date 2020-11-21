FactoryBot.define do
  factory :book do
    title { 'title' }
    body { 'body' }
    association :user
  end
end