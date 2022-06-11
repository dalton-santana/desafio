class FilterByStoreService
  def initialize(transactions)
    @transactions = transactions
  end

  def call
    stores = @transactions.group_by(&:store_name)

    result = {}

    # Soma de valores das transações para cada loja
    stores.each do |key, value|
      total = 0
      value.each do |transaction|
        # Se o valor do tipo transação for verdadeiro (entrada) é incrementado o valor da transação
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

    result
  end
end
