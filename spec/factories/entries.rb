# == Schema Information
#
# Table name: entries
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer
#

FactoryBot.define do
  factory :entry do
    title {"entry"}
    body {"body"}
    blog

    trait :has_comments do
      transient {comments_count {5}}
      after(:create) do |entry, evaluator|
        create_list(:comment, evaluator.comments_count, entry: entry)
      end
    end
  end
end