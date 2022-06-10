class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show update destroy]

  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    render json: FormatTransactionService.new(params[:file]).call
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transaction_params
    params.require(:transaction).permit(:file, :type_transaction_id, :date, :value, :cpf, :card, :hour,
                                        :store_manager, :store_name)
  end
end
