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

class Comment < ApplicationRecord
  belongs_to :entry

  validates :body, presence: true
  validates :status, inclusion: {in: %w(approved unapproved)}

  def approved?
    self.status == "approved"
  end

  def approve
    self.status = "approved"
  end
end
