class TransactionsController < ApplicationController
  @current_user = User.first
  def index
    @transactions = Transaction.all
  end



  def create
    @transaction = @current_user.transactions.new(transaction_params)

  end


    private

    def transaction_params
      params.require(:transaction).permit(:sum, :country)
    end
end
