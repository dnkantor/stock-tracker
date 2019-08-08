class UsersController < ApplicationController
    def portfolio
        @user = current_user
        @user_stocks = current_user.stocks
    end

    def friends
        @friendships = current_user.friends
    end

    def search
        if params[:search_param].blank?
            flash.now[:danger] = "You entered an empty string."
        else
            @users = User.search(params[:search_param])
            @users = current_user.except_current_user(@users)
            flash.now[:danger] = "No users were found." if @users.blank?
        end 
        respond_to do |format|
            format.js { render partial: 'friends/result' }
        end
    end
    
    # def add_friend
    #     @user = params[:user]
    #     @friend = params[:friend]
    #     @user.friends << @friend
    #     redirect_to friends_path
    # end
end
