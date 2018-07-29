class UsersController < ApplicationController
    def my_portfolio
        @user = current_user                    # Session of current user
        @user_stocks = current_user.stocks      # Grab all stocks under current users
    end

end