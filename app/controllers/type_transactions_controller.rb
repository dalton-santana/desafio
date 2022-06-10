class TypeTransactionsController < ApplicationController
  # GET /type_transactions
  def index
    @type_transactions = TypeTransaction.all

    render json: @type_transactions
  end
end
