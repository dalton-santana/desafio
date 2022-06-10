class TransactionsController < ApplicationController
  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/by_store
  def by_store
    @transactions = Transaction.includes(:type_transaction).all

    render json: FilterByStoreService.new(@transactions).call
  end

  # POST /transactions
  def create
    render json: FormatTransactionService.new(params[:file]).call
  end
end
