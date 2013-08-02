class SessionsController < ApplicationController
	skip_before_filter :authorize, only: [:new, :create]
  def new
  end

  def create
		user = User.find_by_name(params[:name])
		respond_to do |format|
			if user and user.authenticate(params[:password])
				session[:user_id] = user.id
				format.html { redirect_to articles_url }
			else
				format.html { redirect_to login_url,
					notice: 'Invalid user name or password!' }
			end
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to articles_url
  end
end
