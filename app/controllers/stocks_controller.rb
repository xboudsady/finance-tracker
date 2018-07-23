class StocksController < ApplicationController

    def search
        @stock = Stock.new_form_lookup(params[:stock])
        render 'users/my_portfolio'
    end

end