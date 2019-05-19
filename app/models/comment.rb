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
