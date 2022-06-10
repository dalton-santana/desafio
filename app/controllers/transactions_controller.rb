class TransactionsController < ApplicationController
  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/by_store
  def by_store
    @transactions = Transaction.includes(:type_transaction).all

    stores = @transactions.group_by(&:store_name)

    result = {}

    stores.each do |key, value|
      total = 0
      value.each do |transaction|
        if transaction.type_transaction.value
          total += transaction.value
        else
          total -= transaction.value
        end
      end

      result[key] = {
        transactions: ActiveModelSerializers::SerializableResource.new(value),
        total: total
      }
    end

    render json: result
  end

  # POST /transactions
  def create
    render json: FormatTransactionService.new(params[:file]).call
  end
end
