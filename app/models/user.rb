class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,                # Using gem 'devise' to generate
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_stocks                                           # Many to Many relationship of stocks and user
  has_many :stocks, through: :user_stocks

  
  def stock_already_added?(ticker_symbol)                         # Check to see if user already has added the stock symbols
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end


  
  def under_stock_limit?                                          # Track the amount of stock listed a user can track
    (user_stocks.count < 10)                                      # Entries that exist in user stock table
  end  


  def can_add_stock?(ticker_symbol)                               # Add stock only if it meets these criteria
    under_stock_limit? && !stock_already_added?(ticker_symbol)    # Is it under limit, Is it tracking already?
  end

end
