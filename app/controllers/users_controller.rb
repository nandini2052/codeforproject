class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if(@user.save)
      session[:user_id] = @user.id
      flash[:success] = "Welcome to my blog app #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    require_same_user
  end

  def update
    @user = User.find(params[:id])
    require_same_user
    if @user.update_attributes(user_params)
      flash[:success] = "Your details has been updated successfully"
      redirect_to houses_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_houses = @user.houses.paginate(page: params[:page], per_page: 5)
  end

  def index
    require_user
    @users = User.paginate(page: params[:page], per_page: 5)
  #  @houses = House.paginate(page: params[:page], per_page: 1)
  end

  def destroy
    require_same_user
    require_admin
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles have been deleted"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  

   def require_admin
     if logged_in? && !current_user.admin?
       flash[:danger] = "Only admin users can delete the account"
       redirect_to 'root_path'
     end
   end
end
