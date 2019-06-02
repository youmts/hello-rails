FactoryBot.define do
  factory :user do
    email {"tester@example.com"}
    password {"password"}
    confirmed_at {Time.current.yesterday}
  end
end
