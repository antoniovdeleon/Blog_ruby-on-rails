class UsersController < ApplicationController
	before_filter :authorize, only: [:show]
	# form to create new user
  def new
  	if current_user
  		redirect_to profile_path
  	else
	  	@user = User.new
	  	render :new
	  end
  end

  # creates new user in database
  def create
  	if current_user
  		redirect_to profile_path
  	else
	   	user = User.new(user_params)
	  	if user.save
	  		# keep track of user by adding it to session
	  		session[:user_id] = user.id
	  		# redirect_to '/profile'
	  		redirect_to profile_path
	  	else
	  		# redirect_to '/signup'
	  		redirect_to signup_path
	  	end
  	end
  end

  # show current user
  def show
  	# don't really need this, but to make it explicit and defined 
  	render :show
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end
end
