class RegistrationController < Devise::RegistrationsController
  def new
    @user= User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.phone_number = params[:user][:phone_number]
    @user.address = params[:user][:address]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]
    @user.role = 2
    @user.valid?
    if @user.errors.blank?
      @user.save
      redirect_to root_path
    else
      render :action => "new"
    end
  end
end
