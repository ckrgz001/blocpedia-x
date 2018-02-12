class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
    
    def index
      @users = User.paginate(:page => params[:page], :per_page => 5)
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.username.upcase}!"
        redirect_to user_path(@user)
      else
        render 'new' #or :new
      end
    end
      
    def edit
    end
  
    def update
      if @user.update(user_params)
        flash[:success] = "Info has been updated successfully."
        redirect_to articles_path
      else
        render :edit
      end 
    end
    
    def show
    end
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "User and all articles by user have been deleted."
      redirect_to users_path
    end

       
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end