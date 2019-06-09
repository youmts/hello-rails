# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ApplicationRecord
  validates :title, presence: true
  has_many :entries
end
