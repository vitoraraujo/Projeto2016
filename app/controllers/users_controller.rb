class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :checkUser, only: [:show] 
  
  def show
    @posts = @user.posts
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bem vindo! Conta criada!"
      log_in @user
      redirect_to @user
    else
      flash[:danger] = "Não foi possível criar conta"
      render 'new'
    end
  end

  def checkUser
    if !logged_in? || @user != current_user
      redirect_to root_path  
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end	

  def set_user
    @user = User.find(params[:id])
  end
end
