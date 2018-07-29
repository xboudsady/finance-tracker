class UserStocksController < ApplicationController
    
    def create                                                                     # Allows users to Create add a new records to the table
        stock = Stock.find_by_ticker(params[:stock_ticker])                        # Locate the stock ticker, using API
        if stock.blank?                                                            # If input is not blank, then look, and save record
            stock = Stock.new_from_lookup(params[:stock_ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)           # binds stock to user in user_stock model
        flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to portfolio"
        redirect_to my_portfolio_path                                              # Redirect to views/users/my_portfolio.html
    end


    def destroy
        stock = Stock.find(params[:id])                                            # Grab the stock base on the id
        @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first   # Find the association so we can delete it. Takes 2 params, user, and id of stock. where() returns association, not object, so we add .first() to return object 
        @user_stock.destroy                                                        # Destroy's the record in database
        flash[:notice] = "Stock was successfully removed from portolio"
        redirect_to my_portfolio_path                                              # Redirect to views/users/my_portfolio.html
    end

end
