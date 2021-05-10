
class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user.id)
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.id == current_user.id
        @user.update(user_params)
        flash[:success] = "Profile has been successfully updated!"
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    end

    def show
      @user = User.find(params[:id])  
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
