require 'test_helper'

class TypeTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_transaction = type_transactions(:one)
  end

  test "should get index" do
    get type_transactions_url, as: :json
    assert_response :success
  end

  test "should create type_transaction" do
    assert_difference('TypeTransaction.count') do
      post type_transactions_url, params: { type_transaction: { description: @type_transaction.description, label: @type_transaction.label, type: @type_transaction.type, value: @type_transaction.value } }, as: :json
    end

    assert_response 201
  end

  test "should show type_transaction" do
    get type_transaction_url(@type_transaction), as: :json
    assert_response :success
  end

  test "should update type_transaction" do
    patch type_transaction_url(@type_transaction), params: { type_transaction: { description: @type_transaction.description, label: @type_transaction.label, type: @type_transaction.type, value: @type_transaction.value } }, as: :json
    assert_response 200
  end

  test "should destroy type_transaction" do
    assert_difference('TypeTransaction.count', -1) do
      delete type_transaction_url(@type_transaction), as: :json
    end

    assert_response 204
  end
end
