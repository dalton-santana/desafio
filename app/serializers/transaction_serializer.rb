class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :date, :value, :cpf, :card, :hour, :store_manager, :store_name

  belongs_to :type_transaction

  def date
    object.date&.strftime('%d/%m/%Y')
  end
end
