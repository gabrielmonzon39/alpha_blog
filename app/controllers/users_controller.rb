class UsersController < ApplicationController

    before_action :find_user, only:[:edit, :update, :show]
    before_action :require_admin, only:[:destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Hello #{@user.user}!"
            redirect_to user_path(@user)
        else
            render ('new')
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Account Updated Successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page:5)
    end

    def index
        @users = User.paginate(page: params[:page], per_page:5)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:succes] = "User and user's articles deleted."
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:user,:email,:password)
    end

    def find_user
        @user = User.find(params[:id])
    end

    def require_admin
        if logged_in? && !current_user.admin?
            flash[:danger] = "You must be an admin for this"
            redirect_to root_path
        end
    end
end