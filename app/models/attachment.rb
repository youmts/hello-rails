# == Schema Information
#
# Table name: attachments
#
#  id         :bigint           not null, primary key
#  attachment :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  belongs_to :entry
end
