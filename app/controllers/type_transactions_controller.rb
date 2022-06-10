class TypeTransactionsController < ApplicationController
  before_action :set_type_transaction, only: [:show, :update, :destroy]

  # GET /type_transactions
  def index
    @type_transactions = TypeTransaction.all

    render json: @type_transactions
  end

  # GET /type_transactions/1
  def show
    render json: @type_transaction
  end

  # POST /type_transactions
  def create
    @type_transaction = TypeTransaction.new(type_transaction_params)

    if @type_transaction.save
      render json: @type_transaction, status: :created, location: @type_transaction
    else
      render json: @type_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_transactions/1
  def update
    if @type_transaction.update(type_transaction_params)
      render json: @type_transaction
    else
      render json: @type_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_transactions/1
  def destroy
    @type_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_transaction
      @type_transaction = TypeTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_transaction_params
      params.require(:type_transaction).permit(:type, :description, :label, :value)
    end
end
