# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :blog do
    title {"blog"}

    trait :has_entries do
      transient do
        entries_count {5}
      end

      after(:create) do |blog, evaluator|
        create_list(:entry, evaluator.entries_count, blog: blog)
      end
    end
  end
end