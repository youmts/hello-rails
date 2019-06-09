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

class Entry < ApplicationRecord
  belongs_to :blog
  has_many :comments
end
