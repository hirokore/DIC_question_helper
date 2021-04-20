module SessionsHelper
	def current_user
	@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		current_user.present?
	end

	def test_echo_session
    test_echo = "hello!session!"
  end
end
