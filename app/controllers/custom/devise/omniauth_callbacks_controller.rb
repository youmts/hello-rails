class Custom::Devise::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    @user = User.find_for_google(request.env["omniauth.auth"])

    # check whether a user exists.
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google.data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
