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
  extend Enumerize

  belongs_to :entry

  validates :body, presence: true
  enumerize :status, in: %w(unapproved approved), predicates: true

  def approve
    self.status = :approved
  end
end
