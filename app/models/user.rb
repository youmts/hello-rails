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
