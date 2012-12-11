module SessionsHelper
  def sign_in(user)
    #Sign the user in
    cookies[:remember_token] = { value: user.remember_token,
                                 expires: 20.years.from_now }
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    current_user = nil
    cookies[:remember_token] = ''
  end
end
