class SessionsController < ApplicationController
    
    def new
        
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if !user.nil? && user.authenticate(params[:session][:password])
            puts "User found"
            session[:user_id] = user.id
            flash[:success] = "Logged in successfully"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Bad credentials"
            render 'new'
        end
    end

   
    def destroy
        session[:user_id] = nil
        flash[:success] = "Logged out successfully"
        redirect_to root_path
    end

end