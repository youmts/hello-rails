# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  token                  :string(255)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable

  def self.find_for_google(auth)
    # googleから返されたemailが存在していたらそのユーザを、存在しなかったら新しくユーザを作る
    User.where(email: auth.info.email).first ||
      User.create(
                   uid: auth.uid,
                   email: auth.info.email,
                   token: auth.credentials.token,
                   password: Devise.friendly_token(20),
                   confirmed_at: Time.current
      )
  end
end
