# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  status     :string(255)      default("unapproved"), not null
#  entry_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :comment do
    body {"body"}
    status {:unapproved}
    entry
  end
end
